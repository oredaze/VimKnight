local map = vim.keymap.set
vim.lsp.log.set_level("OFF")

return {
    { "mfussenegger/nvim-dap", lazy = true },

    {
        "jay-babu/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        lazy = true,
        dependencies = {
            "williamboman/mason.nvim",
            "nvim-lua/plenary.nvim",
            { "nvimtools/none-ls.nvim", lazy = true },
        },
    },

    {
        "mfussenegger/nvim-lint",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local lint = require("lint")
            lint.linters_by_ft = {}

            local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
            vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
                pattern = { "*.rs" },
                group = lint_augroup,
                callback = function()
                    lint.try_lint()
                end,
            })
            map("n", "<leader>Ll", function()
                lint.try_lint()
            end, { silent = true, desc = "Lint" })
        end,
    },

    {
        "mason-org/mason.nvim",
        config = function()
            require("mason").setup({
                ui = {
                    border = { "+", "-" ,"+", "|", "+", "-", "+", "|" },
                    icons = {
                        package_installed = "✔",
                        package_uninstalled = "✘",
                    },
                },
            })
        end,
        build = function()
            pcall(function()
                require("mason-registry").refresh()
            end)
        end,
    },

    {
        "mason-org/mason-lspconfig.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    -- "rust_analyzer",
                    "marksman",
                },
                opts = {
                    diagnostics = {
                        virtual_text = false,
                        signs = false,
                    },
                },
            })
        end,
    },

    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.lsp.enable({'lua_ls', 'marksman', 'gdscript'})

            vim.lsp.config("lua_ls", {
                on_init = function(client)
                    if client.workspace_folders then
                        local path = client.workspace_folders[1].name
                        if
                            path ~= vim.fn.stdpath('config')
                            and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
                        then
                            return
                        end
                    end

                    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                        runtime = {
                            -- Tell the language server which version of Lua you're using (most
                            -- likely LuaJIT in the case of Neovim)
                            version = 'LuaJIT',
                            -- Tell the language server how to find Lua modules same way as Neovim
                            -- (see `:h lua-module-load`)
                            path = {
                                'lua/?.lua',
                                'lua/?/init.lua',
                            },
                        },
                        -- Make the server aware of Neovim runtime files
                        workspace = {
                            checkThirdParty = false,
                            library = {
                                vim.env.VIMRUNTIME,
                                -- Depending on the usage, you might want to add additional paths
                                -- here.
                                -- '${3rd}/luv/library',
                                -- '${3rd}/busted/library',
                            },
                            -- Or pull in all of 'runtimepath'.
                            -- NOTE: this is a lot slower and will cause issues when working on
                            -- your own configuration.
                            -- See https://github.com/neovim/nvim-lspconfig/issues/3189
                            -- library = vim.api.nvim_get_runtime_file('', true),
                        },
                    })
                end,
                settings = {
                    Lua = {},
                },
            })

            vim.lsp.config("marksman", {
                root_markers = { ".marksman.toml" },
            })

            vim.lsp.config("gdscript", {
                root_markers = { "project.godot" },
            })

            require("mason-null-ls").setup({
                ensure_installed = {
                    -- Opt to list sources here, when available in mason.
                    "stylua",
                },
                handlers = {},
            })

            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    -- Anything not supported by mason.
                    -- null_ls.builtins.formatting.stylua,
                    -- null_ls.builtins.diagnostics.eslint,
                    -- null_ls.builtins.completion.spell,
                },
            })

            -- Configure hotkeys:
            ------------------------------
            ---@diagnostic disable-next-line
            local toggle_lsp_client = function()
                local buf = vim.api.nvim_get_current_buf()
                local clients = vim.lsp.get_clients({ bufnr = buf })
                if not vim.tbl_isempty(clients) then
                    vim.cmd("LspStop")
                else
                    vim.cmd("LspStart")
                end
            end

            -- Use LspAttach autocommand to only map the following keys
            -- after the language server attaches to the current buffer
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(ev)
                    -- Enable completion triggered by <c-x><c-o>
                    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
                    -- Buffer local mappings.
                    -- See `:help vim.lsp.*` for documentation on any of the below functions
                    local opts = { buffer = ev.buf, noremap = true, silent = true }

                    map("n", "J", ":TSJToggle<CR>", opts)

                    -- opts.desc = "Docs for item"
                    -- map("n", "K", vim.lsp.buf.hover, opts)

                    opts.desc = "Signature Help"
                    map('n', '<C-s>', vim.lsp.buf.signature_help, opts)

                    opts.desc = "Diagnostic info"
                    map("n", "<C-e>", vim.diagnostic.open_float, opts)

                    opts.desc = "Move to prev diagnostic"
                    map("n", "[e", function() vim.diagnostic.jump({count = -1, float = true}) end, opts)

                    opts.desc = "Move to next diagnostic"
                    map("n", "]e", function() vim.diagnostic.jump({count = 1, float = true}) end, opts)

                    opts.desc = "Go to definition"
                    map("n", "gd", vim.lsp.buf.definition, opts)

                    opts.desc = "Go to doc symbol"
                    map("n", "gs", vim.lsp.buf.document_symbol, opts)

                    opts.desc = "Go to type definition"
                    map("n", "gt", vim.lsp.buf.type_definition, opts)

                    opts.desc = "Go to references"
                    map("n", "gr", vim.lsp.buf.references, opts)

                    opts.desc = "Go to declaration"
                    map("n", "gD", vim.lsp.buf.declaration, opts)

                    opts.desc = "Go to implementation"
                    map("n", "gi", vim.lsp.buf.implementation, opts)

                    opts.desc = "Rename symbol"
                    map("n", "gR", vim.lsp.buf.rename, opts)

                    opts.desc = "Code actions"
                    map("n", "<leader>x", vim.lsp.buf.code_action, opts)

                    opts.desc = "Code lens"
                    map("n", "gL", vim.lsp.codelens.run, opts)

                    opts.desc = "Format Buffer"
                    map('n', '<F3>', function()
                        vim.lsp.buf.format({
                            filter = function(client)
                                return client.name == "null-ls"
                            end,
                            async = true
                        })
                    end, opts)
                end,

                vim.keymap.del("n", "gra"),
                vim.keymap.del("n", "gri"),
                vim.keymap.del("n", "grn"),
                vim.keymap.del("n", "grr"),
                vim.keymap.del("n", "grt"),
                vim.keymap.del("n", "grx"),
            })

        end,
    },

}
