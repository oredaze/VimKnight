<div align="center">
  <h1>VimKnight</h1>
  <p>
    </a>
  </p>
</div>

<div align="center">
  
[![Neovim Minimum Version](https://img.shields.io/badge/Neovim-0.12-blueviolet.svg?style=flat-square&logo=Neovim&color=90E59A&logoColor=white)](https://github.com/neovim/neovim)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
    
</div>

<div align="center">
  <p>
    <img src="misc/logo.png" align="center" alt="Logo" />
  </p>
</div>

## Showcase

<img src="https://github.com/oredaze/moksha.nvim/blob/main/screenshot.png" />

## Info

My personal neovim config, written from scratch. It is kinda like a neovim distribution, but much simpler.
- Neovim distributions are too overengineered. They split things amongst too many files with (imho) unnecessary cruft in the code. Changing them feels overwhelming. It is impossible to understand the codebase. This one is simple and easy to hack. It is also fully featured. You can jump straight into using it. Maybe familiarize yourself with the keybindings first.
- I spent a lot of time ensuring that the defaults are as sensible as possible (without sacrificing my own idiosyncracies).
- Use this as a starting point for your own config, instead of a clean neovim, which can be painful. Do not try to keep up to date with this repo. Neovim is supposed to be a personal editor.
- I try not to override too many default keybindings or do anything too weird. Notable exceptions are: `r` -> [subversive](https://github.com/svermeulen/vim-subversive)(use `s <Esc>` instead) this should be built into vim TBH; `f` -> [Pounce](https://github.com/rlane/pounce.nvim) low mental overhead hopping plugin; `q` -> quit (macro is now `<C-q>`) because I jump in and out of files too much.
- Neatly ordered. 1 file per task: 1 for neovim settings, 1 for hotkeys, etc. and one for each plugin.
- To disable a plugin, comment it out in `plugin_list.lua`.
- Works in the tty.
- *NOTE:* Only linux is supported. You will have to modify to fit the rest. I am not interested in other OSes.

## Dependencies

Most of them are optional, except the first one

- `tar`, `unzip`, `curl` and `git` for [Mason](https://github.com/williamboman/mason.nvim)
- [fzf](https://github.com/junegunn/fzf) for fuzzy searching
- [fd](https://github.com/sharkdp/fd) for fzf file indexing
- [ripgrep](https://github.com/BurntSushi/ripgrep) for grepping in your project
- [zoxide](https://github.com/ajeetdsouza/zoxide) for fast directory switching
- [vifm](https://github.com/vifm/vifm) external file manager
- [broot](https://github.com/Canop/broot) innovative file manager
- A terminal with fixed/fixable escape sequences (like foot, alacritty, st, etc.) to use `<Tab>` independently of `<C-i>` (and any other overlapping keys you decide to bind). GUIs also work
- [nerd font](https://www.nerdfonts.com/#home) for the sparce glyphs that are present
- [neovide](https://github.com/neovide/neovide) for a neovim GUI
