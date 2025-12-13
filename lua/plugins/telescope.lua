return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },

    config = function()
        local telescope = require('telescope')

        telescope.setup({
            defaluts = {
                layout_strategy = 'horizontal',
                layout_config = {
                    vertical = {
                        width = 0.70,
                        height = 0.80,
                    },
                    horizontal = {
                        width = 0.70,
                        height = 0.80,
                    }
                },
            }
        })
    end,

    keys = {
        -- code
        -- { "<leader>ts", "<cmd>:Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Symbols" },
        -- { "<leader>tS", "<cmd>:Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Document Symbols" },
        -- { "<leader>tr", "<cmd>:Telescope lsp_references<cr>", desc = "References" },
        -- { "<leader>td", "<cmd>:Telescope diagnostics<cr>", desc = "Diagnostics" },
        -- { "<leader>ti", "<cmd>:Telescope lsp_implementations<cr>", desc = "Implementations" },

        -- buffers
        { "<leader>tb", "<cmd>:Telescope buffers<cr>", desc = "Buffers" },

        -- git
        { "<leader>tgs", "<cmd>:Telescope git_status<cr>", desc = "Git Status" },
        { "<leader>tgc", "<cmd>:Telescope git_commits<cr>", desc = "Git Commits" },
    }
}
