-- Notes:
--   Neovim defaults are different than Vim defaults. We just need some minor changes.
--   LazyVim options are stores in `~/.local/share/nvim/lazy/LazyVim/lua/lazyvim/config/options.lua`

-- Helpful commands:
--   `:options`             - categorized, one-line explanation
--   `:h options`           - options man page
--   `:h '{option}'`        - complete information about the given option
--   `:h lua-guide-options` - how to set options with lua
--   ':h nvim-defaults`     - neovim defaults (compared to Vim)
--   `:set {option}?`       - check option current value
--   `:set {option}&`       - set option to its default value
--   `:set {option}!`       - toggle option's boolean value

local opt = vim.opt

-- Overwrite some LazyVim options ----------------------------------------------

opt.clipboard = "" -- keep vim and system clipboards separated
opt.swapfile = false
opt.scrolloff = 8
opt.cursorline = true
opt.spelllang = { "en", "es" }
opt.updatetime = 50
opt.conceallevel = 0 -- do not hide url links in markdown files
-- opt.inccommand = "split"

-- Additional options ----------------------------------------------------------

opt.guicursor = "" -- show fat cursor in insert mode
-- opt.textwidth = 80 -- automatically insert a new line at the given length
-- opt.hlsearch = false -- do not highlight all matches
-- opt.colorcolumn = "80"
opt.breakindent = true -- preserve indentation in wrapped text
