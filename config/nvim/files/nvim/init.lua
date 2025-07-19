require 'config.options'
require 'config.keymaps'
require 'config.lazy' -- must go after options and keymaps
require 'config.autocmds'

vim.cmd.colorscheme('tokyonight')
