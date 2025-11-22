# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Initial Nix flake implementation
- Home Manager module for vim_styled Hyprland configuration
- Complete Hyprland configuration files from qxb3/gruvbox.hypr vim_styled branch
- AGS (Aylurs Gtk Shell) widgets and configuration
- Neovim configuration with plugins
- Kitty terminal configuration
- Cava music visualizer configuration
- Wallpaper collection
- Nerd Fonts (JetBrains Mono, Iosevka, Cascadia Code)
- GitHub Actions workflow for CI/CD testing
- Comprehensive documentation:
  - NIX_README.md - Main documentation
  - QUICKSTART.md - Quick start guide
  - CONTRIBUTING.md - Contribution guidelines
  - example-flake.nix - Example configuration
- Module options for customization:
  - `enable` - Enable/disable the configuration
  - `enableAgs` - Enable/disable AGS widgets
  - `enableNvim` - Enable/disable Neovim config
  - `enableKitty` - Enable/disable Kitty config
  - `enableCava` - Enable/disable Cava config
  - `wallpaperDir` - Custom wallpaper directory
  - `extraPackages` - Additional packages to install

### Changed
- N/A (initial release)

### Deprecated
- N/A

### Removed
- N/A

### Fixed
- N/A

### Security
- N/A

## Notes

This is the initial release of the Nix module for the vim_styled Hyprland configuration.
The configuration is based on the vim_styled branch of [qxb3/gruvbox.hypr](https://github.com/qxb3/gruvbox.hypr).
