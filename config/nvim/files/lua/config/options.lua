-- lua guide --- https://neovim.io/doc/user/lua-guide.html#_-vim.opt
-- options list --- https://neovim.io/doc/user/options.html

vim.g.mapleader = ' ' -- Must be in this file since it must be set before calling lazy for mappings to work correctly, see https://github.com/folke/lazy.nvim#-installation

-- netrw
-- vim.g.netrw_keepdir = 0 -- Solves netrw error when moving files but messes up harpoon
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

local opt = vim.opt

-- general preferences
opt.statusline = " %f %m %= %l:%c  %p%%  "
opt.nrformats = 'alpha' -- Use `C-a/x` or `g Ctrl-a/x` to increment numbers and letters
opt.mouse = 'nv' -- Resize a split buffer with the mouse
opt.splitbelow = true
opt.splitright = true
opt.hidden = true
opt.completeopt = "menu,menuone,noselect"
opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup
opt.spelllang = {'en', 'es'}
opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.winminwidth = 5 -- Minimum window width
-- opt.list = true -- Show some invisible characters
-- opt.clipboard = 'unnamedplus' -- Sync with system clipboard
-- opt.updatetime = 50

-- search options
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true -- Don't ignore text with capitals
opt.grepprg = "rg --vimgrep"

-- history/undo options
opt.swapfile = false
opt.backup = false
opt.history = 1000
opt.undofile = true
opt.undolevels = 5000
opt.undodir = os.getenv("HOME") .. '/.vim/undodir'

-- visual helpers
opt.termguicolors = true
opt.signcolumn = 'yes' -- Always show the signcolumn, otherwise it would shift the text each time
opt.number = true
opt.relativenumber = true
opt.colorcolumn = "80"
opt.scrolloff = 4
opt.showmode = false -- Don't show mode
opt.cursorline = true
opt.cursorlineopt = 'line'

-- indenting/wrapping
opt.expandtab = true -- Replace tabs with spaces
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.smartindent = true -- Insert indents automatically
opt.shiftround = true

-- wrap options
opt.wrap = false
opt.breakindent = true
opt.linebreak = true
opt.sidescroll = 8

