<div align="center">
  <h1>VimKnight</h1>
  <p>
    </a>
  </p>
</div>

<div align="center">
  
[![Neovim Minimum Version](https://img.shields.io/badge/Neovim-0.10-blueviolet.svg?style=flat-square&logo=Neovim&color=90E59A&logoColor=white)](https://github.com/neovim/neovim)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
    
</div>

<div align="center">
  <p>
    <img src="misc/logo.png" align="center" alt="Logo" />
  </p>
</div>

## Showcase

<img src="misc/1.png" />

<img src="https://github.com/oredaze/moksha.nvim/blob/main/screenshot.png" />

## Info

A personal neovim config, written from scratch. It is kinda like a neovim distribution, but much simpler. Maybe more like [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim).
- Neovim distributions are too overengineered. They split things amongst too many files with (imho) unnecessary cruft in the code. This one is simple and easy to hack. It is also fully featured. You can jump straight into using it. Maybe familiarize yourself with the keybindings first and install a language server or two.
- Tries not to override too many default keybindings or do anything too crazy. Notable exceptions are: `r` -> [subversive](https://github.com/svermeulen/vim-subversive)(use `s <Esc>` instead of `r`) this should be built into vim tbh; `f` -> [Pounce](https://github.com/rlane/pounce.nvim) low mental overhead hopping plugin; `t` -> [Trailblazer](https://github.com/LeonHeidelbach/trailblazer.nvim) you can still use `dt<char>` or similar, it only rebinds normal mode; `q` -> quit (macro is now `<C-q>`) because I jump in and out of files too much.
- Neatly ordered. 1 file per task: 1 for neovim settings, 1 for hotkeys, etc. and a directory for your plugin files
- To disable a plugin, comment it out in `plugin_list.lua`.
- It comes with a new colorscheme [moksha](https://github.com/oredaze/moksha.nvim).
- Don't bother keeping up with changes. This is best used as a basis for your own config, instead of starting from a clean neovim, which can be painful.

## Dependencies

Most of them are optional, except the first one

- `tar`, `unzip`, `curl` and `git` for [Mason](https://github.com/williamboman/mason.nvim)
- [fzf](https://github.com/junegunn/fzf) for fuzzy searching
- [fd](https://github.com/sharkdp/fd) for fzf file indexing
- [ripgrep](https://github.com/BurntSushi/ripgrep) for searching in your project
- [zoxide](https://github.com/ajeetdsouza/zoxide) for fast directory switching
- [lf](https://github.com/gokcehan/lf) external file manager integration
- [broot](https://github.com/Canop/broot) innovative file manager
- A terminal with fixed/fixable escape sequences (like foot, alacritty, st, etc.) to use `<Tab>` independently of `<C-i>` (and any other overlapping key you decide to bind). Guis also work.
