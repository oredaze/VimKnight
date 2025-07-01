return {
    -- LSP symbols tree navigation
    {
        "hedyhli/outline.nvim",
        cmd = { "Outline", "OutlineOpen" },
        opts = {
            outline_window = {
                -- The default split commands used are 'topleft vs' and 'botright vs'
                -- depending on `position`. You can change this by providing your own
                -- `split_command`.
                -- `position` will not be considered if `split_command` is non-nil.
                -- This should be a valid vim command used for opening the split for the
                -- outline window. Eg, 'rightbelow vsplit'.
                -- split_command = nil,
                -- Percentage or integer of columns
                width = 35,
                -- Whether width is relative to the total width of nvim
                -- When relative_width = true, this means take 25% of the total
                -- screen width for outline window.
                relative_width = false,
                -- Auto close the outline window if goto_location is triggered and not for
                -- peek_location
                auto_close = false,
                -- Automatically scroll to the location in code when navigating outline window.
                auto_jump = false,
                -- boolean or integer for milliseconds duration to apply a temporary highlight
                -- when jumping. false to disable.
                jump_highlight_duration = 300,
                -- Whether to center the cursor line vertically in the screen when
                -- jumping/focusing. Executes zz.
                center_on_jump = true,
                -- true/false/'focus_in_outline'/'focus_in_code'.
                -- The last two means only show cursorline when the focus is in outline/code.
                -- 'focus_in_outline' can be used if the outline_items.auto_set_cursor
                -- operations are too distracting due to visual contrast caused by cursorline.
                show_cursorline = "focus_in_outline",
                -- Enable this only if you enabled cursorline so your cursor color can
                -- blend with the cursorline, in effect, as if your cursor is hidden
                -- in the outline window.
                -- This makes your line of cursor have the same color as if the cursor
                -- wasn't focused on the outline window.
                -- This feature is experimental.
                hide_cursor = false,
                -- Whether to auto-focus on the outline window when it is opened.
                -- Set to false to *always* retain focus on your previous buffer when opening
                -- outline.
                -- If you enable this you can still use bangs in :Outline! or :OutlineOpen! to
                -- retain focus on your code. If this is false, retaining focus will be
                -- enforced for :Outline/:OutlineOpen and you will not be able to have the
                -- other behaviour.
                focus_on_open = true,
                -- Winhighlight option for outline window.
                -- See :help 'winhl'
                -- To change background color to "CustomHl" for example, use "Normal:CustomHl".
                winhl = "",
            },

            outline_items = {
                -- Show extra details with the symbols (lsp dependent) as virtual next
                show_symbol_details = true,
                -- Show corresponding line numbers of each symbol on the left column as
                -- virtual text, for quick navigation when not focused on outline.
                show_symbol_lineno = false,
                -- Whether to highlight the currently hovered symbol and all direct parents
                highlight_hovered_item = false,
                -- Whether to automatically set cursor location in outline to match
                -- location in code when focus is in code. If disabled you can use
                -- `:OutlineFollow[!]` from any window or `<C-g>` from outline window to
                -- trigger this manually.
                auto_set_cursor = true,
                -- Autocmd events to automatically trigger these operations.
                auto_update_events = {
                    -- Includes both setting of cursor and highlighting of hovered item.
                    -- The above two options are respected.
                    -- This can be triggered manually through `follow_cursor` lua API,
                    -- :OutlineFollow command, or <C-g>.
                    follow = { "CursorMoved" },
                    -- Re-request symbols from the provider.
                    -- This can be triggered manually through `refresh_outline` lua API, or
                    -- :OutlineRefresh command.
                    items = {
                        "InsertLeave",
                        "WinEnter",
                        "BufEnter",
                        "BufWinEnter",
                        "TabEnter",
                        "BufWritePost",
                    },
                },
            },

            -- Options for outline guides which help show tree hierarchy of symbols
            guides = {
                enabled = true,
                markers = {
                    -- It is recommended for bottom and middle markers to use the same number
                    -- of characters to align all child nodes vertically.
                    bottom = "└",
                    middle = "├",
                    vertical = "│",
                },
            },

            symbol_folding = {
                -- Depth past which nodes will be folded by default. Set to false to unfold all on open.
                autofold_depth = 1,
                -- When to auto unfold nodes
                auto_unfold = {
                    -- Auto unfold currently hovered symbol
                    hovered = true,
                    -- Auto fold when the root level only has this many nodes.
                    -- Set true for 1 node, false for 0.
                    only = true,
                },
                markers = { "▶", "▽" },
            },

            preview_window = {
                -- Automatically open preview of code location when navigating outline window
                auto_preview = false,
                -- Automatically open hover_symbol when opening preview (see keymaps for
                -- hover_symbol).
                -- If you disable this you can still open hover_symbol using your keymap
                -- below.
                open_hover_on_preview = false,
                -- width = 50,		 -- Percentage or integer of columns
                -- min_width = 50, -- This is the number of columns
                -- Whether width is relative to the total width of nvim.
                -- When relative_width = true, this means take 50% of the total
                -- screen width for preview window, ensure the result width is at least 50
                -- characters wide.
                relative_width = true,
                -- Border option for floating preview window.
                -- Options include: single/double/rounded/solid/shadow or an array of border
                -- characters.
                -- See :help nvim_open_win() and search for "border" option.
                -- border = "rounded",
                border = { "+", "-" ,"+", "|", "+", "-", "+", "|" },
                -- winhl options for the preview window, see ':h winhl'
                -- winhl = 'NormalFloat:',
                -- Pseudo-transparency of the preview window, see ':h winblend'
                -- winblend = 0,
            },

            -- These keymaps can be a string or a table for multiple keys.
            -- Set to `{}` to disable. (Using 'nil' will fallback to default keys)
            keymaps = {
                -- show_help = '?',
                -- close = {'<Esc>', 'q'},
                -- Jump to symbol under cursor but keep focus on outline window.
                peek_location = "v",
                -- Jump to symbol under cursor.
                -- It can auto close the outline window when triggered, see
                -- 'auto_close' option above.
                goto_location = "f",
                -- Visit location in code and close outline immediately
                goto_and_close = "<Cr>",
                -- Change cursor position of outline window to match current location in code.
                -- 'Opposite' of goto/peek_location.
                -- restore_location = '<C-g>',
                -- Open LSP/provider-dependent symbol hover information
                hover_symbol = "s",
                -- Preview location code of the symbol under cursor
                toggle_preview = "p",
                -- rename_symbol = 'r',
                code_actions = "x",
                -- These fold actions are collapsing tree nodes, not code folding
                fold = { "h", "Left" },
                unfold = { "l", "Right" },
                fold_toggle = { "za", "<2-LeftMouse>" },
                -- Toggle folds for all nodes.
                -- If at least one node is folded, this action will fold all nodes.
                -- If all nodes are folded, this action will unfold all nodes.
                fold_toggle_all = "zA",
                fold_all = "zM",
                unfold_all = "zR",
                fold_reset = "<C-r>",
            },

            providers = {
                priority = { "lsp", "markdown", "norg" },
                lsp = {
                    -- Lsp client names to ignore
                    blacklist_clients = {},
                },
            },

            symbols = {
                -- Filter by kinds (string) for symbols in the outline.
                -- Possible kinds are the Keys in the icons table below.
                -- A filter list is a string[] with an optional exclude (boolean) field.
                -- The symbols.filter option takes either a filter list or ft:filterList
                -- key-value pairs.
                -- Put	exclude=true	in the string list to filter by excluding the list of
                -- kinds instead.
                -- Include all except String and Constant:
                --	 filter = { 'String', 'Constant', exclude = true }
                -- Only include Package, Module, and Function:
                --	 filter = { 'Package', 'Module', 'Function' }
                -- See more examples below.
                filter = nil,
                -- You can use a custom function that returns the icon for each symbol kind.
                -- This function takes a kind (string) as parameter and should return an
                -- icon as string.
                icon_fetcher = nil,
                -- 3rd party source for fetching icons. Fallback if icon_fetcher returned
                -- empty string. Currently supported values: 'lspkind'
                icon_source = nil,
                -- The next fallback if both icon_fetcher and icon_source has failed, is
                -- the custom mapping of icons specified below. The icons table is also
                -- needed for specifying hl group.
                icons = {
                    Array = { icon = "", hl = "Constant" },
                    Boolean = { icon = " ", hl = "Boolean" },
                    Class = { icon = "", hl = "Type" },
                    Component = { icon = "󰅴", hl = "Function" },
                    Constant = { icon = "", hl = "Constant" },
                    Constructor = { icon = "", hl = "Special" },
                    Enum = { icon = "", hl = "Type" },
                    EnumMember = { icon = "", hl = "Identifier" },
                    Event = { icon = "", hl = "Type" },
                    Field = { icon = "", hl = "Identifier" },
                    File = { icon = "", hl = "Identifier" },
                    Fragment = { icon = "󰅴", hl = "Constant" },
                    Function = { icon = "󰊕", hl = "Function" },
                    Interface = { icon = "", hl = "Type" },
                    Key = { icon = "", hl = "Type" },
                    Macro = { icon = "", hl = "Function" },
                    Method = { icon = "", hl = "Function" },
                    Module = { icon = "", hl = "Include" },
                    Namespace = { icon = "", hl = "Include" },
                    Null = { icon = "󰟢", hl = "Type" },
                    Number = { icon = "", hl = "Number" },
                    Object = { icon = "", hl = "Type" },
                    Operator = { icon = "", hl = "Operator" },
                    Package = { icon = "󰏖", hl = "Include" },
                    Parameter = { icon = " ", hl = "Identifier" },
                    Property = { icon = "", hl = "Identifier" },
                    StaticMethod = { icon = " ", hl = "Function" },
                    String = { icon = "󰉾", hl = "String" },
                    Struct = { icon = "", hl = "Structure" },
                    TypeAlias = { icon = "", hl = "Type" },
                    TypeParameter = { icon = "", hl = "Identifier" },
                    Variable = { icon = "", hl = "Identifier" },
                },
            },
        },
    },
}
