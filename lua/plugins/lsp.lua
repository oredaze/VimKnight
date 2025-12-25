local map = vim.keymap.set
vim.lsp.set_log_level("OFF")

return {
    -- { "rust-lang/rust.vim", lazy = true, ft = "rust" },

    -- {
    --     "simrat39/rust-tools.nvim",
    --     dependencies = { { "neovim/nvim-lspconfig", lazy = true } },
    --     lazy = true,
    --     ft = "rust",
    -- },
    -- {
    --     "saecki/crates.nvim",
    --     event = { "BufRead Cargo.toml" },
    --     dependencies = { { "nvim-lua/plenary.nvim", lazy = true } },
    --     tag = "stable",
    --     config = function()
    --         require("crates").setup()
    --     end,
    -- },

    { "mfussenegger/nvim-dap", lazy = true },

    {
        "jay-babu/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        lazy = true,
        dependencies = {
            "williamboman/mason.nvim",
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
                    -- border = "rounded",
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
            local lspconfig = require("lspconfig")

            -- Configure language servers:
            ------------------------------
            lspconfig.lua_ls.setup({
                settings = {
                    Lua = {
                        runtime = {
                            version = "LuaJIT",
                        },
                        diagnostics = {
                            globals = { "vim" },
                        },
                        workspace = {
                            checkThirdParty = false,
                            library = {
                                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                [vim.fn.stdpath("config") .. "/lua"] = true,
                            },
                            maxPreload = 5000,
                            preloadFileSize = 10000,
                        },
                        telemetry = { enable = false },
                    },
                },
                matchup = {
                    enable = true,
                    -- disable = {},
                },
            })

            lspconfig.marksman.setup({
                filetypes = { "markdown" },
            })

            lspconfig.gdscript.setup({
                filetypes = { "gdscript" },
            })

            -- local rt = require("rust-tools")
            -- local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/")
            -- local codelldb_path = mason_path .. "bin/codelldb"
            -- local liblldb_path = mason_path .. "packages/codelldb/extension/lldb/lib/liblldb.so"
            -- local dap = require("dap")
            -- rt.setup({
            --     tools = {
            --         hover_actions = {
            --             border = "shadow",
            --         },
            --         on_initialized = function()
            --             vim.api.nvim_create_autocmd(
            --                 { "BufWritePost", "BufEnter", "CursorHold", "InsertLeave" },
            --                 {
            --                     pattern = { "*.rs" },
            --                     callback = function()
            --                         local _, _ = pcall(vim.lsp.codelens.refresh)
            --                     end,
            --                 }
            --             )
            --         end,
            --     },
            --     dap = {
            --         adapter = require("rust-tools.dap").get_codelldb_adapter(
            --             codelldb_path,
            --             liblldb_path
            --         ),
            --     },
            --     server = {
            --         filetypes = { "rust" },
            --         settings = {
            --             ["rust-analyzer"] = {
            --                 lens = {
            --                     enable = true,
            --                 },
            --                 checkOnSave = {
            --                     enable = true,
            --                     command = "clippy",
            --                 },
            --                 cargo = {
            --                     allfeatures = true,
            --                 },
            --             },
            --         },
            --     },
            -- })
            -- dap.adapters.codelldb = {
            --     type = "server",
            --     -- Manual start
            --     host = "127.0.0.1",
            --     port = "13000", -- 󰚌 Use the port printed out or specified with `--port`
            --     -- Automatic start
            --     -- port = "${port}",
            --     -- executable = {
            --     --    -- Absolute path to codelldb binary
            --     --    command = codelldb_path,
            --     --    args = {"--port", "${port}"},
            --     -- }
            -- }
            -- dap.configurations.rust = {
            --     {
            --         type = "codelldb",
            --         request = "launch",
            --         program = function()
            --             return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
            --         end,
            --         cwd = "${workspaceFolder}",
            --         terminal = "integrated",
            --         sourceLanguages = { "rust" },
            --     },
            -- }
            -- map("n", "<M-d>", "<cmd>RustOpenExternalDocs<Cr>", opts)

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

                    opts.desc = "Docs for item"
                    map("n", "<leader>k", vim.lsp.buf.hover, opts)

                    opts.desc = "Signature Help"
                    map('n', '<leader>h', vim.lsp.buf.signature_help, opts)

                    opts.desc = "Diagnostic info"
                    map("n", "<leader>i", vim.diagnostic.open_float, opts)

                    opts.desc = "Move to prev diagnostic"
                    map("n", "[e", function() vim.diagnostic.jump({count = -1, float = true}) end, opts)

                    opts.desc = "Move to next diagnostic"
                    map("n", "]e", function() vim.diagnostic.jump({count = 1, float = true}) end, opts)

                    opts.desc = "Go to definitions"
                    map("n", "gd", function()
                        ---@diagnostic disable-next-line
                        require("trouble").toggle("lsp_definitions")
                    end, opts)

                    opts.desc = "Go to references"
                    map("n", "gr", function()
                        ---@diagnostic disable-next-line
                        require("trouble").toggle("lsp_references")
                    end, opts)

                    opts.desc = "Go to type definitions"
                    map("n", "gt", function()
                        ---@diagnostic disable-next-line
                        require("trouble").toggle("lsp_type_definitions")
                    end, opts)

                    opts.desc = "Go to doc symbols"
                    map("n", "gs", function()
                        ---@diagnostic disable-next-line
                        require("trouble").toggle("lsp_document_symbols")
                    end, opts)

                    opts.desc = "Go to declaration"
                    map("n", "gD", vim.lsp.buf.declaration, opts)

                    opts.desc = "Go to implementation"
                    map("n", "gi", vim.lsp.buf.implementation, opts)

                    opts.desc = "Rename symbol"
                    map("n", "<leader>r", vim.lsp.buf.rename, opts)

                    opts.desc = "Code actions"
                    map("n", "<leader>A", vim.lsp.buf.code_action, opts)

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
            })

        end,
    },

}
