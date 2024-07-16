return {
    "williamboman/mason-lspconfig.nvim",

    dependencies = {
        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig",
    },

    config = function()
        local mason_lspconfig = require("mason-lspconfig")
        local lspconfig = require("lspconfig")
        local mason = require("mason")
        local java = require("java")

        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        local on_attach = function(_, _)
            vim.keymap.set("n", "rn", vim.lsp.buf.rename, {})
            -- vim.keymap.set("n", "ca", vim.lsp.buf.code_action, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
            vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
            -- vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
        end

        java.setup()

        mason.setup()
        mason_lspconfig.setup({
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "eslint",
                "jdtls"
            },
            automatic_installation = true,
        })

        mason_lspconfig.setup_handlers {
			function (server_name)
				require("lspconfig")[server_name].setup {
					capabilities = capabilities,
					on_attach = on_attach,
				}
			end,
        }

        lspconfig.jdtls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })
    end,
}
