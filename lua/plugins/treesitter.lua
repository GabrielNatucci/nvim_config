return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',

    require 'nvim-treesitter'.setup {
        install_dir = vim.fn.stdpath('data') .. '/site'
    },
    require('nvim-treesitter').install({ "python", "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript",
        "html",
        "tsx", "java", "xml", "json" }):wait(300000) -- wait max. 5 minutes
}
