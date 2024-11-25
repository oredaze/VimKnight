return {
    -- Blazingly fast code navigation
    {
        "LeonHeidelbach/trailblazer.nvim",
        cmd = "TrailBlazerNewTrailMark",
        opts = {
            lang = "en",
            auto_save_trailblazer_state_on_exit = false,
            auto_load_trailblazer_state_on_enter = false,
            custom_session_storage_dir = "~/.config/nvim/misc/trails", -- i.e. "~/trail_blazer_sessions/"
            trail_options = {
                -- The trail mark priority sets the global render priority of trail marks in the sign/number
                -- column as well as the highlights within the text (e.g. Treesitter sets a value of 100).
                -- Make sure this value is higher than any other plugin you use to ensure that trail marks
                -- are always visible and don't get overshadowed.
                trail_mark_priority = 10001,
                -- Available modes to cycle through. Remove any you don't need.
                available_trail_mark_modes = {
                    "global_chron",
                    "global_buf_linesh -c _sorted",
                    "global_fpath_line_sorted",
                    "global_chron_buf_line_sorted",
                    "global_chron_fpath_line_sorted",
                    "global_chron_buf_switch_group_chron",
                    "global_chron_bu--[[ f_ ]]switch_group_line_sorted",
                    "buffer_local_chron",
                    "buffer_local_line_sorted",
                },
                -- The current / initially selected trail mark selection mode. Choose from one of the
                -- available modes: global_chron, global_buf_line_sorted, global_chron_buf_line_sorted,
                -- global_chron_buf_switch_group_chron, global_chron_buf_switch_group_line_sorted,
                -- buffer_local_chron, buffer_local_line_sorted
                current_trail_mark_mode = "global_chron",
                current_trail_mark_list_type = "quickfix", -- currently only quickfix lists are supported
                trail_mark_list_rows = 10, -- number of rows to show in the trail mark list
                verbose_trail_mark_select = true, -- print current mode notification on mode change
                symbol_line_enabled = true, -- enable symbol characters in sign column altogether
                trail_mark_symbol_line_indicators_enabled = true, -- show indicators for all trail marks in symbol column
                mark_symbol = ".", -- will only be used if trail_mark_symbol_line_indicators_enabled = true
                newest_mark_symbol = "*", -- disable this mark symbol by setting its value to ""
                cursor_mark_symbol = "→", -- disable this mark symbol by setting its value to ""
                next_mark_symbol = "↓", -- disable this mark symbol by setting its value to ""
                previous_mark_symbol = "↑", -- disable this mark symbol by setting its value to ""
                multiple_mark_symbol_counters_enabled = false,
                number_line_color_enabled = false,
                trail_mark_in_text_highlights_enabled = true,
                default_trail_mark_stacks = {
                    -- this is the list of trail mark stacks that will be created by default. Add as many
                    -- as you like to this list. You can always create new ones in Neovim by using either
                    -- `:TrailBlazerSwitchTrailMarkStack <name>` or `:TrailBlazerAddTrailMarkStack <name>`
                    "default", -- , "stack_2", ...
                },
                available_trail_mark_stack_sort_modes = {
                    "alpha_asc", -- alphabetical ascending
                    "alpha_dsc", -- alphabetical descending
                    "chron_asc", -- chronological ascending
                    "chron_dsc", -- chronological descending
                },
                -- The current / initially selected trail mark stack sort mode. Choose from one of the
                -- available modes: alpha_asc, alpha_dsc, chron_asc, chron_dsc
                current_trail_mark_stack_sort_mode = "alpha_asc",
                -- Set this to true if you always want to move to the nearest trail mark first before
                -- continuing to peek move in the current selection mode order. This effectively disables
                -- the "current trail mark cursor" to which you would otherwise move first before continuing
                -- to move through your trail mark stack.
                move_to_nearest_before_peek = false,
                -- "up", "fpath_up" -> For more information see section "TrailBlazerMoveToNearest Motion Directives"
                move_to_nearest_before_peek_motion_directive_up = "fpath_up",
                -- "down", "fpath_down" -> For more information see section "TrailBlazerMoveToNearest Motion Directives"
                move_to_nearest_before_peek_motion_directive_down = "fpath_down",
                -- "man_dist", "lin_char_dist" -> Manhattan Distance or Linear Character Distance
                move_to_nearest_before_peek_dist_type = "lin_char_dist",
            },
            event_list = {
                -- Add the events you would like to add custom callbacks for here. For more information see section "Custom Events"
                -- "TrailBlazerTrailMarkStackSaved",
                -- "TrailBlazerTrailMarkStackDeleted",
                -- "TrailBlazerCurrentTrailMarkStackChanged",
                -- "TrailBlazerTrailMarkStackSortModeChanged"
            },
            force_mappings = {},
            -- rename this to "force_quickfix_mappings" to completely override default mappings and not merge with them
            quickfix_mappings = {
                nv = {
                    motions = {
                        qf_motion_move_trail_mark_stack_cursor = "f",
                    },
                    actions = {
                        qf_action_delete_trail_mark_selection = "d",
                        qf_action_save_visual_selection_start_line = "V",
                        qf_action_move_selected_trail_marks_down = "<C-j>",
                        qf_action_move_selected_trail_marks_up = "<C-k>",
                    },
                },
            },
            -- Your custom highlight group overrides go here
            hl_groups = {
                TrailBlazerTrailMark = {
                    -- link = "Statement"
                    guifg = "#FF8126",
                    guibg = "none",
                    gui = "bold",
                },
                TrailBlazerTrailMarkNext = {
                    guifg = "#FF8126",
                    guibg = "none",
                    gui = "bold",
                },
                TrailBlazerTrailMarkPrevious = {
                    guifg = "#FF8126",
                    guibg = "none",
                    gui = "bold",
                },
                TrailBlazerTrailMarkCursor = {
                    guifg = "Black",
                    guibg = "#FF4DD8", -- Current
                    gui = "bold",
                },
                TrailBlazerTrailMarkNewest = {
                    guifg = "Black",
                    guibg = "#FE3333", -- Blazing
                    gui = "bold",
                },
                TrailBlazerTrailMarkCustomOrd = {
                    guifg = "Black",
                    guibg = "LightSlateBlue",
                    gui = "bold",
                },
                TrailBlazerTrailMarkGlobalChron = {
                    guifg = "Black",
                    guibg = "#FF8126",
                    gui = "bold",
                },
                TrailBlazerTrailMarkGlobalBufLineSorted = {
                    guifg = "Black",
                    guibg = "Blue",
                    gui = "bold",
                },
                TrailBlazerTrailMarkGlobalChronBufLineSorted = {
                    guifg = "Black",
                    guibg = "Olive",
                    gui = "bold",
                },
                TrailBlazerTrailMarkGlobalChronBufSwitchGroupChron = {
                    guifg = "Black",
                    guibg = "Tan",
                    gui = "bold",
                },
                TrailBlazerTrailMarkGlobalChronBufSwitchGroupLineSorted = {
                    guifg = "Black",
                    guibg = "LightBlue",
                    gui = "bold",
                },
                TrailBlazerTrailMarkBufferLocalChron = {
                    guifg = "Black",
                    guibg = "Green",
                    gui = "bold",
                },
                TrailBlazerTrailMarkBufferLocalLineSorted = {
                    guifg = "Black",
                    guibg = "LightGreen",
                    gui = "bold",
                },
            },
        },
    },
}
