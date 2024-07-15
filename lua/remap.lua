vim.g.mapleader = " "

-- explorador de arquivos
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>")
vim.keymap.set("n", "<leader>f", "<cmd>NvimTreeFindFile<cr>")
vim.keymap.set("n", "<leader>w", "<cmd>w!<cr>")
vim.keymap.set("n", "<leader>q", "<cmd>q!<cr>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>")

vim.keymap.set("n", "<leader>ic", "<cmd>:Lspsaga incoming_calls<cr>")
vim.keymap.set("n", "<leader>ca", "<cmd>:Lspsaga code_action<cr>")
vim.keymap.set("n", "<leader>gd", "<cmd>:Lspsaga goto_definition<cr>")
vim.keymap.set("n", "<leader>pd", "<cmd>:Lspsaga peek_type_definition<cr>")
vim.keymap.set("n", "H", "<cmd>:Lspsaga hover_doc<cr>")
vim.keymap.set("n", "K", "<cmd>:Lspsaga diagnostic_jump_next<cr>")

vim.keymap.set("n", "<leader>ha", "<cmd>lua require'harpoon.mark'.add_file()<cr>")
vim.keymap.set("n", "<leader>hq", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>")

vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)

vim.keymap.set("n", "<C-f>", "<cmd>lua require'telescope.builtin'.find_files()<cr>")
vim.keymap.set("n", "<C-g>", "<cmd>lua require'telescope.builtin'.live_grep()<cr>")
vim.keymap.set("n", "<C-t>", "<cmd>lua require'telescope.builtin'.grep_string()<cr>")

vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so %")
end)

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "\\", "<C-w>v")
vim.keymap.set("n", "|", "<C-w>s")
