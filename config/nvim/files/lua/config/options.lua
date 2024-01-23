--  Notes:
--      Use `:options` to launch an interactive option setter, it shows current options divided into categories
--      Use `:h {option}` to get complete information about the given option
--      Use `:option-list` for a quickref alphabetically sorted
--      Use `:h options` for the full options man page (how to set, get options)
--      Use `:h lua-guide-options` for information about how to set options with lua
--      See ':h nvim-defaults` to see all the options that are enabled by default in Neovim (compared to Vim)

vim.g.mapleader = ' ' -- must happen before plugins are required (otherwise wrong leader key will be used)
vim.g.maplocalleader = ' '

local opt = vim.opt

-- 1. Important:

-- 2. Moving aroung, searching and patterns:
-- opt.incsearch = true -- highlight match while typing search pattern (enabled by default in Neovim)
opt.magic = true -- changes special characters in search patterns
opt.ignorecase = true -- ignore case in search patterns
opt.smartcase = true -- don't ignore case when pattern has uppercase
if vim.fn.has("nvim-0.10") == 1 then
  opt.smoothscroll = true -- disabled until version 10
end

-- 3. Tags:

-- 4. Displaying text:
opt.scrolloff = 8 -- minimum nr. of lines above and below cursor
opt.wrap = false -- long lines wrap and continue on the next line
opt.linebreak = true -- wrap long lines at a blank
opt.breakindent = true -- wrapped line repeats indent
opt.sidescroll = 8 -- minimum number of columns to scroll horizontal (defaults to 1 in Neovim)
opt.number = true -- print the line number in front of each line
opt.relativenumber = true -- show relative line number in front of each lmne
opt.list = true -- show <Tab> and <EOL>
opt.listchars = { nbsp = " ", tab = "> ", trail = "·" } -- characters for displaying in list mode
opt.fillchars = { foldopen = "", foldclose = "", fold = " ", foldsep = " ", diff = "╱", eob = " ", } -- characters to use for displaying special items
-- opt.conceallevel = 3 -- Hide * markup for bold and italic

-- 5. Syntax, highlighting and spellin:
opt.bg = "dark" -- "dark" or "light", used for highlight colors
-- opt.hlsearch = true -- highlight matches with last search pattern (enabled by default in Neovim)
opt.termguicolors = true -- use GUI colors for the terminal
opt.cursorline = true -- highlight the screen line of the cursor
opt.cursorlineopt = 'line' -- settings for 'cursorline'
opt.colorcolumn = "" -- columns to highlight
opt.spelllang = {'en', 'es'} -- language(s) to do spell checking for

-- 6. Multiple windows:
-- opt.laststatus = 2 -- tells when last window has status lines (defaults to 2 in Neovim)
opt.statusline = " %f %m %= %l:%c  %p%%  " -- custom format for the status line
opt.winminwidth = 5 -- Minimum window width
-- opt.hidden = true -- don't unload buffer when it is |abandon|ed (enabled by default in Neovim)
opt.splitbelow = true -- new window from split is below the current one
opt.splitright = true -- new window is put right of the current one
opt.splitkeep = "screen" -- determines scroll behavior for split windows
-- if vim.fn.has("nvim-0.9.0") == 1 then
--   vim.opt.statuscolumn = [[%!v:lua.require'lazyvim.util'.ui.statuscolumn()]] -- custom format for the status column
-- end

-- 7. Multiple tab pages:

-- 8. Terminal:

-- 9. Using the Mouse:
-- opt.mouse = 'a' -- enable the use of mouse clicks (defaults to "nvi" in Neovim)

-- 10. Messages and info:
opt.showmode = false -- message on status line to show current mode
-- opt.confirm = true -- confirm to save changes before exiting modified buffer
-- opt.shortmess:append({ W = true, I = true, c = true, C = true })

-- 11. Selecting text:
opt.clipboard = 'unnamed' -- use the * register 

-- 12. Editing text:
opt.undolevels = 10000 -- maximum number of changes that can be undone
opt.undofile = true -- save undo information in a file
opt.undodir = os.getenv("HOME") .. '/.vim/undodir' -- where to store undo files
opt.pumheight = 10 -- maximum number of items to show in the popup menu
opt.pumblend = 10 -- popup blend (transparency)
opt.nrformats = 'alpha' -- number formats recognized for CTRL-A / CTRL-X commands (defaults to "bin,hex" in Neovim. We use <Ctrl-a> to select all text)
opt.completeopt = "menu,menuone,noselect" -- options for Insert mode completion
-- opt.formatoptions = "tcjlnoqr" -- how automatic formatting is to be done
-- vim.o.formatexpr = "" -- expression used with "gq" command

-- 13. Tabs and indenting:
opt.tabstop = 4 -- number of spaces that <Tab> uses while editing
opt.shiftwidth = 4 -- number of spaces to use for (auto)indent step
opt.softtabstop = 4 -- number of spaces that <Tab> uses while editing
opt.shiftround = true -- round indent to multiple of shiftwidth
opt.expandtab = true -- use spaces when <Tab> is inserted
-- opt.autoindent = true -- take indent for new line from previous line (enabled by default in neovim)
opt.smartindent = true -- smart autoindenting for C programs

-- 14. Folding:
vim.opt.foldlevel = 99 -- close folds with a level higher than this
-- vim.opt.foldtext = "" -- expression used to display for a closed fold
vim.opt.foldmethod = "marker" -- folding type
vim.opt.foldmarker = {"{{{", "}}}"} -- markers used when `foldmethod` is `marker`

-- 15. Diff mode:

-- 16. Mapping:
opt.timeoutlen = 500 -- time out time (mappings and key codes) in milliseconds

-- 17. Reading and writtin files:
-- opt.backup = false -- keep backup file after overwriting a file
-- opt.autowrite = true -- automatically write a file when leaving a modified buffer

-- 18. The swap file:
opt.swapfile = false -- whether to use a swapfile for a buffer
opt.updatetime = 200 -- after this many milliseconds flush swap file and trigger CursorHold

-- 19. Command line editing:
-- opt.history = 10000 -- number of command-lines that are remembered (defaults to 10000 in Neovim)
opt.wildmode = "longest:full,full" -- Command-line completion mode

-- 20. Executing external commands:

-- 21. Running make and jumping to errors (quickfix):
opt.grepformat = "%f:%l:%c:%m" -- format of 'grepprg' output
opt.grepprg = "rg --vimgrep" -- program to use for ":grep" command

-- 22. Language specifig:

-- 23. Multi-byte characters:

-- 24. Various:
opt.virtualedit = "block" -- allow virtual editing in Visual block mode
opt.signcolumn = 'yes' -- when and how to display the sign column
-- opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" } -- list of words that specifies what to put in a session file
