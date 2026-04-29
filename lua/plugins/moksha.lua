return {
    -- Rusty colorscheme
    {
        "oredaze/moksha.nvim",
        priority = 1000,
        config = function()
            require('moksha').setup {}
            -- Enable theme
            require('moksha').load()
        end
    }
}
