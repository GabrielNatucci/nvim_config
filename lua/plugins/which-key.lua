return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    },
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({ global = false })
            end,
            desc = "Buffer Local Keymaps (which-key)",
        },
    },

    config = function()
        local wk = require("which-key")
        wk.add({
            -- { "<leader>f",  group = "file" }, -- group
            -- { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File", mode = "n" },
            -- { "<leader>fb", function() print("hello") end,   desc = "Foobar" },
            -- { "<leader>fn", desc = "New File" },
            -- { "<leader>f1", hidden = true },           -- hide this keymap
            -- { "<leader>w",  proxy = "<c-w>", group = "windows" }, -- proxy to window mappings
            {
                "<leader>b",
                group = "buffers",
                expand = function()
                    return require("which-key.extras").expand.buf()
                end
            },
            {
                -- Nested mappings are allowed and can be added in any order
                -- Most attributes can be inherited or overridden on any level
                -- There's no limit to the depth of nesting
                mode = { "n"},              -- NORMAL and VISUAL mode
                { "<leader>e", desc = "File explorer" }, -- no need to specify mode since it's inherited
                { "<leader>f", desc = "Find current file in explorer" }, -- no need to specify mode since it's inherited
                { "<leader>w", desc = "Save" },
                { "<leader>x", desc = "Turn a file executable" },

                { "<leader>s", desc = "Replace all occurrences of a word" },

                { "<leader><leader>", desc = "Reload neovim config" },

                { "<leader>b", desc = "Buffers opened" },

                { "<leader>g", desc = "Git" },

                { "<leader>c", desc = "Codelens" },
                { "<leader>ca", desc = "Code Actions" },
                { "<leader>ci", desc = "Incoming calls" },
                { "<leader>cd", desc = "Go to definition" },
                { "<leader>cr", desc = "Rename" },
                { "<leader>ct", desc = "Peak Definition" },

                { "<leader>d", desc = "Debug" },
                { "<leader>dc", desc = "Clear all breakpoints" },
                { "<leader>ds", desc = "Debug stop" },
                { "<leader>dr", desc = "Reset dapui interface" },

                { "<leader>nf", desc = "Generate anottation" },

                { "<leader>h", desc = "Harpoon" },
                { "<leader>ha", desc = "Harpoon add file" },
                { "<leader>hq", desc = "Harpoon quick menu" },

                { "<leader>j", desc = "Java"},
                { "<leader>jr", desc = "Java Run" },
                { "<leader>js", desc = "Java Stop" },

                { "<leader>p", desc = "Netrw" },
                { "<leader>pv", desc = "Netrw" },

                { "<leader>l", desc = "LSP" },
                { "<leader>lf", desc = "Format" },
                { "<leader>lr", desc = "Restart Server" },

                { "<F5>", desc = "Debug continue/start" },
                { "<F4>", desc = "Debug toggle breakpoint" },
                { "<F1>", desc = "Debug step into" },
                { "<F2>", desc = "Debug step over" },
                { "<F8>", desc = "Debug toggle UI" },
                { "<F6>", desc = "Compile/run code" },
            }
        })
    end
}

