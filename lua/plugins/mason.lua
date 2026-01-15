return {
    "williamboman/mason-lspconfig.nvim",

    dependencies = {
        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig",
        "mfussenegger/nvim-dap",
        "rcarriga/cmp-dap"
    },

    config = function()
        local mason_lspconfig = require("mason-lspconfig")
        local mason = require("mason")
        local lspconfig = vim.lsp.config
        local java = require("java")

        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        local on_attach = function(_, _)
            vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, {})
            vim.keymap.set("n", "<leader>lca", vim.lsp.buf.code_action, {})
            vim.keymap.set("n", "<leader>lgr", vim.lsp.buf.references, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
        end

        mason.setup()
        mason_lspconfig.setup({
            ensure_installed = {
                "lua_ls",
                "eslint",
                "ts_ls",
                "clangd",
                "cssls",
                "html",
                "xmlformatter",
                "prettier",
                "prettierd",
                "codelldb",
                "jsonls",
                "zls",
            },
            automatic_installation = false,
            automatic_enable = true
        })

        local servers = {
            "lua_ls",
            "eslint",
            "ts_ls",
            "clangd",
            "cssls",
            "html",
            "jsonls",
            "zls",
        }

        local base_config = {
            on_attach = on_attach,
            capabilities = capabilities,
        }

        for _, server in ipairs(servers) do
            lspconfig[server] = base_config
        end

        lspconfig('jdtls', {
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                java = {
                    configuration = {
                        runtimes = {
                            {
                                name = "JavaSE-25",
                                path = "/opt/jdk-25",
                                default = true,
                            },
                            {
                                name = "JavaSE-21",
                                path = "/opt/jdk-21",
                            },
                            {
                                name = "JavaSE-17",
                                path = "/opt/jdk-17",
                            }
                        }
                    }
                }
            }
        })
    end
}
