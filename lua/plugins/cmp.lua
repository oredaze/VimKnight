return {
    -- Auto completion
    {
        "hrsh7th/nvim-cmp",
        version = false, -- last release is way too old
        event = { "InsertEnter", "CmdlineEnter" },
        dependencies = {
            { "hrsh7th/cmp-nvim-lsp", lazy = true },
            { "hrsh7th/cmp-buffer", lazy = true },
            { "hrsh7th/cmp-path", lazy = true },
            -- { "ray-x/cmp-treesitter", lazy = true },
            { "hrsh7th/cmp-nvim-lsp-signature-help", lazy = true },
            {
                "L3MON4D3/LuaSnip",
                version = "v2.*",
                lazy = true,
                dependencies = { "rafamadriz/friendly-snippets", lazy = true },
                config = function()
                    local ls = require("luasnip")
                    require("luasnip.loaders.from_lua").load()
                    require("luasnip.loaders.from_vscode").lazy_load()
                    ls.config.set_config({
                        history = true,
                        updateevents = "TextChanged,TextChangedI",
                        ext_opts = {
                            [require("luasnip.util.types").choiceNode] = {
                                active = {
                                    virt_text = { { "󰚄", "Macro" } },
                                },
                            },
                        },
                    })
                    -- Snippets
                    vim.keymap.set({ "i" }, "<C-k>", function() ls.expand() end, { silent = true })
                    vim.keymap.set({ "i", "s" }, "<C-l>", function() ls.jump(1) end, { silent = true })
                    vim.keymap.set({ "i", "s" }, "<C-j>", function() ls.jump(-1) end, { silent = true })
                    vim.keymap.set({ "i", "s" }, "<C-h>", function()
                        if ls.choice_active() then
                           ls.change_choice(1)
                        end
                    end, { silent = true })
                end,
            },
            { "saadparwaiz1/cmp_luasnip", lazy = true },
        },
        config = function()
            ---@diagnostic disable
            vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            local defaults = require("cmp.config.default")()
            local has_words_before = function()
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0
                    and vim.api
                            .nvim_buf_get_lines(0, line - 1, line, true)[1]
                            :sub(col, col)
                            :match("%s")
                        == nil
            end
            cmp.setup({
                completion = {
                    keyword_length = 2, -- Length at which completion will activate
                    -- autocomplete = false, -- auto or manual completion strategy
                },
                mapping = cmp.mapping.preset.insert({
                    ["<S-Up>"] = cmp.mapping.scroll_docs(-3),
                    ["<S-Down>"] = cmp.mapping.scroll_docs(3),
                    ["<C-u>"] = cmp.mapping.scroll_docs(-10),
                    ["<C-d>"] = cmp.mapping.scroll_docs(10),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping({ i = cmp.mapping.close(), c = cmp.mapping.close() }),
                    ["<C-c>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ["<S-CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
                    ["<Tab>"] = function(fallback) -- for autocomplete
                        if cmp.visible() then
                            cmp.select_next_item()
                        -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
                        -- that way you will only jump inside the snippet region
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end,
                    ["<S-Tab>"] = function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end,
                    ["<Down>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<Up>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                sources = cmp.config.sources({
                    -- Order matters! Gives priority.
                    -- Additional options:
                    -- keyword_length (Length at which completion will activate)
                    -- priority
                    -- max_item_count
                    -- (more?)
                    { name = "nvim_lsp" },
                    { name = "nvim_lsp_signature_help" },
                    { name = "nvim_lua" },
                    { name = "path", option = { trailing_slash = true }, keyword_length = 0 },
                    -- { name = "treesitter" },
                    { name = "luasnip" },
                    { name = "crates" },
                }, {
                    { name = "buffer" },
                }),

                formatting = {
                    fields = { "kind", "abbr", "menu" },
                    format = function(entry, vim_item)
                        local kind_icons = {
                            Class = " ",
                            Color = " ",
                            Constant = " ",
                            Constructor = " ",
                            Enum = " ",
                            EnumMember = " ",
                            Event = " ",
                            Field = " ",
                            File = " ",
                            Folder = " ",
                            Function = "󰊕 ",
                            Interface = " ",
                            Keyword = " ",
                            Method = " ",
                            Module = " ",
                            Operator = " ",
                            Property = " ",
                            Reference = " ",
                            Snippet = " ",
                            Struct = " ",
                            Text = " ",
                            TypeParameter = " ",
                            Unit = " ",
                            Value = " ",
                            Variable = " ",
                        }
                        vim_item.kind = kind_icons[vim_item.kind]
                        if entry.source.name == "crates" then
                            vim_item.kind = ""
                            vim_item.kind_hl_group = "Include"
                        end
                        vim_item.menu = ({
                            nvim_lsp = "(Lsp)",
                            buffer = "(Buff)",
                            path = "(Path)",
                            luasnip = "(Snip)",
                            -- tmux = "(Tmux)",
                            -- treesitter = "(TS)",
                        })[entry.source.name]
                        vim_item.dup = ({
                            buffer = 1,
                            path = 1,
                            nvim_lsp = 0,
                            luasnip = 1,
                        })[entry.source.name] or 0
                        return vim_item
                    end,
                },

                experimental = {
                    ghost_text = {
                        hl_group = "CmpGhostText",
                    },
                },
                preselect = cmp.PreselectMode.Item, -- Item / None
                sorting = defaults.sorting,
                window = {
                    completion = {
                        -- border = "single", -- shadow, single, rounded
                        border = { "+", "-", "+", "|", "+", "-", "+", "|" },
                        -- border = { "🭇", "▁", "🬼", "▏", "🭗", "▔", "🭢", "▕" },
                        -- border = { "🭽", "▔", "🭾", "▕", "🭿", "▁", "🭼", "▏" },
                        winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
                        -- scrollbar = '▐'
                    },
                    documentation = {
                        border = "none",
                        -- scrollbar = '▐'
                    },
                },
                performance = {
                    max_view_entries = 12,
                },
            })

            cmp.setup.cmdline("/", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = "buffer" },
                },
                view = {
                    entries = { name = "custom", selection_order = "bottom_up" },
                },
            })
        end,
    },
}
