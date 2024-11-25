return {
    -- Toggle the character at the end of a line
    {
        "saifulapm/commasemi.nvim",
        event = "CursorHold",
        init = function()
            vim.g.commasemi_disable_commands = true
        end,
        opts = {
            leader = "<leader>",
            keymaps = true,
            commands = false
        },
    },
}
