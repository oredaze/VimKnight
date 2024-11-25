return {
    -- Improves / fixes gx hotkey
    {
        "chrishrb/gx.nvim",
        cmd = { "Browse" },
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            handlers = {
                plugin = false, -- open plugin links in lua (e.g. packer, lazy, ..)
                package_json = false, -- open dependencies from package.json
            },
        },
    },
}
