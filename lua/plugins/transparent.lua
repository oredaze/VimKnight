return {
    -- Toggle transparency
    {
        "xiyaowong/transparent.nvim",
        opts = {
            extra_groups = {
                "VertSplit",
                "NormalFloat",
                "FloatTitle",
                "FloatBorder",
                "EndOfBuffer",
                "MsgArea",
                "SignColumn",
                "MarkSignHL",
                "GitSignsAdd",
                "GitSignsChange",
                "GitSignsDelete",
                "GitSignsTopdelete",
                "GitSignsChangedelete",
                "GitSignsUntracked",
            },
            exclude_groups = {
                "StatusLine",
                "markdownCodeBlock",
                "GitSignsAddInline",
                "GitSignsChangeLnInline",
                "GitSignsDeleteInline",
            },
        },
    },
}
