-- Documentation: 
--   https://github.com/nvim-telescope/telescope.nvim
--   `:help telescope` --- main docs
--   `:help telescope.command`
--   `:help telescope.builtin.{PLUGIN_NAME}()`
--   `:Telescope help_tags` is pretty useful to find help

local builtin = require("telescope.builtin")

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>fs', function()
    builtin.grep_string( { search = vim.fn.input("Project search: ") } );
end)
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

