return {
    "kndndrj/nvim-dbee",
    dependencies = {
        "MunifTanjim/nui.nvim",
    },
    build = function()
        -- Install tries to automatically detect the install method.
        -- if it fails, try calling it with one of these parameters:
        --    "curl", "wget", "bitsadmin", "go"
        require("dbee").install()
    end,
    config = function()
        require("dbee").setup {
            sources = {
                require("dbee.sources").MemorySource:new({
                    -- {
                    --     name = "postgres-example",
                    --     type = "postgres",
                    --     url = "postgres://user:password@localhost:port/database?sslmode=disable",
                    -- },
                    -- ...
                }),
                require("dbee.sources").EnvSource:new("DBEE_CONNECTIONS"),
                require("dbee.sources").FileSource:new(vim.fn.stdpath("cache") .. "/dbee/persistence.json"),
            },
        }

        local cmp = require("cmp")
        cmp.setup.filetype({ "sql" }, {
            sources = cmp.config.sources({
                { name = "dbee" },
                { name = "nvim_lsp" },
                { name = "luasnip" },
            }, {
                { name = "buffer" },
                { name = "path" },
            }),
        })
    end,
}
