# Quick Start Guide - Vim Styled Hyprland Configuration (Nix)

This guide will help you get started with the vim_styled Hyprland configuration using Nix.

## Prerequisites

- NixOS or Nix package manager installed on Linux
- Nix flakes enabled (see below if not already enabled)
- Basic understanding of Home Manager

## Enabling Flakes

If you haven't already enabled flakes, add this to your `~/.config/nix/nix.conf`:

```
experimental-features = nix-command flakes
```

Or for NixOS, add to `/etc/nixos/configuration.nix`:

```nix
nix.settings.experimental-features = [ "nix-command" "flakes" ];
```

## Installation Methods

### Method 1: Quick Test (Standalone Home Manager)

1. **Install Home Manager** (if not already installed):
   ```bash
   nix run home-manager/master -- init --switch
   ```

2. **Create a flake.nix** in `~/.config/home-manager/`:
   ```nix
   {
     description = "Home Manager configuration";

     inputs = {
       nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
       home-manager = {
         url = "github:nix-community/home-manager";
         inputs.nixpkgs.follows = "nixpkgs";
       };
       hypr-conf-vim = {
         url = "github:foglar/hypr-conf-vim";
         inputs.nixpkgs.follows = "nixpkgs";
       };
     };

     outputs = { nixpkgs, home-manager, hypr-conf-vim, ... }: {
       homeConfigurations."youruser" = home-manager.lib.homeManagerConfiguration {
         pkgs = nixpkgs.legacyPackages.x86_64-linux;
         modules = [
           hypr-conf-vim.homeManagerModules.vim-styled
           {
             home = {
               username = "youruser";
               homeDirectory = "/home/youruser";
               stateVersion = "24.05";
             };
             programs.hyprland-vim-styled.enable = true;
           }
         ];
       };
     };
   }
   ```

3. **Apply the configuration**:
   ```bash
   home-manager switch --flake ~/.config/home-manager#youruser
   ```

### Method 2: NixOS with Home Manager Module

If you're using NixOS with Home Manager as a module:

1. **Add the flake input** to your `/etc/nixos/flake.nix`:
   ```nix
   inputs.hypr-conf-vim = {
     url = "github:foglar/hypr-conf-vim";
     inputs.nixpkgs.follows = "nixpkgs";
   };
   ```

2. **Add the module** to your home-manager configuration:
   ```nix
   home-manager.users.youruser = { pkgs, ... }: {
     imports = [ hypr-conf-vim.homeManagerModules.vim-styled ];
     
     programs.hyprland-vim-styled = {
       enable = true;
     };
   };
   ```

3. **Rebuild**:
   ```bash
   sudo nixos-rebuild switch
   ```

## Customization

### Minimal Configuration

```nix
programs.hyprland-vim-styled = {
  enable = true;
};
```

### Custom Configuration

```nix
programs.hyprland-vim-styled = {
  enable = true;
  
  # Disable components you don't want
  enableAgs = false;      # Disable custom widgets
  enableNvim = false;     # Use your own Neovim config
  
  # Add extra packages
  extraPackages = with pkgs; [
    firefox
    spotify
    discord
    # your favorite apps
  ];
};
```

## First Launch

1. **Log out** of your current session
2. **Select Hyprland** from your display manager
3. **Log in**

You should see the vim_styled interface!

## Keybindings Cheat Sheet

| Keys | Action |
|------|--------|
| `Super + T` | Terminal (Kitty) |
| `Super + A` | App Launcher |
| `Super + C` | Command Mode |
| `Super + Q` | Close Window |
| `Super + Tab` | Sidebar |

See [NIX_README.md](./NIX_README.md) for the complete keybindings list.

## Troubleshooting

### Flake not found
Make sure you're using the correct GitHub URL and that flakes are enabled.

### Missing dependencies
The module should install all dependencies automatically. If something is missing, please open an issue.

### Display manager doesn't show Hyprland
Make sure Hyprland is properly installed:
```bash
which Hyprland
```

If not found, you may need to enable it system-wide on NixOS:
```nix
programs.hyprland.enable = true;
```

## Next Steps

- Read the full documentation in [NIX_README.md](./NIX_README.md)
- Check out the example configuration in [example-flake.nix](./example-flake.nix)
- Customize keybindings by copying and modifying the config files
- Join the community and share your setup!

## Getting Help

If you run into issues:
1. Check the [GitHub Issues](https://github.com/foglar/hypr-conf-vim/issues)
2. Read the [original vim_styled documentation](https://github.com/qxb3/gruvbox.hypr/tree/vim_styled)
3. Open a new issue with details about your problem

Enjoy your new vim_styled Hyprland setup! 🎉
