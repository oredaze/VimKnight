return {
    -- File manager as an actual vim buffer
    {
        "stevearc/oil.nvim",
        lazy = false,
        opts = {
            default_file_explorer = true, -- hijack netrw
            win_options = {
                relativenumber = true,
                number = true,
            },
            constrain_cursor = "name",
            -- Set to `false` to remove a keymap
            -- See :help oil-actions for a list of all available actions
            keymaps = {
                ["?"] = "actions.show_help",
                ["q"] = "actions.close",
                -- ["<C-s>"] = "actions.select_split",
                -- ["<C-v>"] = "actions.select_vsplit",
                -- ["<C-t>"] = "actions.select_tab",
                ["<CR>"] = "actions.select",
                ["<Backspace>"] = "actions.parent",
                ["gu"] = "actions.parent",
                ["gw"] = "actions.open_cwd",
                ["cw"] = "actions.cd",
                ["cd"] = "actions.cd",
                ["ct"] = "actions.tcd",
                ["zs"] = "actions.change_sort",
                ["zh"] = "actions.toggle_hidden",
                ["gx"] = "actions.open_external",
                ["<C-p>"] = "actions.preview",
                ["<C-l>"] = "actions.refresh",
            },
            use_default_keymaps = false,
            -- Configuration for the floating window in oil.open_float
            float = {
                border = { "+", "-", "+", "|", "+", "-", "+", "|" },
                -- border = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
            },
            -- Configuration for the actions floating preview window
            preview = {
                border = { "+", "-", "+", "|", "+", "-", "+", "|" },
                -- border = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
            },
            -- Configuration for the floating progress window
            progress = {
                border = { "+", "-", "+", "|", "+", "-", "+", "|" },
                -- border = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
            },
            keymaps_help = {
                border = { "+", "-", "+", "|", "+", "-", "+", "|" },
                -- border = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
            },
        },
    },
}
