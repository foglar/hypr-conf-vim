<div align="center">
  <img src="https://raw.githubusercontent.com/qxb3/conf/refs/heads/main/repo/logo.png" width="80%" />

  &ensp;[<kbd> <br> Ink <br> </kbd>](#------ink----)&ensp;
  &ensp;[<kbd> <br> Yume <br> </kbd>](#------yume----)&ensp;
  &ensp;[<kbd> <br> Groove <br> </kbd>](#------groove----)&ensp;
  &ensp;[<kbd> <br> Vim <br> </kbd>](#------vim----)&ensp;
  &ensp;[<kbd> <br> Kami <br> </kbd>](#------kami----)&ensp;
  &ensp;[<kbd> <br> Ishi <br> </kbd>](#------ishi----)&ensp;
  &ensp;[<kbd> <br> Focused <br> </kbd>](#------focused----)&ensp;
</div>

<details open>
  <summary>
    <h2>
      <a href="https://github.com/qxb3/conf/tree/ink">Ink</a>
    </h2>
  </summary>

  <img align="center" width="100%" src="https://raw.githubusercontent.com/qxb3/gruvbox.hypr/ink/repo/1.png" />
  <br><br>
  <img align="center" width="100%" src="https://raw.githubusercontent.com/qxb3/gruvbox.hypr/ink/repo/2.png" />
</details>

<details open>
  <summary>
    <h2>
      <a href="https://github.com/qxb3/conf/tree/yume">Yume</a>
    </h2>
  </summary>

  <img align="center" width="100%" src="https://raw.githubusercontent.com/qxb3/gruvbox.hypr/yume/repo/1.png" />
  <br><br>
  <img align="center" width="100%" src="https://raw.githubusercontent.com/qxb3/gruvbox.hypr/yume/repo/2.png" />
</details>

<details open>
  <summary>
    <h2>
      <a href="https://github.com/qxb3/conf/tree/retro">Retro</a>
    </h2>
  </summary>

  <img align="center" width="100%" src="https://raw.githubusercontent.com/qxb3/gruvbox.hypr/retro/repo/2.png" />
  <br><br>
  <img align="center" width="100%" src="https://raw.githubusercontent.com/qxb3/gruvbox.hypr/retro/repo/4.png" />
</details>

<details open>
  <summary>
    <h2>
      <a href="https://github.com/qxb3/conf/tree/groove">Groove</a>
    </h2>
  </summary>

  <img align="center" width="100%" src="https://raw.githubusercontent.com/qxb3/gruvbox.hypr/groove/repo/1.png" />
  <br><br>
  <img align="center" width="100%" src="https://raw.githubusercontent.com/qxb3/gruvbox.hypr/groove/repo/8.png" />
</details>

<details open>
  <summary>
    <h2>
      <a href="https://github.com/qxb3/conf/tree/vim_styled">Vim</a> - 🎉 <a href="./NIX_README.md">Now Available as Nix Module!</a>
    </h2>
  </summary>

  <img align="center" width="100%" src="https://raw.githubusercontent.com/qxb3/gruvbox.hypr/vim_styled/repo/1.png" />
  <br><br>
  <img align="center" width="100%" src="https://raw.githubusercontent.com/qxb3/gruvbox.hypr/vim_styled/repo/5.png" />
  
  <br><br>
  <p align="center">
    <b>✨ The vim_styled configuration is now available as a Nix flake! ✨</b><br>
    See <a href="./NIX_README.md">NIX_README.md</a> for installation instructions.
  </p>
</details>

<details open>
  <summary>
    <h2>
      <a href="https://github.com/qxb3/conf/tree/calm">Calm</a>
    </h2>
  </summary>

  <img align="center" width="100%" src="https://raw.githubusercontent.com/qxb3/gruvbox.hypr/calm/repo/1.png" />
</div>

<details open>
  <summary>
    <h2>
      <a href="https://github.com/qxb3/conf/tree/kami">Kami</a>
    </h2>
  </summary>

  <img align="center" width="100%" src="https://raw.githubusercontent.com/qxb3/gruvbox.hypr/kami/repo/1.png" />
</div>

<details open>
  <summary>
    <h2>
      <a href="https://github.com/qxb3/conf/tree/ishi">Ishi</a>
    </h2>
  </summary>

  <img align="center" width="100%" src="https://raw.githubusercontent.com/qxb3/gruvbox.hypr/ishi/repo/1.png" />
</details>

<details open>
  <summary>
    <h2>
      <a href="https://github.com/qxb3/conf/tree/hana">Hana</a>
    </h2>
  </summary>

  <img align="center" width="100%" src="https://raw.githubusercontent.com/qxb3/gruvbox.hypr/hana/repo/1.png" />
</details>

<details open>
  <summary>
    <h2>
      <a href="https://github.com/qxb3/conf/tree/focused">Focused</a>
    </h2>
  </summary>

  <img align="center" width="100%" src="https://raw.githubusercontent.com/qxb3/gruvbox.hypr/focused/repo/1.png" />
</details>

# Nix Module for Vim Styled Configuration

This repository now includes a **Nix flake** and **Home Manager module** for the vim_styled Hyprland configuration!

📚 **Documentation:**
- [NIX_README.md](./NIX_README.md) - Complete documentation for the Nix module
- [QUICKSTART.md](./QUICKSTART.md) - Quick start guide to get up and running
- [example-flake.nix](./example-flake.nix) - Example configuration file

🚀 **Quick Install:**
```nix
{
  inputs.hypr-conf-vim.url = "github:foglar/hypr-conf-vim";
  
  # In your home-manager configuration:
  programs.hyprland-vim-styled.enable = true;
}
```

# Contribution

Feel free to fork and make a pr :D

See [CONTRIBUTING.md](./CONTRIBUTING.md) for contribution guidelines.
