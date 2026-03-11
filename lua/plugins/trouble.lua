return {
    "folke/trouble.nvim",
    cmd = "Trouble",
    opts = {
        auto_close = false,      -- auto close when there are no items
        auto_open = false,       -- auto open when there are items
        auto_preview = true,     -- automatically open preview when on an item
        auto_refresh = false,    -- auto refresh when open
        focus = true,            -- Focus the window when opened
        open_no_results = false, -- open the trouble window when there are no results
    },                           -- for default options, refer to the configuration section for custom setup.
    keys = {
        {
            "<leader>cd",
            "<cmd>Trouble diagnostics toggle<cr>",
            desc = "Diagnostics",
        },
        {
            "<leader>cS",
            "<cmd>Trouble symbols toggle focus=false<cr>",
            desc = "Symbols (Trouble)",
        },
        {
            "<leader>cF",
            "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
            desc = "LSP Definitions / references / ... (Trouble)",
        },
    },
}
