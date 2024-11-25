return {
    -- Fuzzy find ... everything
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        cmd = { "Telescope" },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-fzf-native.nvim",
            "jvgrootveld/telescope-zoxide",
        },
        config = function()
            local ts = require("telescope")
            local actions = require("telescope.actions")
            local opts = {
                defaults = {
                    path_display = { "tail" },
                    prompt_prefix = "> ",
                    multi_icon = "*",
                    borderchars = { "-", "|", "-", "|", "+", "+", "+", "+" },
                    -- borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
                    -- borderchars = { "━", "┃", "━", "┃", "┏", "┓", "┛", "┗" },
                    -- borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
                    -- borderchars = { "▁", "▏", "▔", "▕", "🭇", "🬼", "🭗", "🭢" },
                    -- borderchars = { "▔", "▕", "▁", "▏", "🭽", "🭾", "🭿", "🭼" },
                    mappings = {
                        i = {
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                            ["<C-s>"] = "select_horizontal",
                            ["<C-q>"] = actions.smart_add_to_qflist + actions.open_qflist,
                            ["<ESC>"] = "close",
                        },
                    },
                    layout_strategy = "flex",
                    layout_config = {
                        width = 0.86,
                        -- height = 0.8,
                        horizontal = {
                            preview_width = 0.5,
                        },
                        flex = {
                            flip_columns = 120,
                        },
                    },
                    vimgrep_arguments = {
                        "rg",
                        "--color=never",
                        "--no-heading",
                        "--with-filename",
                        "--line-number",
                        "--column",
                        "--smart-case",
                        "--trim", -- remove indentation
                    },
                },
                pickers = {
                    find_files = {
                        find_command = {
                            "fd",
                            "--color=never",
                            "--type",
                            "file",
                            "-H",
                            "-d",
                            "8",
                            "--follow",
                            "--strip-cwd-prefix",
                            "--exclude={.git,.local,.mozilla,.themes,.rustup,.icons,.cargo,.cache,.vst,.vst3,.u-he,.vim,.wine,.wine32,.steam,*.png,*.jpg,*.gif}",
                        },
                    },
                    jumplist = {
                        show_line = false,
                        trim_text = true,
                    },
                    colorscheme = {
                        layout_config = {
                            width = 0.3,
                            height = 0.7,
                        },
                    },
                },
                extensions = {
                    zoxide = {
                        prompt_title = "Zoxide dirs",
                        -- Zoxide list command with score
                        list_command = "zoxide query -ls",
                        mappings = {
                            default = {
                                action = function(selection)
                                    vim.cmd.cd(selection.path)
                                end,
                                after_action = function(selection)
                                    -- print("Dir changed to " .. selection.path)
                                    vim.notify("Dir changed to " .. selection.path, 2)
                                end,
                            },
                            ["<C-t>"] = {
                                action = function(selection)
                                    vim.cmd.tcd(selection.path)
                                end,
                            },
                        },
                    },
                },
            }
            ts.setup(opts)
            ts.load_extension("fzf")
            ts.load_extension("zoxide")
        end,
    },
}
