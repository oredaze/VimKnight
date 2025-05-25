local has_words_before = function()
    local col = vim.api.nvim_win_get_cursor(0)[2]
    if col == 0 then
        return false
    end
    local line = vim.api.nvim_get_current_line()
    return line:sub(col, col):match("%s") == nil
end

return {
    -- Quickly toggle commented lines
    {
        "Saghen/blink.cmp",
        event = { "InsertEnter", "CmdlineEnter" },
        -- optional: provides snippets for the snippet source

        -- use a release tag to download pre-built binaries
        version = '1.*',
        -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
        -- build = 'cargo build --release',
        -- If you use nix, you can build from source using latest nightly rust with:
        -- build = 'nix run .#build-plugin',

        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            keymap = {
                preset = 'none',
                ['<Tab>'] = {
                    function(cmp)
                        if has_words_before() then
                            return cmp.show_and_insert()
                        end
                    end,
                    'select_next',
                    'fallback',
                },
                ['<Up>'] = { 'select_prev', 'fallback' },
                ['<Down>'] = { 'select_next', 'fallback' },
                ['<CR>'] = { 'accept', 'fallback' },
                ['<Esc>'] = { 'cancel', 'fallback' },
                ['<C-e>'] = { 'hide' },
                ['K'] = { 'show_documentation', 'hide_documentation', 'fallback' },
                ['<S-Up>'] = { 'scroll_documentation_up', 'fallback' },
                ['<S-Down>'] = { 'scroll_documentation_down', 'fallback' },
                ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
            },

            appearance = {
                nerd_font_variant = 'mono',
                kind_icons = {
                    Text = '󰉿',
                    Method = '',
                    Function = '󰊕',
                    Constructor = '',
                    Field = '',
                    Variable = '',
                    Property = '',
                    Class = '',
                    Interface = '',
                    Struct = '',
                    Module = '󰅩',
                    Unit = '',
                    Value = '',
                    Enum = '',
                    EnumMember = '',
                    Keyword = '󰻾',
                    Constant = '󰏿',
                    Snippet = '',
                    Color = '',
                    File = '',
                    Reference = '',
                    Folder = '',
                    Event = '',
                    Operator = '',
                    TypeParameter = '',
                },
            },

            completion = {
                documentation = { auto_show = false },
                menu = {
                    auto_show = false,
                    border = 'rounded',
                    winhighlight = 'NormalFloat:Normal,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None',
                    scrolloff = 0,
                },
                draw = {
                    padding = { 0, 1 }, -- padding only on right side
                    components = {
                        kind_icon = {
                            text = function(ctx) return ' ' .. ctx.kind_icon .. ctx.icon_gap .. ' ' end
                        }
                    }
                }
            },

            cmdline = {
                keymap = {
                    preset = 'cmdline',
                    ['<Up>'] = { 'select_prev', 'fallback' },
                    ['<Down>'] = { 'select_next', 'fallback' },
                    ['<CR>'] = { 'accept_and_enter', 'fallback' },
                    ['<C-space>'] = { 'accept', 'fallback' },
                },
            },

            sources = {
                default = { 'lsp', 'path', 'buffer' },
            },

            fuzzy = { implementation = "prefer_rust_with_warning" }
        },
        opts_extend = { "sources.default" }
    },
}
