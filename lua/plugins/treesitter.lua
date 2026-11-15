return {
    'nvim-treesitter/nvim-treesitter',
    branch = 'master', -- Compatible with Neovim 0.11.
    lazy = false,
    build = ':TSUpdate',
    opts = {
        ensure_installed = {
            "python", "c", "lua", "vim", "vimdoc", "query", "elixir", "heex",
            "javascript", "html", "tsx", "java", "xml", "json",
        },
        auto_install = false,
        highlight = { enable = true },
    },
    config = function(_, opts)
        require('nvim-treesitter.configs').setup(opts)
    end,
}
