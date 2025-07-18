return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  opts = {
    modes = {
      search = { enabled = false }, -- do not integrate on default search
      char = { enabled = false }, -- do not integrate on default `f`, `F`, `t`, `T`
    },
    highlight = {
      backdrop = false, -- do not gray out all text when using jump mode
    },
    label = {
      -- put the label in the front
      after = false,
      before = true,
    },
  },
  keys = {
    -- stylua: ignore
    { 'f', mode = { 'n', 'x', 'o' }, function() require('flash').jump() end, desc = 'Flash', },
  },
}
