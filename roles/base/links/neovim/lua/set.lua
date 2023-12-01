-- lua guide --- https://neovim.io/doc/user/lua-guide.html#_-vim.opt
-- options list --- https://neovim.io/doc/user/options.html

vim.g.mapleader = ' ' -- must be in this file since it must be set before calling lazy for mappings to work correctly, see https://github.com/folke/lazy.nvim#-installation

-- netrw
vim.g.netrw_keepdir = 0 -- avoid issue when moving files with netrw

-- general preferences
-- vim.opt.clipboard = 'unnamedplus'
vim.opt.hidden = true
vim.opt.updatetime = 50
vim.opt.nrformats = '' --treat numbers with a leading 0 as decimal (page 22, practical vim)
vim.opt.mouse = 'nv' -- resize a splitted buffer with the mouse
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.nrformats = 'alpha' -- use `C-a/x` or `g Ctrl-a/x` to increment numbers and letters

-- search options
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- history/undo options
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.history = 1000
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. '/.vim/undodir'

-- visual helpers
vim.opt.termguicolors = true
vim.opt.signcolumn = 'yes'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.colorcolumn = "80"
vim.opt.scrolloff = 8
vim.opt.showmode = false
vim.opt.cursorline = false
vim.opt.cursorlineopt = 'line'

-- indenting/wrapping
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.shiftround = true

-- wrap options
vim.opt.wrap = false
vim.opt.breakindent = true
vim.opt.linebreak = true
vim.opt.sidescroll = 5

