return {
    'ThePrimeagen/harpoon',
    enable = true,
    lazy = false,

    dependencies = {
        "williamboman/mason.nvim",
    },

    config = function()
        require('harpoon').setup({
            menu = {
                width = 130,
                height = 30
            }
        })
    end
}
