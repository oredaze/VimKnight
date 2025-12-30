---@diagnostic disable
return {
    -- Colorschemes
    require("plugins.colorschemes.moksha"),

    -- UI
    require("plugins.alpha"),
    require("plugins.heirline.init"),
    require("plugins.which-key"),
    require("plugins.simpleindentguides"),
    require("plugins.colorful-winsep"),
    require("plugins.virt-column"),
    require("plugins.transparent"),
    require("plugins.fix-auto-scroll"),

    -- Basic functionality
    require("plugins.subversive"),
    require("plugins.guess-indent"),
    require("plugins.autopairs"),
    require("plugins.gx"),
    require("plugins.log-hl"),
    require("plugins.boole"),
    require("plugins.matchparen"),
    require("plugins.marks"),
    require("plugins.trailblazer"),
    require("plugins.numb"),
    require("plugins.pounce"),
    require("plugins.undotree"),
    require("plugins.zincoxide"),
    require("plugins.multiple-cursors"),
    require("plugins.mini-ai"),
    require("plugins.mini-move"),
    require("plugins.mini-files"),
    require("plugins.oil"),
    require("plugins.fm-nvim"),
    require("plugins.fzf-lua"),
    require("plugins.toggleterm"),
    require("plugins.bigfile"),
    require("plugins.vim-godot"),
    require("plugins.vim-hjson"),

    -- Developer tools
    require("plugins.outline"),
    require("plugins.gitsigns"),
    require("plugins.treesj"),
    require("plugins.treesitter-context"),

    -- Smart code
    require("plugins.lsp"),
    require("plugins.blink-cmp"),
}
