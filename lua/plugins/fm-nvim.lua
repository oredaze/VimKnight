return {
    -- Integrate external file managers into vim
    {
        "is0n/fm-nvim",
        cmd = { "Vifm", "Lf", "Broot" },
        opts = {
            -- (Vim) Command used to open files
            edit_cmd = "edit",
            on_close = {},
            on_open = {},

            -- UI Options
            ui = {
                default = "float",
                float = {
                    border = neovim_borders,
                    float_hl = "Normal",
                    border_hl = "NonText",
                    blend = 0,
                    height = 1.1,
                    width = 0.4,
                    x = 0,
                    y = 0,
                },
                split = {
                    direction = "topleft",
                    size = 50
                }
            },

            -- Terminal commands used w/ file manager (have to be in your $PATH)
            cmds = {
                vifm_cmd = "vifm -c only",
                lf_cmd = "lf -command \":set preview false; set ratios 1\"",
                broot_cmd = "broot",
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
