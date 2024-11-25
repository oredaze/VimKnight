return {
    -- Toggle transparency
    {
        "xiyaowong/transparent.nvim",
        opts = {
            extra_groups = {
                "VertSplit",
                "FloatTitle",
                "FloatBorder",
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
