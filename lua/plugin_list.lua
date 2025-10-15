---@diagnostic disable
return {
    -- Colorschemes
    require("plugins.colorschemes.moksha"),
    require("plugins.colorschemes.kanagawa"),
    require("plugins.colorschemes.oscura"),

    -- UI
    require("plugins.simpleindentguides"),
    require("plugins.transparent"),
    require("plugins.heirline.init"),
    require("plugins.alpha"),
    require("plugins.colorful-winsep"),

    -- Basic functionality
    require("plugins.which-key"),
    require("plugins.subversive"),
    require("plugins.guess-indent"),
    require("plugins.autopairs"),
    require("plugins.matchup"),
    require("plugins.gx"),
    require("plugins.log-hl"),
    require("plugins.boole"),
    require("plugins.marks"),
    require("plugins.trailblazer"),
    require("plugins.numb"),
    require("plugins.pounce"),
    require("plugins.undotree"),
    require("plugins.mini-move"),
    require("plugins.multiple-cursors"),
    require("plugins.oil"),
    require("plugins.mini-files"),
    require("plugins.fm-nvim"),
    require("plugins.vim-godot"),
    require("plugins.vim-hjson"),
    require("plugins.vim-ron"),
    require("plugins.toggleterm"),

    -- Telescope
    require("plugins.telescope"),
    require("plugins.plenary"),
    require("plugins.telescope-fzf-native"),
    require("plugins.zoxide"),

    -- Developer tools
    require("plugins.trouble"),
    require("plugins.outline"),
    require("plugins.gitsigns"),
    require("plugins.treesj"),

    -- Smart code
    require("plugins.lsp"),
    require("plugins.blink-cmp"),
}
