return {
    -- Improves / fixes gx hotkey
    {
        "chrishrb/gx.nvim",
        cmd = { "Browse" },
        opts = {
            handlers = {
                plugin = false, -- open plugin links in lua (e.g. packer, lazy, ..)
                package_json = false, -- open dependencies from package.json
            },
            handler_options = {
                search_engine = "https://mirnir.com/search?q=",
            },
        },
    },
}
