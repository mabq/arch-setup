return {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim', -- significantly improve sorting performance
      build = 'make', -- `make` must be installed, in Archlinux provided by the `base-devel` package
    },
    'nvim-tree/nvim-web-devicons',
    'folke/trouble.nvim', -- send results to Trouble
  },
  config = function()
    -- Telescope customization - https://github.com/nvim-telescope/telescope.nvim?tab=readme-ov-file#customization
    local actions = require 'telescope.actions'
    local open_with_trouble = require('trouble.sources.telescope').open -- overwrites any previous Telescope list in Trouble
    local append_to_trouble = require('trouble.sources.telescope').add -- appends to any previous Telescope list in Trouble
    require('telescope').setup {
      defaults = {
        mappings = {
          n = {
            ['q'] = actions.close,
            ['<c-t>'] = open_with_trouble,
            ['<c-a>'] = append_to_trouble,
          },
          i = {
            ['<c-t>'] = open_with_trouble,
            ['<c-a>'] = append_to_trouble,
          },
        },
      },
    }

    -- Enable extensions
    pcall(require('telescope').load_extension, 'fzf')

    -- Keymaps, see`:help telescope.builtin`
    -- stylua: ignore start
    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', '<C-f>', builtin.find_files, { desc = 'Telescope: files' })
    vim.keymap.set('n', '<C-g>', builtin.git_files, { desc = 'Telescope: git files' })
    vim.keymap.set('n', '<leader>tr', builtin.resume, { desc = 'Telescope: resume' })
    vim.keymap.set('n', '<leader>tb', builtin.buffers, { desc = 'Telescope: buffers' })
    vim.keymap.set('n', '<leader>tl', builtin.live_grep, { desc = 'Telescope: live grep' })
    vim.keymap.set('n', '<leader>tg', function() builtin.grep_string { search = vim.fn.input 'Grep > ' } end, { desc = 'Telescope: grep input' })
    vim.keymap.set('n', '<leader>tw', builtin.grep_string, { desc = 'Telescope: grep word under cursor' })
    vim.keymap.set('n', '<leader>tt', builtin.builtin, { desc = 'Telescope (all)' })
    vim.keymap.set('n', '<leader>tk', builtin.keymaps, { desc = 'Telescope: keymaps' })
    vim.keymap.set('n', '<leader>th', builtin.help_tags, { desc = 'Telescope: help' })
    -- stylua: ignore end
  end,
}

-- Notes;
--   Use `<tab>` to toggle selection, only selected items will be send to Trouble.
--
--   Use `<c-/>` (insert mode) or `?` (normal mode) to show Telescope keybindings.
--   Or see [default mappings]https://github.com/nvim-telescope/telescope.nvim?tab=readme-ov-file#default-mappings)
--
--   Use `:checkhealth telescope` to check everything is setup correctly.
