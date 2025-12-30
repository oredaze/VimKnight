return {
    -- Toggle transparency
    {
        "xiyaowong/transparent.nvim",
        opts = {
            extra_groups = {
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
                "CursorLine",
                "CursorColumn",
                "markdownCodeBlock",
                "GitSignsAddInline",
                "GitSignsChangeLnInline",
                "GitSignsDeleteInline",
            },
        },
    },
}
