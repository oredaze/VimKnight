return {
    -- Integrate external file managers into vim
    {
        "is0n/fm-nvim",
        cmd = { "Vifm", "Lf", "Broot", "Lazygit", "Ranger" },
        opts = {

            -- (Vim) Command used to open files
            edit_cmd = "edit",
            -- See `Q&A` for more info
            on_close = {},
            on_open = {},

            -- UI Options
            ui = {
                default = "float",
                float = {
                    border = "none",
                    -- border = { " ", " " ," ", " ", " ", " ", " ", " " },
                    -- border = { "+", "-" ,"+", "|", "+", "-", "+", "|" },
                    -- border = { "┌", "─" ,"┐", "│", "┘", "─", "└", "│" },
                    float_hl = "Normal",
                    border_hl = "FloatBorder",
                    -- Floating Window Transparency (see ':h winblend')
                    blend = 0,
                    -- Num from 0 - 1 for measurements
                    height = 1.06, -- this is a bug
                    width = 1,
                    -- X and Y Axis of Window
                    x = 0.5,
                    y = 0.5,
                },
            },

            -- Terminal commands used w/ file manager (have to be in your $PATH)
            cmds = {
                vifm_cmd = "vifm",
                lf_cmd = "lf", -- eg: lf_cmd = "lf -command 'set hidden'"
                broot_cmd = "broot",
                ranger_cmd = "ranger",
                lazygit_cmd = "lazygit",
            },

            -- Mappings used with the plugin
            mappings = {
                vert_split = "<C-v>",
                horz_split = "<C-s>",
                tabedit = "<C-t>",
                edit = "<C-e>",
                ESC = "q",
            },

            -- Path to broot config
            broot_conf = "~/.config/broot/vim_conf.hjson",
        },
    },
}
