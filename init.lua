require("remap")
require("utils.firefox-debug-adapter")
require("config.lazy")
require("config.configs")

-- Set clipboard to unnamed
vim.api.nvim_set_option("clipboard", "unnamed")

-- Set colorscheme
vim.cmd.colorscheme('tokyonight-storm')

-- Configure cursor
vim.opt.guicursor = ""

-- Line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Tabs and Indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Sign column
vim.opt.signcolumn = "yes"
vim.opt.laststatus = 2

-- Indentation
vim.opt.smartindent = true

-- Wrap
vim.opt.wrap = false

-- Backup and undo
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Terminal colors
vim.opt.termguicolors = true

-- Scrolling
vim.opt.scrolloff = 8
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50

-- Command Height
vim.opt.cmdheight = 0

-- DAP signs
vim.fn.sign_define('DapBreakpoint', { text = '•', texthl = 'red', linehl = '', numhl = '' })
vim.api.nvim_set_hl(0, 'DapLogPoint', { ctermbg = 0, fg = '#61afef', bg = '#31353f' })

-- Case insensitive search
vim.o.ignorecase = true
vim.o.smartcase = true

-- vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
-- vim.cmd("hi NormalNC guibg=NONE ctermbg=NONE")
-- vim.cmd("hi LineNr guibg=NONE ctermbg=NONE")
-- vim.cmd("hi Title guibg=NONE ctermbg=NONE")
-- vim.cmd("hi Folded guibg=NONE ctermbg=NONE")
-- vim.cmd("hi NonText guibg=NONE ctermbg=NONE")
-- vim.cmd("hi SpecialKey guibg=NONE ctermbg=NONE")
-- vim.cmd("hi VertSplit guibg=NONE ctermbg=NONE")
-- vim.cmd("hi SignColumn guibg=NONE ctermbg=NONE")
-- vim.cmd("hi EndOfBuffer guibg=NONE ctermbg=NONE")
-- vim.cmd("hi TablineFill guibg=NONE ctermbg=NONE")
-- vim.cmd("hi FidgetTitle guibg=NONE ctermbg=NONE")
-- vim.cmd("hi FidgetTask guibg=NONE ctermbg=NONE")
