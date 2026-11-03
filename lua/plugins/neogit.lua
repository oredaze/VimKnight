return {
    -- Git interface like magit
    {
        "NeogitOrg/neogit",
        lazy = true,
        dependencies = { "sindrets/diffview.nvim" },
        cmd = "Neogit",
    }
}
