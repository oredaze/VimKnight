return {
    -- Fuzzy finder
    {
        "ibhagwan/fzf-lua",
        cmd = { "FzfLua" },
        config = function()
            require("fzf-lua").setup({
                hls = {
                    normal = "Normal",
                    border = "FloatBorder",
                    title = "FloatBorder",
                    preview_border = "FloatBorder",
                    preview_title = "FloatBorder",
                    header_text = "Normal",
                    path_linenr = "Comment",
                    path_colnr = "Comment",
                    dir_part = "Directory",
                    file_part = "Identifier",
                    live_prompt = "Normal",
                    buf_name = "Normal",
                    buf_nr = "Comment",
                    buf_id = "Comment",
                    buf_linenr = "Comment",
                    buf_flag_cur = "Comment",
                    buf_flag_alt = "Comment",
                    live_sym = "Statement",
                    search = "Statement",
                    fzf = {
                        prompt = "Normal",
                        cursorline = "PmenuSel",
                        separator = "FloatBorder",
                    },
                },
                winopts = {
                    height = 0.85,
                    width = 0.75,
                    row = 0.9,
                    col = 0,
                    fullscreen = false,
                    backdrop = 100,
                    -- border = vim.opt.winborder:get(),
                    border = { "+", "-" ,"+", "|", "+", "-", "+", "|" },
                    title_pos = "left",
                    treesitter = {
                        enabled = false,
                    },
                    preview = {
                        border = { "+", "-" ,"+", "|", "+", "-", "+", "|" },
                        wrap = false,
                        hidden = false,
                        layout = "vertical",
                        -- horizontal = "right:60%",
                        vertical = "up:60%",
                        -- flip_columns = 100,
                        title = true,
                        title_pos = "left",
                        scrollbar = false,
                        -- scrolloff = 0,
                        delay = 20,
                        winopts = {
                            number = false,
                            relativenumber = false,
                            cursorline = true,
                            cursorcolumn = false,
                            signcolumn = "no",
                            list = false,
                            foldenable = false,
                            foldmethod = "manual",
                        },
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
                fzf_opts = {
                    -- ["--separator"] = "─",
                    ["--layout"] = "default",
                    -- ["--unicode"] = true,
                },
                fzf_colors = {
                    false, -- inherit fzf colors that aren't specified below from
                    -- the auto-generated theme similar to `fzf_colors=true`
                    ["fg"]      = { "fg", "Normal" },
                    ["bg"]      = { "bg", "Normal" },
                    ["hl"]      = { "fg", "Statement" },
                    ["fg+"]     = { "fg", "StatusLine" },
                    ["bg+"]     = { "bg", "PmenuSel" },
                    ["hl+"]     = { "fg", "Statement" },
                    ["info"]    = { "fg", "Comment" },
                    ["prompt"]  = { "fg", "Comment" },
                    ["pointer"] = { "fg", "Exception" },
                    ["marker"]  = { "fg", "Exception" },
                    ["spinner"] = { "fg", "Comment" },
                    ["header"]  = { "fg", "Comment" },
                    ["gutter"]  = { "bg", "Gutter" },
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
                    fd_opts = "-t file -E '*.png' -E '*.jpg' -E '*.gif' -E '*.svg' -E '*.wav'",
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
                },
                lsp = {
                    symbols = {
                        symbol_style = 2,
                                symbol_icons     = {
                                    Array = "󱡠",
                                    Boolean = "",
                                    Class = "",
                                    Constant = "󰏿",
                                    Constructor = "",
                                    Enum = "",
                                    EnumMember = "",
                                    Event = "",
                                    Field = "",
                                    File = "",
                                    Function = "󰊕",
                                    Interface = "",
                                    Key = "",
                                    Method = "󰊕",
                                    Module = "",
                                    Namespace = "",
                                    Null = "󰟢",
                                    Number = "󰎠",
                                    Object = "",
                                    Operator = "",
                                    Package = "󰏖",
                                    Property = "",
                                    String = "󰉾",
                                    Struct = "",
                                    TypeParameter = "",
                                    Variable = "",
                                },
                    }
                }
            })
        end
    }
}
