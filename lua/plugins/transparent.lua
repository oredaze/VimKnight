return {
    -- Toggle transparency
    {
        "xiyaowong/transparent.nvim",
        opts = {
            extra_groups = {
                "NormalFloat",
                "EndOfBuffer",
                "MsgArea",
                "SignColumn",
                "MarkSignHL",
                "MarkSignNumHL",
                "GitSignsAdd",
                "GitSignsChange",
                "GitSignsDelete",
                "GitSignsTopdelete",
                "GitSignsChangedelete",
                "GitSignsUntracked",
                "MiniFilesNormal",
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
