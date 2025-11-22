# Contributing to Vim Styled Hyprland Configuration

Thank you for your interest in contributing! This document provides guidelines for contributing to the Nix module for the vim_styled Hyprland configuration.

## How to Contribute

### Reporting Bugs

If you find a bug, please open an issue with:
- A clear description of the problem
- Steps to reproduce
- Expected vs actual behavior
- Your system information (NixOS version, Nix version, etc.)
- Relevant logs or error messages

### Suggesting Enhancements

We welcome suggestions for improvements! Please:
- Check if the suggestion already exists in issues
- Provide a clear description of the enhancement
- Explain why it would be useful
- Provide examples if applicable

### Pull Requests

1. **Fork the repository**
2. **Create a feature branch**: `git checkout -b feature/your-feature-name`
3. **Make your changes**
4. **Test your changes**: Ensure the flake builds and works correctly
5. **Commit your changes**: Use clear, descriptive commit messages
6. **Push to your fork**: `git push origin feature/your-feature-name`
7. **Open a Pull Request**

## Development Guidelines

### Testing Changes Locally

Before submitting a PR, test your changes:

```bash
# Check the flake
nix flake check

# Build the test configuration
nix build .#checks.x86_64-linux.module-builds

# Test with your own configuration
home-manager switch --flake .#youruser
```

### Code Style

- Follow existing code style and patterns
- Use meaningful variable and function names
- Add comments for complex logic
- Keep functions focused and single-purpose

### Nix Style

- Use `nixpkgs-fmt` for formatting:
  ```bash
  nix shell nixpkgs#nixpkgs-fmt
  nixpkgs-fmt .
  ```
- Follow [NixOS manual conventions](https://nixos.org/manual/nixpkgs/stable/#chap-conventions)
- Use `mkOption` with proper types and descriptions
- Document all module options

### Commit Messages

Use clear, descriptive commit messages:
- Start with a verb in present tense (Add, Fix, Update, etc.)
- Keep the first line under 50 characters
- Provide additional details in the body if needed

Examples:
```
Add support for custom wallpaper directory
Fix module import path in flake.nix
Update documentation for new options
```

## Project Structure

```
.
├── flake.nix              # Main flake definition
├── module.nix             # Home Manager module
├── example-flake.nix      # Example configuration
├── vim_styled/            # Upstream configuration files
│   ├── .config/          # Configuration files
│   ├── font/             # Fonts
│   └── scripts/          # Helper scripts
├── .github/
│   └── workflows/
│       └── test.yaml     # CI/CD workflow
├── NIX_README.md         # Main documentation
├── QUICKSTART.md         # Quick start guide
└── CONTRIBUTING.md       # This file
```

## Adding New Features

When adding new features to the module:

1. **Add module options** in `module.nix`:
   ```nix
   options.programs.hyprland-vim-styled.yourOption = mkOption {
     type = types.bool;
     default = false;
     description = "Description of your option";
   };
   ```

2. **Implement the feature** in the config section:
   ```nix
   config = mkIf cfg.enable {
     # Your implementation
   };
   ```

3. **Update documentation** in `NIX_README.md`

4. **Add tests** if applicable

5. **Test thoroughly** before submitting

## Updating Upstream Configuration

To update the vim_styled configuration from upstream:

```bash
# Clone the latest vim_styled branch
git clone --depth 1 --branch vim_styled https://github.com/qxb3/gruvbox.hypr /tmp/vim_styled

# Copy new files (be careful not to overwrite local changes)
cp -r /tmp/vim_styled/.config vim_styled/
cp -r /tmp/vim_styled/font vim_styled/
```

Then test that everything still works!

## Questions?

If you have questions about contributing:
- Open a discussion on GitHub
- Check existing issues and PRs
- Read the documentation

Thank you for contributing! 🙏
