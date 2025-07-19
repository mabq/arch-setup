return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  opts = {
    modes = {
      -- just for jumping
      search = { enabled = false },
      char = { enabled = false },
    },
    highlight = {
      -- do not gray out all text while using it
      backdrop = false,
    },
  },
  keys = {
    -- stylua: ignore
    { 'f', mode = { 'n', 'x', 'o' }, function() require('flash').jump() end, desc = 'Flash', },
  },
}
