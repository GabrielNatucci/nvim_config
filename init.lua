require("config.lazy")
require("remap")
require("utils.firefox-debug-adapter")

vim.api.nvim_set_option("clipboard", "unnamed")

vim.cmd.colorscheme('tokyonight-moon')

vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.signcolumn = "yes"

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50

vim.opt.cmdheight = 0

vim.fn.sign_define('DapBreakpoint', { text = '•', texthl = 'red', linehl = '', numhl = '' })
vim.api.nvim_set_hl(0, 'DapLogPoint', { ctermbg = 0, fg = '#61afef', bg = '#31353f' })

vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
vim.cmd("hi NormalNC guibg=NONE ctermbg=NONE")
vim.cmd("hi LineNr guibg=NONE ctermbg=NONE")
vim.cmd("hi Title guibg=NONE ctermbg=NONE")
vim.cmd("hi Folded guibg=NONE ctermbg=NONE")
vim.cmd("hi NonText guibg=NONE ctermbg=NONE")
vim.cmd("hi SpecialKey guibg=NONE ctermbg=NONE")
vim.cmd("hi VertSplit guibg=NONE ctermbg=NONE")
vim.cmd("hi SignColumn guibg=NONE ctermbg=NONE")
vim.cmd("hi EndOfBuffer guibg=NONE ctermbg=NONE")
vim.cmd("hi TablineFill guibg=NONE ctermbg=NONE")
vim.cmd("hi FidgetTitle guibg=NONE ctermbg=NONE")
vim.cmd("hi FidgetTask guibg=NONE ctermbg=NONE")
