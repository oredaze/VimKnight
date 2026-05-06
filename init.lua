--
--  ██▒   █▓    ██▓    ███▄ ▄███▓
-- ▓██░   █▒   ▓██▒   ▓██▒▀█▀ ██▒
--  ▓██  █▒░   ▒██▒   ▓██    ▓██░
--   ▒██ █░░   ░██░   ▒██    ▒██
--    ▒▀█░     ░██░   ▒██▒   ░██▒
--    ░ ▐░     ░▓     ░ ▒░   ░  ░
--    ░ ░░      ▒ ░   ░  ░      ░
--      ░       ▒ ░   ░      ░
--       ░      ░            ░
--
-- Install lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Basic neovim settings
require("settings")

-- Load the plugins
require("lazy").setup(require("plugin_list"), require("plugins.lazynvim"))

-- Hotkeys
require("hotkeys")

-- Autocmds
require("autocmds")

-- Colors early detection
if vim.env.DISPLAY == nil then
    vim.opt.termguicolors = false
    vim.cmd([[colorscheme 16bits]])
else
    vim.opt.termguicolors = true
    vim.cmd([[colorscheme muted_fire]])
end
