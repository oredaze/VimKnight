local map = vim.keymap.set

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
            map("n", "<leader>ll", function()
                lint.try_lint()
            end, { silent = true, desc = "Lint" })
        end,
    },

    {
        "williamboman/mason.nvim",
        event = { "BufReadPre", "BufNewFile" },
        lazy = true,
        cmd = {
            "Mason",
            "MasonUpdate",
            "MasonInstall",
            "MasonUninstall",
            "MasonUninstallAll",
            "MasonLog",
        },
        dependencies = {
            { "williamboman/mason-lspconfig.nvim", lazy = true },
            { "neovim/nvim-lspconfig", lazy = true },
        },
        config = function()
            require("mason").setup({
                ui = {
                    border = "rounded",
                    icons = {
                        package_installed = "✔",
                        package_uninstalled = "✘",
                    },
                },
            })
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    -- "rust_analyzer",
                    "marksman",
                },
                automatic_installation = false,
            })

            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local opts = { noremap = true, silent = true }
            local on_attach = function(client, bufnr)
                opts.buffer = bufnr
                map("n", "K", vim.lsp.buf.hover, opts)
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
                opts.desc = "Rename buffer"
                map("n", "gR", vim.lsp.buf.rename, opts)
                opts.desc = "Code actions"
                map({ "n", "v" }, "gA", vim.lsp.buf.code_action, opts)
            end
            opts.desc = "Diagnostic info"
            map("n", "ge", vim.diagnostic.open_float, opts)
            opts.desc = "Move to prev diagnostic"
            map("n", "[e", function() vim.diagnostic.jump({count = -1, float = true}) end, opts)
            opts.desc = "Move to next diagnostic"
            map("n", "]e", function() vim.diagnostic.jump({count = 1, float = true}) end, opts)
            opts.desc = "Format buffer"
            map("n", "<leader>lf", function()
                vim.lsp.buf.format({
                    filter = function(client)
                        return client.name == "null-ls"
                    end,
                })
            end, opts)

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

            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                on_attach = on_attach,
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
            --         on_attach = on_attach,
            --         capabilities = capabilities,
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

            lspconfig.marksman.setup({
                capabilities = capabilities,
                on_attach = on_attach,
                filetypes = { "markdown" },
            })

            lspconfig.gdscript.setup({
                capabilities = capabilities,
                on_attach = on_attach,
                filetypes = { "gdscript" },
            })

            require("mason-null-ls").setup({
                ensure_installed = {
                    -- Opt to list sources here, when available in mason.
                    "stylua",
                },
                automatic_installation = false,
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
        end,
        build = function()
            pcall(function()
                require("mason-registry").refresh()
            end)
        end,
    },
}
