---@diagnostic disable
return {
    -- UI
    require("plugins.simpleindentguides"),
    require("plugins.transparent"),
    require("plugins.heirline.init"),
    require("plugins.alpha"),

    -- Basic functionality
    require("plugins.which-key"),
    require("plugins.cmp"),
    require("plugins.subversive"),
    require("plugins.guess-indent"),
    require("plugins.comment"),
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
    require("plugins.move"),
    require("plugins.multiple-cursors"),
    require("plugins.oil"),
    require("plugins.mini-files"),
    require("plugins.fm-nvim"),
    require("plugins.vim-godot"),
    require("plugins.vim-hjson"),

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
}
