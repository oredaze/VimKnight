return {
    -- Toggle code block single line/multiline
    {
        "Wansmer/treesj",
        cmd = { "TSJToggle" },
        config = function()
            local tsj = require("treesj")
            -- local langs = {  }
            tsj.setup({
                use_default_keymaps = false,
            })
        end,
    },
}
