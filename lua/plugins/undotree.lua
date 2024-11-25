return {
    {
        "mbbill/undotree",
        cmd = { "UndotreeToggle" },
        init = function()
            vim.g.undotree_WindowLayout = 3
            vim.g.undotree_SetFocusWhenToggle = 0
            vim.g.undotree_SplitWidth = 38
            vim.g.undotree_SetFocusWhenToggle = 1
        end,
    },
}
