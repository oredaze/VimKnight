return {
    -- Shows the level of indent that uses spaces
    {
        "lucastavaresa/simpleIndentGuides.nvim",
        config = function()
            require("simpleIndentGuides").setup("∙", " ") -- ∙┆
            vim.api.nvim_create_autocmd("FileType", {
                pattern = { "txt", "text" },
                command = "setlocal nolist",
            })
        end,
    },
}
