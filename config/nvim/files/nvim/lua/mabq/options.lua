-- Help -----------------------------------------------------------------------
--
-- [Configure Neovim Options](https://www.youtube.com/watch?v=F1CQVXA5gf0&list=PLep05UYkc6wTyBe7kPjQFWVXTlhKeQejM&index=5)
-- `:options` - shows an interactive list of options
-- `:help opt`

local opt = vim.opt

-- Options --------------------------------------------------------------------

-- Before editing, read notes on formatters!
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 0 -- do not edit
opt.softtabstop = -1 -- do not edit
opt.shiftround = true

opt.guicursor = ''

opt.number = true
opt.relativenumber = true

opt.signcolumn = 'yes' -- reserve space in gutter for signs

opt.cursorline = false
opt.colorcolumn = '80'

opt.scrolloff = 8

opt.wrap = false
opt.breakindent = true -- preserve indentation in wrapped text (when enabled)
opt.linebreak = true -- do not break words when wrapping

opt.incsearch = true
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv 'HOME' .. '/.vim/undodir'
opt.undofile = true

opt.termguicolors = true

opt.spelllang = { 'en', 'es' }

opt.splitbelow = true
opt.splitright = true

opt.updatetime = 50

opt.list = true
opt.listchars = { tab = '│ ', trail = '·', nbsp = '␣' } -- see `:help 'list'` and `:help 'listchars'`

opt.isfname:append '@-@' -- adds `-` and `@` as filename characters
