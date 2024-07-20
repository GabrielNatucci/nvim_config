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
                        width = 0.95,
                        height = 0.95,
                    },
                    horizontal = {
                        width = 0.95,
                        height = 0.95,
                    }
                },
            }
        })
    end
}
