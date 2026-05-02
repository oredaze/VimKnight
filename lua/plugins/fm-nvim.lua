return {
    -- Integrate external file managers into vim
    {
        "is0n/fm-nvim",
        cmd = { "Vifm", "Lf", "Broot", "Lazygit", "Ranger" },
        opts = {
            -- (Vim) Command used to open files
            edit_cmd = "edit",
            on_close = {},
            on_open = {},

            -- UI Options
            ui = {
                default = "float",
                float = {
                    border = { "+", "-" ,"+", "|", "+", "-", "+", "|" },
                    float_hl = "Normal",
                    border_hl = "FloatBorder",
                    blend = 0,
                    -- Num from 0 - 1
                    height = 0.85,
                    width = 0.5,
                    -- window position
                    x = 0,
                    y = 0.75,
                },
                split = {
                    direction = "topleft",
                    size = 50
                }
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
                -- ESC = ":q<CR>",
            },
            broot_conf = "~/.config/broot/vim_conf.hjson",
        },
    },
}
