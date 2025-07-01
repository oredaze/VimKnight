return {
    -- File explorer
    {
        'echasnovski/mini.files',
        version = false,
        event = "VeryLazy",
        config = function()
            require('mini.files').setup {
                mappings = {
                    close = '<ESC>',
                    go_in_plus = 'l',
                    go_out_plus = '<BS>',
                    reset = 'gw',
                    reveal_cwd  = '@',
                    synchronize = 'W',
                    show_help = '?',
                },
                options = {
                    use_as_default_explorer = false,
                    permanent_delete = true,
                },
                windows = {
                    width_focus = 30,
                },
                content = { prefix = function() end }
            }
            local go_in_plus = function()
                for _ = 1, vim.v.count1 do
                    MiniFiles.go_in({ close_on_file = true })
                end
            end

            local show_dotfiles = true
            local filter_show = function(fs_entry) return true end
            local filter_hide = function(fs_entry)
                return not vim.startswith(fs_entry.name, '.')
            end
            local toggle_dotfiles = function()
                show_dotfiles = not show_dotfiles
                local new_filter = show_dotfiles and filter_show or filter_hide
                MiniFiles.refresh({ content = { filter = new_filter } })
            end

            vim.api.nvim_create_autocmd('User', {
                pattern = 'MiniFilesBufferCreate',
                callback = function(args)
                    local map_buf = function(lhs, rhs) vim.keymap.set('n', lhs, rhs, { buffer = args.data.buf_id }) end
                    local buf_id = args.data.buf_id
                    map_buf('<CR>', go_in_plus)
                    map_buf('<Right>', go_in_plus)
                    map_buf('<Left>', MiniFiles.go_out)
                    vim.keymap.set('n', '.', toggle_dotfiles, { buffer = buf_id })
                    -- Add extra mappings from *MiniFiles-examples*
                end,
            })

            vim.api.nvim_create_autocmd('User', {
                pattern = 'MiniFilesWindowOpen',
                callback = function(args)
                    local win_id = args.data.win_id
                    -- Customize window-local settings
                    local config = vim.api.nvim_win_get_config(win_id)
                    -- config.border = 'rounded'
                    config.border = { "+", "-", "+", "|", "+", "-", "+", "|" }
                    vim.api.nvim_win_set_config(win_id, config)
                end,
            })

        end,
    },
}
