local M = {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "ray-x/cmp-sql",
        "saadparwaiz1/cmp_luasnip",
        "kndndrj/cmp-dbee",
    },
}

M.config = function()
    require("luasnip.loaders.from_vscode").lazy_load()

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
            { name = 'nvim_lsp', priority = 100 },
            { name = 'path',     priority = 70 },
            { name = 'luasnip',  priority = 50 },
            { name = 'buffer',   priority = 30 },
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

    cmp.setup.filetype("sql", {
        sources = cmp.config.sources({
            { name = "nvim_lsp" },
            { name = "luasnip" },
            { name = "dbee" },
            { name = "sql" }, -- só aparece em arquivos .sql
        }, {
            { name = "buffer" },
        }),
    })

    vim.diagnostic.config({
        float = {
            focusable = false,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
        },
    })

    -- isso aqui é para desativar o nvim_CMP quando eu estiver com o telescope aberto PLMDS!!!
    vim.api.nvim_create_autocmd("FileType", {
        pattern = { "TelescopePrompt" },
        callback = function()
            require("cmp").setup.buffer({ enabled = false })
        end,
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
