-- Notes:
--   Neovim defaults are different than Vim defaults. We just need some minor changes.
--   LazyVim options are stored in `~/.local/share/nvim/lazy/LazyVim/lua/lazyvim/config/options.lua`

-- Helpful commands:
--   `:options`             - categorized, one-line explanation
--   `:h options`           - options man page
--   `:h '{option}'`        - complete information about the given option
--   `:h lua-guide-options` - how to set options with lua
--   ':h nvim-defaults`     - neovim defaults (compared to Vim)
--   `:set {option}?`       - check option current value
--   `:set {option}&`       - set option to its default value
--   `:set {option}!`       - toggle option's boolean value

-- Overwrite some LazyVim options ----------------------------------------------

vim.opt.clipboard = "" -- keep vim and system clipboards separated
vim.opt.swapfile = false
vim.opt.scrolloff = 8
vim.opt.cursorline = true
vim.opt.spelllang = { "en", "es" }
vim.opt.updatetime = 50
vim.opt.conceallevel = 0 -- do not hide url links in markdown files
-- vim.opt.inccommand = "split"

-- Additional options ----------------------------------------------------------

vim.opt.guicursor = "" -- show fat cursor in insert mode
-- vim.opt.textwidth = 80 -- automatically insert a new line at the given length
-- vim.opt.hlsearch = false -- do not highlight all matches
-- vim.opt.colorcolumn = "80"
vim.opt.breakindent = true -- preserve indentation in wrapped text
