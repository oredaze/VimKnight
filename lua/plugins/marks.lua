return {
    -- Improves vim marks
    {
        "chentoast/marks.nvim",
        event = "CursorHold",
        opts = {
            -- whether to map keybinds or not. default true
            default_mappings = false,
            -- which builtin marks to show. default {}
            -- builtin_marks = { ".", "<", ">", "^" },
            -- whether movements cycle back to the beginning/end of buffer. default true
            -- cyclic = true,
            -- whether the shada file is updated after modifying uppercase marks. default false
            force_write_shada = true,
            -- refresh_interval = 250,
            -- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
            -- marks, and bookmarks.
            -- can be either a table with all/none of the keys, or a single number, in which case
            -- the priority applies to all marks.
            -- default 10.
            sign_priority = { lower = 15, upper = 20, builtin = 8, bookmark = 10 },
            -- disables mark tracking for specific filetypes. default {}
            excluded_filetypes = { "neo-tree", "Outline", "Trouble", "Oil" },
            -- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
            -- sign/virttext. Bookmarks can be used to group together positions and quickly move
            -- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
            -- default virt_text is "".
            signs = true,
            bookmark_1 = {
                sign = "",
                annotate = false,
            },
            bookmark_2 = {
                sign = "",
                annotate = false,
            },
            bookmark_3 = {
                sign = "",
                annotate = false,
            },
            bookmark_4 = {
                sign = "",
                annotate = false,
            },
            bookmark_5 = {
                sign = "󰚀",
                annotate = false,
            },
            bookmark_6 = {
                sign = "",
                annotate = false,
            },
            bookmark_7 = {
                sign = "",
                annotate = false,
            },
            bookmark_8 = {
                sign = "",
                annotate = false,
            },
            bookmark_9 = {
                sign = "",
                annotate = false,
            },
            mappings = {
                toggle = false,
                delete = false,
                delete_line = "dm",
                delete_buf = "dM",
                delete_bookmark = "d-",
                annotate = "m;",
                next_bookmark1 = "]1",
                prev_bookmark1 = "[1",
                next_bookmark2 = "]2",
                prev_bookmark2 = "[2",
                next_bookmark3 = "]3",
                prev_bookmark3 = "[3",
                next_bookmark4 = "]4",
                prev_bookmark4 = "[4",
                next_bookmark5 = "]5",
                prev_bookmark5 = "[5",
                next_bookmark6 = "]6",
                prev_bookmark6 = "[6",
                next_bookmark7 = "]7",
                prev_bookmark7 = "[7",
                next_bookmark8 = "]8",
                prev_bookmark8 = "[8",
                next_bookmark9 = "]9",
                prev_bookmark9 = "[9",
            },
        },
    },
}
