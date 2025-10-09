return {
    'nvimdev/lspsaga.nvim',
    config = function()
        require('lspsaga').setup({
            lightbulb = {
                enable = false,
            },
            symbol_in_winbar = {
                enable = false, -- desabilita o winbar de símbolos
                -- você pode manter outras configurações aqui se quiser
            },
            breadcrumbs = {
                enable = false,
            },
            border = {
            },
            diagnostic = {
                jump_num_shortcut = true,
            }
        })
    end,
    dependencies = {
        'nvim-treesitter/nvim-treesitter', -- optional
        'nvim-tree/nvim-web-devicons',     -- optional
    }
}
