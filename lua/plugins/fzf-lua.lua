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
                    preview = {
                        border = { "-", "-", "-", " ", " ", " ", " ", "|" },
                        wrap = false,
                        hidden = false,
                        horizontal = "right:65%",
                        layout = "horizontal",
                        title = true,
                        title_pos = "left",
                        scrollbar = "float",
                        scrolloff = 0,
                        delay = 20,
                        winopts = {
                            number = true,
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
                    buf_name = "Constant",
                    file_part = "Constant",
                    buf_nr = "Normal",
                    buf_id = "Comment",
                    buf_linenr = "Comment",
                    buf_flag_cur = "Function",
                    buf_flag_alt = "Comment",
                    live_prompt = "Normal",
                    live_sym = "Statement",
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
                        -- preview extensions using a custom shell command:
                        extensions = {
                            ["png"] = { "chafa -f sixels --polite on -w 5" },
                            ["jpg"] = { "chafa -f sixels --polite on -w 5" },
                            ["gif"] = { "chafa -f sixels --polite on -w 5" },
                            ["svg"] = { "chafa -f sixels --polite on -w 5" },
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
                files = {
                    prompt = ': ',
                    file_icons = false,
                    cwd_prompt = false,
                    toggle_hidden_flag = "--hidden",
                    hidden = false,
                },
                git = {
                    prompt = ': ',
                    file_icons = false,
                },
            })
        end
    }
}
