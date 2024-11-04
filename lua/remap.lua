local opts = { noremap = true, silent = true }
vim.g.mapleader = " "

-- explorador de arquivos
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>o", "<cmd>Oil<cr>")
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>")
vim.keymap.set("n", "<leader>f", "<cmd>NvimTreeFindFile<cr> <C-l>")

-- salvar e sair
vim.keymap.set("n", "<leader>w", "<cmd>w!<cr>")
vim.keymap.set("n", "<c-s>", "<cmd>w!<cr>")
-- vim.keymap.set("n", "<c-q>", "<cmd>q!<cr>")
vim.keymap.set("n", "<c-a>", "<cmd>qa!<cr>")

-- para mover linhas para cima e para baixo
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- utilitários
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<leader>lr", "<cmd>LspRestart<cr>")
vim.api.nvim_set_keymap("n", "<Leader>ng", ":lua require('neogen').generate()<CR>", opts)

-- wrapwords
vim.keymap.set("v", '"', "<cmd>:Wrapwordsdoublequotes<cr>")
vim.keymap.set("v", "'", "<cmd>:Wrapwordssinglequotes<cr>")
vim.keymap.set("v", "(", "<cmd>:Wrapwordsparentheses<cr>")

-- lspsaga
vim.keymap.set("n", "<leader>ci", "<cmd>:Lspsaga incoming_calls<cr>")
vim.keymap.set("n", "<leader>ca", "<cmd>:Lspsaga code_action<cr>")
vim.keymap.set("n", "<leader>cd", "<cmd>:Lspsaga goto_definition<cr>")
vim.keymap.set("n", "<leader>ct", "<cmd>:Lspsaga peek_type_definition<cr>")
vim.keymap.set("n", "<leader>cr", "<cmd>:Lspsaga rename<cr>")

vim.keymap.set("n", "K", "<cmd>:Lspsaga diagnostic_jump_next<cr>")
vim.keymap.set("n", "L", "<cmd>:lua vim.diagnostic.goto_next()<cr>")
vim.keymap.set("n", "H", "<cmd>:lua vim.diagnostic.goto_prev()<cr>")
vim.keymap.set("n", "M", "<cmd>:Maven<cr>")

-- harpoon
vim.keymap.set("n", "<leader>ha", "<cmd>lua require'harpoon.mark'.add_file()<cr>")
vim.keymap.set("n", "<leader>hq", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>")

-- format
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)

-- telescope
vim.keymap.set("n", "<C-f>", "<cmd>lua require('telescope.builtin').find_files({layout_strategy='horizontal',layout_config={width=0.98, height=0.98}})<cr>")
vim.keymap.set("n", "<C-g>", "<cmd>lua require('telescope.builtin').live_grep({layout_strategy='horizontal',layout_config={width=0.98, height=0.98}})<cr>")
-- vim.keymap.set("n", "<C-t>", "<cmd>lua require('telescope.builtin').grep_string({layout_strategy='horizontal',layout_config={width=0.98, height=0.98}})<cr>")

-- para substituir todas as ocorrências de uma palavra
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- para tornar um arquivo executável
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- recarrega config
vim.keymap.set("n", "<leader><leader>", "<cmd>so %<cr>")

vim.api.nvim_set_option("clipboard", "unnamed")
-- navegação
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "\\", "<C-w>v")
vim.keymap.set("n", "|", "<C-w>s")

-- sair do terminal
-- vim.keymap.set('t', '<Esc>', "<C-\\><C-n>")
--
--

-- JAVA
vim.keymap.set("n", "<leader>jr", "<cmd>:JavaRunnerRunMain<cr>")
vim.keymap.set("n", "<leader>js", "<cmd>:JavaRunnerStopMain<cr>")

vim.keymap.set("v", "<leader>y", "+y")

-- DEBUG
vim.keymap.set("n", "<f5>", "<cmd>:lua require('dap').continue()<cr>")
vim.keymap.set("n", "<f1>", "<cmd>:lua require('dap').step_into()<cr>zz")
vim.keymap.set("n", "<f2>", "<cmd>:lua require('dap').step_over()<cr>zz")
vim.keymap.set("n", "<f4>", "<cmd>lua require('persistent-breakpoints.api').toggle_breakpoint()<cr>")
vim.keymap.set("n", "<f8>", "<cmd>:lua require('dapui').toggle()<cr>")
vim.keymap.set("n", "<leader>dc", "<cmd>:lua require('persistent-breakpoints.api').clear_all_breakpoints()<cr>", opts)
vim.keymap.set("n", "<leader>ds", "<cmd>:DapTerminate<cr>", opts)
vim.keymap.set("n", "<leader>dr", "<cmd>:lua require('dapui').open({reset = true})<cr>", opts)

-- COMPILER
vim.api.nvim_set_keymap('n', '<F6>', "<cmd>CompilerOpen<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F7>', "<cmd>CompilerToggleResults<cr>", { noremap = true, silent = true })

-- terminal
vim.keymap.set('n', '<c-t>', "<c-\\><c-n><cmd>:ToggleTerm<cr>a", { noremap = true, silent = true })
vim.keymap.set('t', '<c-t>', "<c-\\><c-n><cmd>:ToggleTerm<cr>", { noremap = true, silent = true })

-- CLIPBOARD
--
vim.keymap.set('n', '<leader>y', '"+y', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>p', '"+p<cr>', { noremap = true, silent = true })
