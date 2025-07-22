return {
  {
    'folke/trouble.nvim',
    opts = { focus = true },
    cmd = 'Trouble',
    keys = {
      { '<leader>vd', '<cmd>Trouble diagnostics toggle<cr>', desc = 'Trouble: View diagnostics' },
      { '<leader>vb', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', desc = 'Trouble: View buffer diagnostics' },
      { '<leader>vs', '<cmd>Trouble symbols toggle<cr>', desc = 'Trouble: View symbols' },
      { '<leader>vl', '<cmd>Trouble loclist toggle<cr>', desc = 'Trouble: View location list' },
      { '<leader>vq', '<cmd>Trouble qflist toggle<cr>', desc = 'Trouble: View quickfix list' },
      { '<leader>vt', '<cmd>Trouble telescope_files toggle<cr>', desc = 'Trouble: View telescope files' }, -- see telescope config
    },
  },
  {
    'folke/todo-comments.nvim',
    opts = {},
    cmd = 'TodoTrouble',
    keys = {
      { '<leader>vt', '<cmd>TodoTrouble toggle<cr>', desc = 'TodoTrouble: View todo list' },
    },
  },
}
