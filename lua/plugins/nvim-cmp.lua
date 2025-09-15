local M = {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets",
        "L3MON4D3/LuaSnip",
        "kndndrj/cmp-dbee",
    },
}


M.config = function()
    local cmp = require("cmp")
    vim.opt.completeopt = { "menu", "menuone", "noselect" }
    cmp.mapping.abort()

    cmp.setup({
        enabled = true,
        snippet = {
            expand = function(args)
                require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
            end,
        },
        window = {
            -- completion = cmp.config.window.bordered(),
            -- documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-e>"] = cmp.mapping.abort(),
            -- ["<tab>"] = cmp.mapping.continue(), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            ['<Tab>'] = cmp.mapping.select_next_item({ behavior = 'select' }),
            ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),
            ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
            { name = "nvim_lsp" },
            { name = "luasnip" }, -- For luasnip users.
            { name = "dbee" },    -- 🔥 integração do nvim-dbee com o cmp
        }, {
            { name = "buffer" },
            { name = "path" },
        }),
    })

    cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
            { name = "path" },
        }, {
            { name = "cmdline" },
        }),
    })

    vim.diagnostic.config({
        float = {
            focusable = false,
            style = "minimal",
            -- border = "rounded",
            source = "always",
            header = "",
            prefix = "",
        },
    })

    local ls = require("luasnip")
    ls.filetype_extend("javascript", { "jsdoc" })

    vim.keymap.set({ "i" }, "<C-s>e", function() ls.expand() end, { silent = true })

    vim.keymap.set({ "i", "s" }, "<C-s>;", function() ls.jump(1) end, { silent = true })
    vim.keymap.set({ "i", "s" }, "<C-s>,", function() ls.jump(-1) end, { silent = true })

    vim.keymap.set({ "i", "s" }, "<C-E>", function()
        if ls.choice_active() then
            ls.change_choice(1)
        end
    end, { silent = true })
end

return M
