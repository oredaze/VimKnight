return {
    {
        "nvim-treesitter/nvim-treesitter-context",
        config = function()
            require'treesitter-context'.setup{
                mode = 'topline', -- cursor / topline
                separator = "⁻", -- ‾ ˉ ⁻
                vim.keymap.set("n", "g<space>", function()
                    require("treesitter-context").go_to_context(vim.v.count1)
                end, { silent = true, desc = "Go to context start" })
            }
        end
    },
}
