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
                    synchronize = '<C-s>',
                    show_help = '?',
                },
                options = {
                    use_as_default_explorer = false,
                    permanent_delete = true,
                },
                windows = {
                    width_focus = 25,
                    preview = false,
                    width_preview = 75,
                },
                content = { prefix = function() end }
            }
            local go_in_plus = function()
                for _ = 1, vim.v.count1 do
                --- @diagnostic disable-next-line
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
                --- @diagnostic disable-next-line
                MiniFiles.refresh({ content = { filter = new_filter } })
            end

            -- Additional hotkeys
            vim.api.nvim_create_autocmd('User', {
                pattern = 'MiniFilesBufferCreate',
                callback = function(args)
                    local map_buf = function(lhs, rhs) vim.keymap.set('n', lhs, rhs, { buffer = args.data.buf_id }) end
                    local buf_id = args.data.buf_id
                    map_buf('<CR>', go_in_plus)
                    map_buf('<Right>', go_in_plus)
                --- @diagnostic disable-next-line
                    map_buf('<Left>', MiniFiles.go_out)
                    vim.keymap.set('n', '.', toggle_dotfiles, { buffer = buf_id })
                end,
            })

            -- Border style
            vim.api.nvim_create_autocmd('User', {
                pattern = 'MiniFilesWindowOpen',
                callback = function(args)
                    local win_id = args.data.win_id
                    local config = vim.api.nvim_win_get_config(win_id)
                    config.border = { "+", "-", "+", "|", "+", "-", "+", "|" }
                    vim.api.nvim_win_set_config(win_id, config)
                end,
            })

            -- Hack to synchronize on save :w
            vim.api.nvim_create_autocmd('User', {
                pattern = 'MiniFilesBufferCreate',
                callback = function(ev)
                    vim.schedule(function()
                        local buf = ev.data.buf_id
                        vim.api.nvim_set_option_value('buftype', 'acwrite', { buf = buf })
                        vim.api.nvim_buf_set_name(buf, 'minifiles://' .. buf)
                        vim.api.nvim_create_autocmd('BufWriteCmd', {
                            buffer = buf,
                            callback = function()
                                require('mini.files').synchronize()
                            end,
                        })
                    end)
                end,
            })

        end,
    },
}
