return {
    "folke/trouble.nvim",
    cmd = "Trouble",
    opts = {
        auto_close = false,      -- auto close when there are no items
        auto_open = false,       -- auto open when there are items
        auto_preview = true,     -- automatically open preview when on an item
        auto_refresh = false,     -- auto refresh when open
        focus = true,            -- Focus the window when opened
        open_no_results = false, -- open the trouble window when there are no results
    },                           -- for default options, refer to the configuration section for custom setup.
    keys = {
        {
            "<leader>td",
            "<cmd>Trouble diagnostics toggle<cr>",
            desc = "Diagnostics (Trouble)",
        },
        {
            "<leader>tt",
            "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
            desc = "Buffer Diagnostics (Trouble)",
        },
        {
            "<leader>ts",
            "<cmd>Trouble symbols toggle focus=false win.position=right<cr>",
            desc = "Symbols (Trouble)",
        },
        {
            "<leader>tr",
            "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
            desc = "LSP Definitions / references / ... (Trouble)",
        },
        {
            "<leader>tl",
            "<cmd>Trouble loclist toggle<cr>",
            desc = "Location List (Trouble)",
        },
        {
            "<leader>tq",
            "<cmd>Trouble qflist toggle<cr>",
            desc = "Quickfix List (Trouble)",
        },
    },
}
