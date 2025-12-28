return {
    -- Toggle neovim terminals
    {
        {
            'akinsho/toggleterm.nvim',
            version = "*",
            config = function()
                require("toggleterm").setup({
                    open_mapping = [[<F4>]],
                })
            end

        }
    },
}
