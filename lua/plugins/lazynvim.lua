return {
    defaults = {
        lazy = false, -- should plugins be lazy-loaded?
        version = "*", -- enable this to try installing the latest stable versions of plugins
    },
    ockfile = vim.fn.stdpath("data") .. "/lazy/lazy-lock.json",
    ui = {
        border = "rounded",
    },
    checker = {
        enabled = false, -- automatically check for plugin updates
        frequency = 10800, -- 3600 is 1 hour
    },
    change_detection = {
        -- automatically check for config file changes and reload the ui
        enabled = false,
        notify = false,
    },
    performance = {
        rtp = {
            ---@type string[] list any plugins you want to disable here
            disabled_plugins = {
                "matchit",
                "matchparen",
                "2html_plugin",
                "tohtml",
                "getscript",
                "getscriptPlugin",
                "gzip",
                "logipat",
                "netrw",
                "netrwFileHandlers",
                "netrwPlugin",
                "netrwSettings",
                "rrhelper",
                "spellfile_plugin",
                "tar",
                "tarPlugin",
                "vimball",
                "vimballPlugin",
                "zip",
                "zipPlugin",
                "tutor",
                "rplugin",
                "bugreport",
            },
        },
    },
}
