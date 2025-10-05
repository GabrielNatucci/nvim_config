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
        local lspconfig = require("lspconfig")
        local mason = require("mason")
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

        java.setup({
            root_markers = {
                'settings.gradle',
                'settings.gradle.kts',
                'pom.xml',
                'build.gradle',
                'mvnw',
                'gradlew',
                'build.gradle',
                'build.gradle.kts',
                '.git',
            },
            java_debug_adapter = {
                enable = true,
                version = '0.58.2',
            },
            -- jdk = {
            --     -- install jdk using mason.nvim
            --     auto_install = true,
            -- },
            verification = {
                -- nvim-java checks for the order of execution of following
                -- * require('java').setup()
                -- * require('lspconfig').jdtls.setup()
                -- IF they are not executed in the correct order, you will see a error
                -- notification.
                -- Set following to false to disable the notification if you know what you
                -- are doing
                invalid_order = true,

                -- nvim-java checks if the require('java').setup() is called multiple
                -- times.
                -- IF there are multiple setup calls are executed, an error will be shown
                -- Set following property value to false to disable the notification if
                -- you know what you are doing
                duplicate_setup_calls = true,

                -- nvim-java checks if nvim-java/mason-registry is added correctly to
                -- mason.nvim plugin.
                -- IF it's not registered correctly, an error will be thrown and nvim-java
                -- will stop setup
                invalid_mason_registry = false,
            },
        })

        mason.setup()
        mason_lspconfig.setup({
            ensure_installed = {
                "lua_ls",
                "eslint",
                "jdtls",
                "ts_ls",
                "clangd",
                "css-lsp",
                "html-lsp",
                "xmlformatter",
            },
            automatic_installation = true,
        })


        mason_lspconfig.setup_handlers {
            function(server_name)
                require("lspconfig")[server_name].setup {
                    capabilities = capabilities,
                    on_attach = on_attach,
                }
            end,
        }


        lspconfig.jdtls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                java = {
                    configuration = {
                        runtimes = {
                            {
                                name = "Java",
                                path = "java",
                                default = true,
                            }
                        }
                    }
                }
            }
        })
    end,
}
