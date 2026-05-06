return {
    "folke/zen-mode.nvim",
    opts = {
        window = {
            backdrop = 0.8, -- shade the backdrop of the Zen window
            -- height and width can be:
            -- * an absolute number of cells when > 1
            -- * a percentage of the width / height of the editor when <= 1
            -- * a function that returns the width or the height
            width = 100, -- width of the Zen window
            height = 0.95, -- height of the Zen window
            options = {
                signcolumn = "no", -- disable signcolumn
                number = false, -- disable number column
                relativenumber = false, -- disable relative numbers
                cursorline = true, -- disable cursorline
                -- cursorcolumn = true, -- disable cursor column
                -- foldcolumn = "0", -- disable fold column
                -- list = false, -- disable whitespace characters
            },
        },
        plugins = {
            options = {
                ruler = false,
                showcmd = false,
                laststatus = 0,
            }
        }
    }
}
