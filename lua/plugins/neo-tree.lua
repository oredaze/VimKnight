local function is_directory_opened()
    local arg = vim.fn.argv(0)
    return arg ~= "" and vim.fn.isdirectory(arg) == 1
end

return {
    -- File tree / explorer
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "MunifTanjim/nui.nvim", lazy = true },
        },
        lazy = true,
        cmd = "Neotree",
        -- Load the plugin when opening a directory
        event = function()
            if is_directory_opened() then
                return "VimEnter"
            end
        end,
        -- event = "VeryLazy",
        -- priority = 1000,
        init = function()
            vim.g.neo_tree_remove_legacy_commands = 1
        end,
        opts = {
            use_default_mappings = false,
            close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
            -- popup_border_style = "rounded",
            -- enable_git_status = true,
            -- enable_diagnostics = true,
            open_files_do_not_replace_types = { "terminal", "trouble", "qf" },
            sort_case_insensitive = true,
            -- sort_function = nil, -- use a custom function for sorting files and dirs in the tree
            -- sort_function = function (a,b)
            --    if a.type == b.type then
            --       return a.path > b.path
            --    else
            --       return a.type > b.type
            --    end
            -- end , -- this sorts files and directories descendantly
            default_component_configs = {
                -- container = {
                --    enable_character_fade = true,
                -- },
                indent = {
                    indent_size = 1,
                    padding = 0, -- extra padding on left hand side
                    -- indent guides
                    -- with_markers = true,
                    indent_marker = "│",
                    last_indent_marker = "└",
                    -- highlight = "NeoTreeIndentMarker",
                    -- expander config, needed for nesting files
                    with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
                    expander_collapsed = "",
                    expander_expanded = "",
                    -- expander_highlight = "NeoTreeArrors",
                },
                icon = {
                    folder_closed = "",
                    folder_open = "",
                    folder_empty = "",
                    -- The next two settings are only a fallback, if you use nvim-web-devicons
                    -- and configure default icons there then these will never be used.
                    default = "",
                    -- highlight = "NeoTreeFileIcon",
                },
                modified = {
                    symbol = "+",
                    -- highlight = "NeoTreeModified",
                },
                name = {
                    trailing_slash = true,
                    use_git_status_colors = false,
                    highlight_opened_files = "all",
                    -- highlight = "NeoTreeFileName",
                },
                git_status = {
                    symbols = {
                        -- Change type
                        added = "", -- or "✚", redundant if you use git_status_colors on the name
                        modified = "", -- or "", redundant if you use git_status_colors on the name
                        deleted = "", -- this can only be used in the git_status source
                        renamed = "", -- this can only be used in the git_status source
                        -- Status type
                        -- untracked = "",
                        -- ignored   = "",
                        unstaged = "",
                        staged = "",
                        -- conflict  = "",
                    },
                },
            },
            window = {
                -- position = "left",
                width = 24,
                -- mapping_options = {
                --    noremap = true,
                --    nowait = true,
                -- },
                mappings = {
                    -- disable `nowait` if you have existing combos starting with this char that you want to use
                    ["<2-LeftMouse>"] = "open_drop",
                    ["<cr>"] = "open_drop",
                    ["l"] = "open_drop",
                    ["f"] = "open_drop",
                    ["<Right>"] = "open_drop",
                    ["e"] = "open",
                    ["<C-s>"] = "open_split",
                    ["<C-v>"] = "open_vsplit",
                    ["<C-t>"] = "open_tab_drop",
                    -- ["f"] = "open_with_window_picker",
                    ["h"] = "close_node",
                    ["<Left>"] = "close_node",
                    -- ['C'] = 'close_all_subnodes',
                    ["za"] = "toggle_node",
                    ["zM"] = "close_all_nodes",
                    ["zR"] = "expand_all_nodes",
                    ["v"] = {
                        "toggle_preview",
                        config = { use_float = false, use_image_nvim = false },
                    },
                    -- ["v"] = { "one_preview", nowait = true, config = { use_float = false, use_image_nvim = false } },
                    -- ["<Tab>"] = "focus_preview",
                    ["a"] = {
                        "add",
                        -- this command supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc). see `:h neo-tree-file-actions`
                        -- some commands may take optional config options, see `:h neo-tree-mappings` for details
                        config = {
                            show_path = "none", -- "none", "relative", "absolute"
                        },
                    },
                    -- [""] = "add_directory", -- also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
                    ["D"] = "delete",
                    ["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
                    ["c"] = "rename",
                    ["y"] = "copy_to_clipboard",
                    ["p"] = "paste_from_clipboard",
                    -- ["x"] = "cut_to_clipboard",
                    -- ["Y"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
                    -- ["c"] = {
                    --	"copy",
                    --	config = {
                    --	show_path = "none" -- "none", "relative", "absolute"
                    --	}
                    --}
                    ["q"] = "close_window",
                    ["<Esc>"] = "close_window",
                    ["<C-r>"] = "refresh",
                    ["?"] = "show_help",
                    ["<"] = "prev_source",
                    [">"] = "next_source",
                    ["o"] = "system_open",
                },
            },
            -- nesting_rules = {},
            filesystem = {
                -- :h neo-tree-cwd
                bind_to_cwd = true,
                cwd_target = {
                    sidebar = "global",
                    current = "global",
                },
                -- Custom hotkey for xdg-open
                commands = {
                    system_open = function(state)
                        local node = state.tree:get_node()
                        local path = node:get_id()
                        vim.api.nvim_command(string.format("silent !xdg-open '%s'", path))
                    end,
                },
                -- Change root name
                components = {
                    name = function(config, node, state)
                        local result = require("neo-tree.sources.filesystem.components").name(
                            config,
                            node,
                            state
                        )
                        if node:get_depth() == 1 and node.type ~= "message" then
                            result.text = vim.fn.fnamemodify(node.path, ":t") .. "/"
                        end
                        return result
                    end,
                },
                filtered_items = {
                    visible = false, -- when true, they will just be displayed differently than normal items
                    hide_dotfiles = true,
                    hide_gitignored = true,
                    hide_by_name = {
                        --"node_modules"
                    },
                    hide_by_pattern = { -- uses glob style patterns
                        --"*.meta",
                        --"*/src/*/tsconfig.json",
                    },
                    always_show = { -- remains visible even if other settings would normally hide it
                        --".gitignored",
                    },
                    never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
                        --".DS_Store",
                        --"thumbs.db"
                    },
                    never_show_by_pattern = { -- uses glob style patterns
                        --".null-ls_*",
                    },
                },
                -- This will find and focus the file in the active buffer every
                -- time the current file is changed while the tree is open.
                follow_current_file = {
                    enabled = true,
                },
                -- when true, empty folders will be grouped together
                group_empty_dirs = false,
                -- "open_default": netrw disabled, opening a directory opens neo-tree in whatever position is specified in window.position
                -- "open_current": netrw disabled, opening a directory opens within the window like netrw would, regardless of window.position
                -- "disabled": netrw left alone, neo-tree does not handle opening dirs
                hijack_netrw_behavior = "open_current", -- open_current, disabled
                -- This will use the OS level file watchers to detect changes
                -- instead of relying on nvim autocmd events.
                use_libuv_file_watcher = true,
                window = {
                    mappings = {
                        ["u"] = "navigate_up",
                        ["d"] = "set_root",
                        ["<RightMouse>"] = "set_root",
                        ["zh"] = "toggle_hidden",
                        ["."] = "toggle_hidden",
                        ["f"] = "fuzzy_finder",
                        -- ["<C-f>"] = "fuzzy_finder_directory",
                        ["/"] = "filter_on_submit",
                        ["#"] = "fuzzy_sorter", -- fuzzy sorting using the fzy algorithm
                        -- ["$"] = "fuzzy_sorter_directory",
                        ["F"] = "clear_filter",
                        ["[g"] = "prev_git_modified",
                        ["]g"] = "next_git_modified",
                    },
                    fuzzy_finder_mappings = {
                        -- define keymaps for filter popup window in fuzzy_finder_mode
                        ["<down>"] = "move_cursor_down",
                        ["<up>"] = "move_cursor_up",
                    },
                },
            },
            buffers = {
                -- This will find and focus the file in the active buffer every time
                -- the current file is changed while the tree is open.
                follow_current_file = {
                    enabled = true,
                },
                group_empty_dirs = true, -- when true, empty folders will be grouped together
                show_unloaded = true,
                window = {
                    mappings = {
                        ["D"] = "buffer_delete",
                        ["u"] = "navigate_up",
                        ["d"] = "set_root",
                        ["<RightMouse>"] = "set_root",
                    },
                },
            },
            git_status = {
                window = {
                    position = "float",
                    mappings = {
                        ["gA"] = "git_add_all",
                        ["gu"] = "git_unstage_file",
                        ["ga"] = "git_add_file",
                        ["gr"] = "git_revert_file",
                        ["gc"] = "git_commit",
                        ["gp"] = "git_push",
                        ["gg"] = "git_commit_and_push",
                    },
                },
            },
        },
    },
}
