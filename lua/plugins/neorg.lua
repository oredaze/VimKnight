return {
    -- Note taking and organization powerhouse
    {
        "nvim-neorg/neorg",
        ft = "norg",
        version = "*", -- Pin Neorg to the latest stable release
        build = ":Neorg sync-parsers",
        opts = {
            load = {
                ["core.clipboard.code-blocks"] = {},
                ["core.esupports.hop"] = {},
                ["core.keybinds"] = {},
                ["core.pivot"] = {},
                ["core.qol.todo_items"] = {},
                ["core.concealer"] = {
                    config = {
                        icons = {
                            delimiter = {
                                horizontal_line = {
                                    left = "window",
                                    right = "textwidth",
                                },
                            },
                            heading = {
                                -- icons = { "󰓎", "󰓐", "󰓒", "󰫣", "󰫥", "󱞩" }
                                -- icons = { "󰯁", "󰯂", "󰯃", "󰑷", "", "󱞩" }
                                icons = { "󰻃", "󰺕", "󰄰", "󱥸", "󱞩", "󱞩" }
                            },
                            todo = {
                                undone = { icon = " " },
                                uncertain = { icon = "" },
                                urgent = { icon = "󰚌" },
                                recurring = { icon = "󰑐" },
                                pending = { icon = "󱦟" },
                                on_hold = { icon = "󰏤" },
                                cancelled = { icon = "󰩺" },
                            },
                            ordered = {
                                icons = { "1.", "a.", "i.", "(1)", "A.", "I." }
                            },
                            definition = {
                                multi_prefix = { icon = "󰶻" },
                                multi_suffix = { icon = "󰶺" },
                            },
                            code_block = {
                                content_only = true,
                                width = "content",
                                -- If `true` will conceal (hide) the `@code` and `@end`
                                conceal = true,

                                nodes = { "ranged_verbatim_tag" },
                                highlight = "markdownCodeBlock",
                                insert_enabled = true,
                            },
                        }
                    },
                },
                ["core.text-objects"] = {},
                ["core.dirman"] = { -- Manages Neorg workspaces
                    config = {
                        workspaces = {
                            notes = "~/notes",
                        },
                        default_workspace = "notes",
                        index = "in.norg",
                    },
                },
            },
        },
        dependencies = {
            { "nvim-lua/plenary.nvim"},
            { "nvim-neorg/neorg-telescope" },
        },
    },
}
