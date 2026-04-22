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

-- Load the plugins
require("lazy").setup(require("plugin_list"), require("plugins.lazynvim"))

-- Basic neovim settings
require("settings")

-- Hotkeys
require("hotkeys")

-- Autocmds
require("autocmds")
