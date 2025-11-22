# Vim Styled Hyprland Configuration - Nix Module

A Nix flake providing a [Home Manager](https://github.com/nix-community/home-manager) module for the beautiful vim_styled Hyprland configuration originally from [qxb3/gruvbox.hypr](https://github.com/qxb3/gruvbox.hypr).

![Vim Styled Preview](https://raw.githubusercontent.com/qxb3/gruvbox.hypr/vim_styled/repo/1.png)

## Features

- 🚀 **Easy Installation**: Import as a Home Manager module
- 📦 **Declarative Configuration**: Manage your Hyprland setup with Nix
- 🎨 **Beautiful Vim-Styled Theme**: Gruvbox-inspired aesthetic
- 🔧 **Modular**: Enable/disable components as needed
- ✅ **Tested**: GitHub Actions workflow ensures the module builds correctly

## Quick Start

### Using Flakes

Add this flake to your `flake.nix`:

```nix
{
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
    homeConfigurations."yourusername" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      modules = [
        hypr-conf-vim.homeManagerModules.vim-styled
        {
          home = {
            username = "yourusername";
            homeDirectory = "/home/yourusername";
            stateVersion = "24.05";
          };

          programs.hyprland-vim-styled = {
            enable = true;
          };
        }
      ];
    };
  };
}
```

Then activate the configuration:

```bash
home-manager switch --flake .#yourusername
```

## Configuration Options

The module provides several options to customize your setup:

```nix
programs.hyprland-vim-styled = {
  # Enable the vim_styled configuration
  enable = true;

  # Hyprland package to use (default: pkgs.hyprland)
  package = pkgs.hyprland;

  # Enable/disable components
  enableAgs = true;      # AGS widgets (default: true)
  enableNvim = true;     # Neovim configuration (default: true)
  enableKitty = true;    # Kitty terminal (default: true)
  enableCava = true;     # Cava music visualizer (default: true)

  # Custom wallpaper directory
  # wallpaperDir = ./my-wallpapers;

  # Additional packages to install
  extraPackages = with pkgs; [
    firefox
    spotify
  ];
};
```

## What's Included

This configuration includes:

### Applications
- **Hyprland**: Tiling Wayland compositor
- **Kitty**: GPU-accelerated terminal emulator
- **Neovim**: Highly configured text editor
- **AGS** (Aylurs Gtk Shell): Custom widgets and status bar
- **Cava**: Music visualizer
- **Neofetch**: System information display

### Utilities
- **swww**: Wallpaper daemon
- **hyprlock**: Screen locker
- **grimblast**: Screenshot tool
- **swappy**: Screenshot editor
- **brightnessctl**: Brightness control

### Visual
- **Gruvbox-inspired theme**: Warm, retro colors
- **Nerd Fonts**: JetBrains Mono, Iosevka, Cascadia Code
- **Custom wallpapers**: Beautiful backgrounds included

## Keybindings

See the [original documentation](https://github.com/qxb3/gruvbox.hypr/tree/vim_styled#keybindings) for the complete list of keybindings.

### Quick Reference

| Keys | Action |
| :--  | :-- |
| <kbd>Super</kbd> + <kbd>T</kbd> | Launch kitty terminal |
| <kbd>Super</kbd> + <kbd>Q</kbd> | Quit active window |
| <kbd>Super</kbd> + <kbd>A</kbd> | Toggle app launcher |
| <kbd>Super</kbd> + <kbd>C</kbd> | Toggle command mode |
| <kbd>Super</kbd> + <kbd>P</kbd> | Screenshot area |

## Development

### Testing Locally

```bash
# Check the flake
nix flake check

# Build the test configuration
nix build .#checks.x86_64-linux.module-builds

# Enter development shell
nix develop
```

### Running CI Tests

The repository includes GitHub Actions workflows that test:
- Flake evaluation and building
- Module import correctness
- Nix file formatting and parsing

See `.github/workflows/test.yaml` for details.

## Dependencies

The module automatically installs all required dependencies. Manual installation is not needed when using this Nix module.

<details>
<summary>Original dependencies list</summary>

**Applications:**
- kitty (terminal emulator)
- nemo (file explorer)
- grimblast (screenshot tool)
- swappy (screenshot editor & image viewer)
- firefox (browser)

**Rice:**
- swww (wallpaper daemon)
- hyprlock (screen locker)
- ags (Aylurs Gtk Shell)

**Shell:**
- zsh (main shell)
- neovim (text editor)
- neofetch (system info)
- cava (music visualizer)
- brightnessctl (brightness control)

**System:**
- gvfs (file system abstraction)
- NetworkManager (network management)

</details>

## Customization

### Using Your Own Wallpapers

```nix
programs.hyprland-vim-styled = {
  enable = true;
  wallpaperDir = ./my-wallpapers;
};
```

### Disabling Components

If you only want certain parts of the configuration:

```nix
programs.hyprland-vim-styled = {
  enable = true;
  enableAgs = false;     # Don't install AGS widgets
  enableNvim = false;    # Use your own Neovim config
};
```

### Adding Extra Packages

```nix
programs.hyprland-vim-styled = {
  enable = true;
  extraPackages = with pkgs; [
    discord
    spotify
    vlc
  ];
};
```

## Credits

- Original configuration by [qxb3](https://github.com/qxb3/gruvbox.hypr)
- Nix module adaptation by [foglar](https://github.com/foglar)

## License

See [LICENSE](LICENSE) file for details.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.
