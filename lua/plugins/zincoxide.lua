return {
    -- Fast directory switching
    {
        "thunder-coding/zincoxide",
        opts = {
            -- name of zoxide binary in your "$PATH" or path to the binary
            -- the command is executed using vim.fn.system()
            -- eg. "zoxide" or "/usr/bin/zoxide"
            zincoxide_cmd = "zoxide",
            -- Kinda experimental as of now
            complete = false,
            -- Available options { "tabs", "window", "global" }
            behaviour = "global",
        },
        cmd = { "Z", "Zg", "Zt", "Zw" },
    }
}
