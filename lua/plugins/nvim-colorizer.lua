return {
    {
        "norcalli/nvim-colorizer.lua",
        ft = { "lua", "css" },
        config = function()
            if vim.g.neovide then
                require'colorizer'.setup { 'css' ; 'lua' ; }
            end
        end,
    },
}
