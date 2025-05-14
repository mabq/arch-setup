-- Watch: [Configure Neovim Options](https://www.youtube.com/watch?v=F1CQVXA5gf0&list=PLep05UYkc6wTyBe7kPjQFWVXTlhKeQejM&index=5)
-- `:help set`
-- `:help option-list` - for more options

local set = vim.opt

set.guicursor = ''

set.number = true
set.relativenumber = true

set.shiftwidth = 4 -- default, see `vim-sleuth` plugin notes
set.softtabstop = -1 -- use `shidtwidth` as tab width

set.wrap = false
set.breakindent = true -- preserve indentation in wrapped text (when enabled)
set.linebreak = true -- do not break words when wrapping

set.ignorecase = true
set.smartcase = true

set.swapfile = false
set.backup = false
set.undodir = os.getenv 'HOME' .. '/.vim/undodir'
set.undofile = true

set.incsearch = true
set.hlsearch = true

set.cursorline = false
set.colorcolumn = '80'

set.termguicolors = true

set.scrolloff = 8
set.signcolumn = 'yes'
set.isfname:append '@-@' -- adds `-` and `@` as filename characters

set.updatetime = 50

set.spelllang = { 'en', 'es' }

set.splitright = true
set.splitbelow = true

--  See `:help 'list'` and `:help 'listchars'`
set.list = true
set.listchars = { tab = '│ ', trail = '·', nbsp = '␣' }
