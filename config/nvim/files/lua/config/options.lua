--  Notes:
--    Neovim defaults are different than Vim defaults. We just need some minor changes.
--
--    `:h Q_op` - quick summary of options and related commands
--    `:options` - one-line explanation grouped by subject
--    `:option-list` - one-line explanation alphabetically sorted
--    `:h options` - options man page
--    `:h '{option}'` - complete information about the given option
--    `:h lua-guide-options` - how to set options with lua
--    ':h nvim-defaults` - neovim defaults (compared to Vim)

--    `:so` - load changes
--    `:set {option}?` - print current value
--    `:set {option}&` - go back to default value

vim.g.mapleader = ' ' -- must happen before plugins are required (otherwise wrong leader key will be used)

vim.g.netrw_browse_split = 0 -- always re-use the same window when openning files
vim.g.netrw_banner = 0 -- supress the banner
vim.g.netrw_winsize = 25 -- initial size of new windows

--------------------------------------------------------------------------------

local opt = vim.opt

-- 00. Not in a category:
opt.guicursor = "" -- show fat cursor in insert mode

-- 01. Important:
--     (all defaults are fine)

-- 02. Moving aroung, searching and patterns:
-- opt.ignorecase = false -- ignore case in search patterns
-- opt.smartcase = false -- don't ignore case when pattern has uppercase

-- 03. Tags:
--     (all defaults are fine)

-- 04. Displaying text:
opt.scrolloff = 3 -- number of lines to show around the cursor
opt.wrap = false -- long lines wrap
opt.breakindent = true -- preserve indentation in wrapped text (when enabled)
opt.sidescrolloff = 8 -- minimum number of columns to scroll horizontal (defaults to 1 in Neovim)
opt.number = true -- show the line number for each line
opt.relativenumber = true -- show relative line number in front of each line

-- 05. Syntax, highlighting and spelling:
opt.hlsearch = false -- highlight all matches for the last used search pattern
opt.termguicolors = true -- use GUI colors for the terminal
-- opt.cursorline = false -- highlight the screen line of the cursor
-- opt.colorcolumn = "80,120" -- columns to highlight
-- opt.spell = false -- highlight spelling mistakes
opt.spelllang = {'en', 'es'} -- list of accepted languages (when enabled)

-- 06. Multiple windows:
-- opt.statusline = " %f %m %= %l:%c  %p%%  " -- custom format for the status line
opt.splitbelow = true -- new window from split is below the current one
opt.splitright = true -- new window is put right of the current one
-- opt.splitkeep = "screen" -- determines scroll behavior for split windows

-- 07. Multiple tab pages:
--     (all defaults are fine)

-- 08. Terminal:
--     (all defaults are fine)

-- 09. Using the Mouse:
--     (all defaults are fine)

-- 10. Messages and info:
-- opt.showmode = true -- display the current mode in the status line

-- 11. Selecting text:
--     (all defaults are fine)

-- 12. Editing text:
opt.undolevels = 10000 -- maximum number of changes that can be undone
opt.undofile = true -- save undo information in a file
opt.undodir = os.getenv("HOME") .. '/.vim/undodir' -- where to store undo files
-- opt.textwidth = 80 -- line length above which to break a line
-- opt.pumheight = 10 -- maximum number of items to show in the pop up menu
-- opt.pumblend = 10 -- popup blend (transparency)
-- opt.nrformats = 'alpha' -- number formats recognized for CTRL-A / CTRL-X commands (defaults to "bin,hex" in Neovim. We use <Ctrl-a> to select all text)
-- opt.completeopt = "menu,menuone,noselect" -- options for Insert mode completion
-- opt.formatoptions = "tcjlnoqr" -- how automatic formatting is to be done
-- vim.o.formatexpr = "" -- expression used with "gq" command

-- 13. Tabs and indenting:
opt.tabstop = 4 -- number of spaces that a <Tab> in the file counts for
opt.shiftwidth = 4 -- number of spaces to use for (auto)indent step
opt.softtabstop = 4 -- Number of spaces that a <Tab> counts for while performing editing operations, like inserting a <Tab> or using <BS>
opt.expandtab = true -- use spaces when <Tab> is inserted
opt.smartindent = true -- smart auto indenting for C programs
opt.shiftround = true -- round to 'shiftwidth' for "<<" and ">>"
     
-- 14. Folding:
--     (all defaults are fine)

-- 15. Diff mode:
--     (all defaults are fine)

-- 16. Mapping:
--     (all defaults are fine)

-- 17. Reading and writtin files:
opt.backup = false -- keep a backup after overwriting a file

-- 18. The swap file:
opt.swapfile = false -- use a swap file for this buffer

-- 19. Command line editing:
--     (all defaults are fine)

-- 20. Executing external commands:
--     (all defaults are fine)

-- 21. Running make and jumping to errors (quickfix):
--     (all defaults are fine)

-- 22. Language specifig:
-- opt.iskeyword:append({"-"}) -- specifies what characters are considered part of a word (add `-`)
-- opt.isfname:append({"@-@"}) -- specifies the characters in a filename (include "@")

-- 23. Multi-byte characters:
--     (all defaults are fine)

-- 24. Various:
-- opt.virtualedit = "block" -- allow virtual editing in Visual block mode
opt.signcolumn = 'yes' -- when and how to display the sign column

