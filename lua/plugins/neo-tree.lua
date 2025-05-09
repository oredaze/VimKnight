return {
    -- File tree / explorer
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "MunifTanjim/nui.nvim", lazy = true },
        },
        opts = {
            close_if_last_window = true,
            popup_border_style = "single",
            sort_case_insensitive = true,
            use_default_mappings = false,

            default_component_configs = {
                diagnostics = {
                    symbols = {
                        hint = "󱩎",
                        info = "",
                        warn = "",
                        error = "󰨰",
                    },
                },
                indent = {
                    indent_size = 2,
                    padding = 0,
                    with_expanders = true,
                    expander_collapsed = "",
                    expander_expanded = "",
                },
                icon = {
                    folder_closed = "",
                    folder_open = "",
                    folder_empty = "",
                    folder_empty_open = "",
                    default = "",
                },
                modified = {
                    symbol = "+",
                },
                name = {
                    trailing_slash = true,
                    highlight_opened_files = "all",
                    use_git_status_colors = false,
                },
                git_status = {
                    symbols = {
                        added     = "",
                        deleted   = "",
                        modified  = "",
                        renamed   = "",
                        -- untracked = "",
                        -- ignored   = "",
                        -- unstaged  = "󰄱",
                        staged    = "",
                        -- conflict  = "",
                    },
                },
            },

            event_handlers = {
                -- NOTE: restore alternate file for files opened with neo-tree
                {
                    event = "neo_tree_window_before_open",
                    handler = function()
                        vim.w.neo_tree_before_open_visible_buffer = vim.api.nvim_get_current_buf()
                    end,
                },
                {
                    event = "file_opened",
                    handler = function()
                        vim.fn.setreg("#", vim.w.neo_tree_before_open_visible_buffer)
                    end,
                },
            },

            window = {
                width = 22,
                mappings = {
                    ["<2-LeftMouse>"] = "open_drop",
                    ["<cr>"] = "open_drop",
                    ["l"] = "open_drop",
                    ["f"] = "open_drop",
                    ["<Right>"] = "open_drop",
                    ["e"] = "open",
                    ["<C-s>"] = "open_split",
                    ["<C-v>"] = "open_vsplit",
                    ["<C-t>"] = "open_tab_drop",
                    ["h"] = "close_node",
                    ["<Left>"] = "close_node",
                    ["za"] = "toggle_node",
                    ["zM"] = "close_all_nodes",
                    ["zR"] = "expand_all_nodes",
                    ["v"] = {
                        "toggle_preview",
                        config = { use_float = false, use_image_nvim = false },
                    },
                    ["a"] = {
                        "add",
                        config = {
                            show_path = "none",
                        },
                    },
                    ["D"] = "delete",
                    ["m"] = "move",
                    ["c"] = "rename",
                    ["y"] = "copy_to_clipboard",
                    ["p"] = "paste_from_clipboard",
                    ["q"] = "close_window",
                    ["<Esc>"] = "close_window",
                    ["<C-r>"] = "refresh",
                    ["?"] = "show_help",
                    ["<"] = "prev_source",
                    [">"] = "next_source",
                    ["o"] = "open",
                },
            },

            filesystem = {
                window = {
                    mappings = {
                        ["s"] = { "show_help", nowait=false, config = {
                            title = "Sort",
                            prefix_key = "s",
                        }},
                        ["sc"] = { "order_by_created", nowait = false },
                        ["sd"] = { "order_by_diagnostics", nowait = false },
                        ["sg"] = { "order_by_git_status", nowait = false },
                        ["sm"] = { "order_by_modified", nowait = false },
                        ["sn"] = { "order_by_name", nowait = false },
                        ["ss"] = { "order_by_size", nowait = false },
                        ["st"] = { "order_by_type", nowait = false },
                        ["u"] = "navigate_up",
                        ["<bs>"] = "navigate_up",
                        ["d"] = "set_root",
                        ["<RightMouse>"] = "set_root",
                        ["zh"] = "toggle_hidden",
                        ["."] = "toggle_hidden",
                        ["f"] = "fuzzy_finder",
                        ["/"] = "filter_on_submit",
                        ["#"] = "fuzzy_sorter",
                        ["F"] = "clear_filter",
                        ["[g"] = "prev_git_modified",
                        ["]g"] = "next_git_modified",
                        ["i"] = "show_file_details",
                        ["c"] = "rename_basename",
                    },
                    fuzzy_finder_mappings = {
                        ["<down>"] = "move_cursor_down",
                        ["<up>"] = "move_cursor_up",
                        ["<C-j>"] = "move_cursor_down",
                        ["<C-k>"] = "move_cursor_up",
                        ["<esc>"] = "close"
                    },
                },
                cwd_target = {
                    sidebar = "global",
                    current = "global",
                },
                hijack_netrw_behavior = "open_current",
            },

            buffers = {
                window = {
                    mappings = {
                        ["<bs>"] = "navigate_up",
                        ["u"] = "navigate_up",
                        ["D"] = "buffer_delete",
                        ["d"] = "set_root",
                        ["i"] = "show_file_details",
                        ["<RightMouse>"] = "set_root",
                        ["c"] = "rename_basename",
                        ["s"] = { "show_help", nowait=false, config = {
                            title = "Sort",
                            prefix_key = "s",
                        }},
                        ["sc"] = { "order_by_created", nowait = false },
                        ["sd"] = { "order_by_diagnostics", nowait = false },
                        ["sm"] = { "order_by_modified", nowait = false },
                        ["sn"] = { "order_by_name", nowait = false },
                        ["ss"] = { "order_by_size", nowait = false },
                        ["st"] = { "order_by_type", nowait = false },
                    },
                },
            },

            git_status = {
                window = {
                    mappings = {
                        ["gA"] = "git_add_all",
                        ["gu"] = "git_unstage_file",
                        ["ga"] = "git_add_file",
                        ["gr"] = "git_revert_file",
                        ["gc"] = "git_commit",
                        ["gp"] = "git_push",
                        ["gg"] = "git_commit_and_push",
                        ["i"] = "show_file_details",
                        ["c"] = "rename_basename",
                        ["s"] = { "show_help", nowait=false, config = {
                            title = "Sort",
                            prefix_key = "s",
                        }},
                        ["sc"] = { "order_by_created", nowait = false },
                        ["sd"] = { "order_by_diagnostics", nowait = false },
                        ["sm"] = { "order_by_modified", nowait = false },
                        ["sn"] = { "order_by_name", nowait = false },
                        ["ss"] = { "order_by_size", nowait = false },
                        ["st"] = { "order_by_type", nowait = false },
                    },
                },
            },

        }
    },
}
