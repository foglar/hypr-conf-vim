{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.programs.hyprland-vim-styled;
  
  # Source directory containing the vim_styled configuration
  vimStyledSrc = ./vim_styled;
  
in
{
  options.programs.hyprland-vim-styled = {
    enable = mkEnableOption "vim_styled Hyprland configuration";

    package = mkOption {
      type = types.package;
      default = pkgs.hyprland;
      description = "Hyprland package to use";
    };

    enableAgs = mkOption {
      type = types.bool;
      default = true;
      description = "Enable AGS (Aylurs Gtk Shell) widgets";
    };

    enableNvim = mkOption {
      type = types.bool;
      default = true;
      description = "Enable Neovim configuration";
    };

    enableKitty = mkOption {
      type = types.bool;
      default = true;
      description = "Enable Kitty terminal configuration";
    };

    enableCava = mkOption {
      type = types.bool;
      default = true;
      description = "Enable Cava music visualizer configuration";
    };

    wallpaperDir = mkOption {
      type = types.path;
      default = "${vimStyledSrc}/.config/swww";
      description = "Directory containing wallpapers";
    };

    extraPackages = mkOption {
      type = types.listOf types.package;
      default = [];
      description = "Extra packages to install alongside the configuration";
    };
  };

  config = mkIf cfg.enable {
    # Install required packages
    home.packages = with pkgs; [
      # Core Hyprland ecosystem
      cfg.package
      hyprlock
      hypridle
      
      # Wallpaper and screenshots
      swww
      grimblast
      swappy
      
      # Terminal and shell tools
      kitty
      neofetch
      cava
      brightnessctl
      
      # File manager
      nemo
      
      # System utilities
      gvfs
      networkmanager
      
      # Fonts
      (nerdfonts.override { fonts = [ "JetBrainsMono" "Iosevka" "CascadiaCode" ]; })
    ] ++ (optionals cfg.enableAgs [
      ags
    ]) ++ cfg.extraPackages;

    # Hyprland configuration
    wayland.windowManager.hyprland = mkIf (cfg.package == pkgs.hyprland) {
      enable = true;
      package = cfg.package;
      
      # Copy configuration files
      extraConfig = ''
        # vim_styled Hyprland Configuration
        # This configuration is managed by the vim-styled Nix module
      '';
    };

    # Install configuration files
    home.file = {
      # Hyprland configuration
      ".config/hypr/hyprland.conf".source = "${vimStyledSrc}/.config/hypr/hyprland.conf";
      ".config/hypr/animations.conf".source = "${vimStyledSrc}/.config/hypr/animations.conf";
      ".config/hypr/keybindings.conf".source = "${vimStyledSrc}/.config/hypr/keybindings.conf";
      ".config/hypr/rules.conf".source = "${vimStyledSrc}/.config/hypr/rules.conf";
      ".config/hypr/theme.conf".source = "${vimStyledSrc}/.config/hypr/theme.conf";
      ".config/hypr/scripts".source = "${vimStyledSrc}/.config/hypr/scripts";
      
      # Wallpapers
      ".config/swww".source = cfg.wallpaperDir;
      
      # Neofetch
      ".config/neofetch".source = "${vimStyledSrc}/.config/neofetch";
    } // (optionalAttrs cfg.enableKitty {
      # Kitty terminal
      ".config/kitty/kitty.conf".source = "${vimStyledSrc}/.config/kitty/kitty.conf";
      ".config/kitty/theme.conf".source = "${vimStyledSrc}/.config/kitty/theme.conf";
    }) // (optionalAttrs cfg.enableCava {
      # Cava music visualizer
      ".config/cava".source = "${vimStyledSrc}/.config/cava";
    }) // (optionalAttrs cfg.enableAgs {
      # AGS configuration
      ".config/ags".source = "${vimStyledSrc}/.config/ags";
    }) // (optionalAttrs cfg.enableNvim {
      # Neovim configuration
      ".config/nvim".source = "${vimStyledSrc}/.config/nvim";
    });

    # Install fonts
    fonts.fontconfig.enable = true;
    
    # Optional: Install scripts
    home.file.".local/bin/hypr-scripts" = mkIf (builtins.pathExists "${vimStyledSrc}/scripts") {
      source = "${vimStyledSrc}/scripts";
      recursive = true;
    };

    # Environment variables for Hyprland
    home.sessionVariables = {
      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";
      XDG_SESSION_DESKTOP = "Hyprland";
      QT_QPA_PLATFORM = "wayland";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      MOZ_ENABLE_WAYLAND = "1";
    };
  };
}
