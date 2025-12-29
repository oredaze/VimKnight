return {
    {
        "ibhagwan/fzf-lua",
        cmd = { "FzfLua" },
        config = function()
            require("fzf-lua").setup({
                winopts = {
                    height = 0.50,
                    width = 1,
                    row = 1,
                    border = { "-", "-", "-", " ", " ", " ", " ", " " },
                    title_pos = "left",
                    treesitter = {
                        enabled = false,
                    },
                    preview = {
                        border = { "-", "-", "-", " ", " ", " ", " ", "|" },
                        wrap = false,
                        hidden = false,
                        layout = "horizontal",
                        horizontal = "right:60%",
                        -- vertical = "down:60%",
                        -- flip_columns = 100,
                        title = true,
                        title_pos = "left",
                        scrollbar = false,
                        -- scrolloff = 0,
                        delay = 20,
                        winopts = {
                            number = false,
                            relativenumber = false,
                            cursorline = false,
                            cursorcolumn = false,
                            signcolumn = "no",
                            list = false,
                            foldenable = false,
                            foldmethod = "manual",
                        },
                    },
                },
                hls = {
                    border = "FloatBorder",
                    title = "FloatBorder",
                    preview_border = "FloatBorder",
                    preview_title = "FloatBorder",
                    header_text = "Normal",
                    path_linenr = "Comment",
                    path_colnr = "Comment",
                    dir_part = "Directory",
                    file_part = "Normal",
                    buf_name = "Normal",
                    buf_nr = "Comment",
                    buf_id = "Comment",
                    buf_linenr = "Comment",
                    buf_flag_cur = "Normal",
                    buf_flag_alt = "Normal",
                    live_prompt = "Normal",
                    live_sym = "Statement",
                    search = "Operator",
                    fzf = {
                        separator = "FloatBorder",
                    },
                },
                previewers = {
                    builtin = {
                        syntax = true,
                        treesitter = {
                            enabled = false,
                        },
                        render_markdown = { enabled = false },
                        snacks_image = { enabled = false },
                    },
                },
                fzf_colors = {
                    true, -- inherit fzf colors that aren't specified below from
                    -- the auto-generated theme similar to `fzf_colors=true`
                    ["fg"]      = { "fg", "Normal" },
                    ["bg"]      = { "bg", "Normal" },
                    ["hl"]      = { "fg", "Operator" },
                    ["fg+"]     = { "fg", "Normal" },
                    ["bg+"]     = { "bg", "StatusLine" },
                    ["hl+"]     = { "fg", "Operator" },
                    ["info"]    = { "fg", "Comment" },
                    ["prompt"]  = { "fg", "Comment" },
                    ["pointer"] = { "fg", "Exception" },
                    ["marker"]  = { "fg", "Character" },
                    ["spinner"] = { "fg", "Comment" },
                    ["header"]  = { "fg", "Comment" },
                    ["gutter"]  = "-1",
                },
                keymap = {
                    builtin = {
                        ["<F1>"] = "toggle-help",
                        ["<C-z>"] = "toggle-fullscreen",
                        ["<C-p>"] = "toggle-preview",
                        ["<S-PageDown>"] = "preview-page-down",
                        ["<S-PageUp>"] = "preview-page-up",
                        ["<S-down>"] = "preview-down",
                        ["<S-up>"] = "preview-up",
                    },
                    fzf = {
                        ["ctrl-u"] = "unix-line-discard",
                        ["ctrl-f"] = "half-page-down",
                        ["ctrl-b"] = "half-page-up",
                        ["ctrl-a"] = "beginning-of-line",
                        ["ctrl-e"] = "end-of-line",
                        ["ctrl-w"] = "backward-kill-word",
                        ["ctrl-g"] = "first",
                    },
                },
                defaults = {
                    prompt = ': ',
                    file_icons = false,
                },
                files = {
                    formatter = "path.filename_first",
                    cwd_prompt = false,
                    toggle_hidden_flag = "--hidden",
                    hidden = false,
                },
                grep = {
                    hidden = false,
                    fzf_opts = {
                        ["--delimiter"] = ":",
                        ["--with-nth"] = "1,4..",
                    },
                },
                buffers = {
                    formatter = "path.filename_first",
                    sort_lastused = false,
                },
                lines = {
                    winopts = {
                        preview = {
                            hidden = true
                        }
                    },
                },
                blines = {
                    winopts = {
                        preview = {
                            hidden = true
                        }
                    }
                },
                marks = {
                    marks = "%a",
                    fzf_opts = {
                        ["--with-nth"] = "1,4..",
                    },
                },
                jumps = {
                    fzf_opts = {
                        ["--with-nth"] = "2,4..",
                    },
                }
            })
        end
    }
}
