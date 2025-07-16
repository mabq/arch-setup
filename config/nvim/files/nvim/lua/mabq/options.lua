-- Watch: [Configure Neovim Options](https://www.youtube.com/watch?v=F1CQVXA5gf0&list=PLep05UYkc6wTyBe7kPjQFWVXTlhKeQejM&index=5)
-- `:options` - list of all options by category. You can press enter over the option value to try it out!
-- `:help opt`

local opt = vim.opt

opt.guicursor = ''

opt.number = true
opt.relativenumber = true

-- Defaults, will be overriden by `guess-indent`
vim.opt.expandtab = true -- turn tabs into spaces (manually with `%retab!`)
vim.opt.tabstop = 2 -- Number of spaces to use for tab
vim.opt.softtabstop = 2 -- Number of spaces to use for a tab in insert mode
vim.opt.shiftwidth = 2 -- Number of spaces to use for autoindent operations (> < =)
vim.opt.shiftround = true -- Round indent to a multiple of shiftwidth

opt.wrap = false
opt.breakindent = true -- preserve indentation in wrapped text (when enabled)
opt.linebreak = true -- do not break words when wrapping

opt.ignorecase = true
opt.smartcase = true

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv 'HOME' .. '/.vim/undodir'
opt.undofile = true

opt.incsearch = true
opt.hlsearch = true

opt.cursorline = false
opt.colorcolumn = '80'

opt.termguicolors = true

opt.scrolloff = 8
opt.signcolumn = 'yes'
opt.isfname:append '@-@' -- adds `-` and `@` as filename characters

opt.updatetime = 50

opt.spelllang = { 'en', 'es' }

opt.splitbelow = true
opt.splitright = true

--  See `:help 'list'` and `:help 'listchars'`
opt.list = true
opt.listchars = { tab = '│ ', trail = '·', nbsp = '␣' }
