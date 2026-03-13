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
            mode = { "n" },
            { "<leader>o",        "<cmd>Oil<cr>",                                                                                                                            desc = "Oil File Explorer" },
            { "<leader>e",        "<cmd>lua require('nvim-tree.api').tree.toggle({ path = '<args>', find_file = true, update_root = true, focus = true, })<cr>",             desc = "NvimTree File Explorer" },
            { "<leader>f",        "<cmd>lua require('nvim-tree.api').tree.find_file({ open = true, update_root = '<bang>', focus = false, })<cr>",                           desc = "Find current file in NvimTree" },

            { "<leader>w",        "<cmd>w!<cr>",                                                                                                                             desc = "Save" },
            { "<c-s>",            "<cmd>w!<cr>",                                                                                                                             desc = "Save" },

            { "<leader>x",        "<cmd>!chmod +x %<CR>",                                                                                                                    desc = "Turn a file executable" },

            { "<leader>s",        [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],                                                                                    desc = "Replace all occurrences of a word" },

            { "<leader><leader>", "<cmd>so %<cr>",                                                                                                                           desc = "Reload neovim config" },

            { "<leader>g",        desc = "Git" },

            { "<leader>c",        desc = "Code" },
            { "<leader>cf",       "<cmd>:Lspsaga finder<cr>",                                                                                                                desc = "Code finder" },
            { "<leader>ci",       "<cmd>:Lspsaga incoming_calls<cr>",                                                                                                        desc = "Incoming calls" },
            { "<leader>cp",       "<cmd>:Lspsaga peek_type_definition<cr>",                                                                                                  desc = "Peak Definition" },
            -- { "<leader>cd",       vim.lsp.buf.definition,                                                                                                                    desc = "Diagnostics" },
            { "<leader>ch",       "<cmd>:Lspsaga hover_doc<cr>",                                                                                                             desc = "Hover" },
            { "<leader>cr",       vim.lsp.buf.rename,                                                                                                                        desc = "Rename" },
            { "<leader>ca",       "<cmd>:Lspsaga code_action<cr>",                                                                                                           desc = "Code Actions" },
            { "<leader>cn",       vim.diagnostic.goto_next,                                                                                                                  desc = "Next diagnostic" },
            { "H",                vim.diagnostic.open_float,                                                                                                                 desc = "Hover" },
            { "gd",               vim.lsp.buf.definition,                                                                                                                    desc = "Go to definition" },
            { "gi",               vim.lsp.buf.implementation,                                                                                                                desc = "Go to implementation" },

            { "<leader>d",        desc = "Debug" },
            { "<leader>db",       "<cmd>lua require('persistent-breakpoints.api').toggle_breakpoint()<cr>",                                                                  desc = "Toggle Breakpoint" },
            { "<leader>dc",       "<cmd>:lua require('persistent-breakpoints.api').clear_all_breakpoints()<cr>",                                                             desc = "Clear all breakpoints" },
            { "<leader>ds",       "<cmd>:lua require('dap').continue()<cr>",                                                                                                 desc = "Debug stop" },
            { "<leader>dS",       "<cmd>:DapTerminate<cr>",                                                                                                                  desc = "Debug Terminate" },
            { "<leader>dr",       "<cmd>:lua require('dapui').open({reset = true})<cr>",                                                                                     desc = "Reset dapui interface" },
            { "<leader>de",       "<Cmd>lua require('dapui').eval()<CR>",                                                                                                    desc = "Debug evaluate" },

            { "<leader>n",        desc = "Neogen" },
            { "<leader>ng",       ":lua require('neogen').generate()<CR>",                                                                                                   desc = "Generate annotation" },

            { "<leader>h",        desc = "Harpoon" },
            { "<leader>ha",       "<cmd>lua require'harpoon.mark'.add_file()<cr>",                                                                                           desc = "Harpoon add file" },
            { "<leader>hq",       "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",                                                                                  desc = "Harpoon quick menu" },
            { "<leader>hn",       "<cmd>lua require('harpoon.ui').nav_next()<cr>",                                                                                           desc = "Harpoon next file" },
            { "<leader>hp",       "<cmd>lua require('harpoon.ui').nav_prev()<cr>",                                                                                           desc = "Harpoon previous file" },
            { "<leader>h1",       "<cmd>lua require('harpoon.ui').nav_file(1)<cr>",                                                                                          desc = "Harpoon file 1" },
            { "<leader>h2",       "<cmd>lua require('harpoon.ui').nav_file(2)<cr>",                                                                                          desc = "Harpoon file 2" },
            { "<leader>h3",       "<cmd>lua require('harpoon.ui').nav_file(3)<cr>",                                                                                          desc = "Harpoon file 3" },
            { "<leader>h4",       "<cmd>lua require('harpoon.ui').nav_file(4)<cr>",                                                                                          desc = "Harpoon file 4" },
            { "<leader>h5",       "<cmd>lua require('harpoon.ui').nav_file(5)<cr>",                                                                                          desc = "Harpoon file 5" },
            { "<leader>h6",       "<cmd>lua require('harpoon.ui').nav_file(6)<cr>",                                                                                          desc = "Harpoon file 6" },
            { "<leader>h7",       "<cmd>lua require('harpoon.ui').nav_file(7)<cr>",                                                                                          desc = "Harpoon file 7" },
            { "<leader>h8",       "<cmd>lua require('harpoon.ui').nav_file(8)<cr>",                                                                                          desc = "Harpoon file 8" },
            { "<leader>h9",       "<cmd>lua require('harpoon.ui').nav_file(9)<cr>",                                                                                          desc = "Harpoon file 9" },
            { "<leader>h0",       "<cmd>lua require('harpoon.ui').nav_file(10)<cr>",                                                                                         desc = "Harpoon file 10" },

            { "<leader>l",        desc = "LSP" },
            { "<leader>lf",       vim.lsp.buf.format,                                                                                                                        desc = "Format" },
            { "<leader>lR",       "<cmd>LspRestart<cr>",                                                                                                                     desc = "Restart Server" },
            { "<leader>lrn",      desc = "Rename type" },

            { "<leader>t",        desc = "Telescope" },
            { "<c-f>",            "<cmd>lua require('telescope.builtin').find_files({layout_strategy='horizontal',layout_config={width=0.90, height=0.90}})<cr>",            desc = "Telescope find files" },
            { "<c-g>",            "<cmd>lua require('telescope.builtin').live_grep({layout_strategy='horizontal',layout_config={width=0.90, height=0.90}})<cr>",             desc = "Telescope live grep" },
            { "<leader>cs",       "<cmd>lua require('telescope.builtin').lsp_document_symbols({layout_strategy='horizontal',layout_config={width=0.98, height=0.98}})<cr>",  desc = "Telescole file symbols" },
            { "<leader>cS",       "<cmd>lua require('telescope.builtin').lsp_workspace_symbols({layout_strategy='horizontal',layout_config={width=0.98, height=0.98}})<cr>", desc = "Telescole file symbols" },
            { "<leader>ti",       "<cmd>lua require('telescope.builtin').lsp_implementations({layout_strategy='horizontal',layout_config={width=0.98, height=0.98}})<cr>",   desc = "Telescole implementations" },

            { "<m-r>",            "<cmd>OverseerRun<cr>",                                                                                                                    desc = "Overseer run" },
            { "<m-p>",            "<cmd>OverseerToggle<cr>",                                                                                                                 desc = "Overseer pannel toggle" },

            { "<F8>",             "<cmd>:lua require('dap').continue()<cr>",                                                                                                 desc = "Debug continue/start" },
            { "<F4>",             desc = "Debug toggle breakpoint" },
            { "<F5>",             "<cmd>:lua require('dap').step_into()<cr>zz",                                                                                              desc = "Debug step into" },
            { "<F6>",             "<cmd>:lua require('dap').step_over()<cr>zz",                                                                                              desc = "Debug step over" },
            { "<f10>",            "<cmd>:lua require('dapui').toggle()<cr>",                                                                                                 desc = "Toggle DAP UI" },

            { "<leader>m",        desc = "Minty (bom pra front)" },
            { "<leader>ms",       "<cmd>Shades<cr>",                                                                                                                         desc = "Shades" },
            { "<leader>mh",       "<cmd>Huefy<cr>",                                                                                                                          desc = "Huefy" },

            { "<leader>b",        "<cmd>DapToggleBreakpoint<cr>",                                                                                                            desc = "Toggle breakpoints" },

            { "<c-t>",            "<c-\\><c-n><cmd>:ToggleTerm<cr>a",                                                                                                        desc = "Toggle terminal" },
            { "<c-h>",            "<c-w>h",                                                                                                                                  desc = "Ir para janela da esquerda" },
            { "<c-l>",            "<c-w>l",                                                                                                                                  desc = "Ir para janela da direita" },
            { "<c-k>",            "<c-w>k",                                                                                                                                  desc = "Ir para janela da cima" },
            { "<c-j>",            "<c-w>j",                                                                                                                                  desc = "Ir para janela da baixo" },
            { "<C-Right>",        "<cmd>vertical resize -5<CR>",                                                                                                             desc = "Aumentar largura da janela para direita" },
            { "<C-Left>",         "<cmd>vertical resize +5<CR>",                                                                                                             desc = "Aumentar largura da janela para esquerda" },
            -- dev utils
            { "<leader>u",        desc = "Development Tools" },
            { "<leader>ug",       "<cmd>LazyGit<cr>",                                                                                                                        desc = "LazyGit" },
            { "<leader>ud",       "<cmd>lua require('lazydocker').open()<cr>",                                                                                               desc = "Lazydocker" }

            -- {
            --     "<leader>ld",
            --     function()
            --         require("lazydocker").open()
            --     end,
            --     desc = "Open Lazydocker floating window",
            -- },
        })

        wk.add({
            mode = { "v" },
            { "J", ":m '>+1<CR>gv=gv",                desc = "Move line down" },
            { "K", ":m '<-2<CR>gv=gv",                desc = "Move line up" },
            { '"', "<cmd>:Wrapwordsdoublequotes<cr>", desc = "Wrap with double quotes" },
            { "'", "<cmd>:Wrapwordssinglequotes<cr>", desc = "Wrap with single quotes" },
            { "(", "<cmd>:Wrapwordsparentheses<cr>",  desc = "Wrap with parentheses" },
        })

        wk.add({
            mode = { "t" },
            { "<c-t>", "<c-\\><c-n><cmd>:ToggleTerm<cr>", desc = "Toggle terminal" },
        })
    end
}
