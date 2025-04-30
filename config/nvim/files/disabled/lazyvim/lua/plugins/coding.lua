return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" }, -- add emoji cmp source
    opts = function(_, opts)
      -- disable ghost-text
      opts.experimental.ghost_text = false
      -- add emojis
      table.insert(opts.sources, { name = "emoji" })
      -- edit keybindings
      local cmp = require("cmp")
      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        -- do not complete with enter, frustrating when the intention is to create a new line, use default `Ctrl-y` instead
        ["<CR>"] = function(fallback)
          cmp.abort()
          fallback()
        end,
      })
    end,
  },
  {
    "echasnovski/mini.pairs",
    enabled = false,
  },

  --- Additional plugins -------------------------------------------------------

  {
    -- The undo history visualizer for VIM
    "mbbill/undotree",
    keys = {
      { "<leader>uu", "<cmd>UndotreeToggle<CR>", mode = { "n" }, desc = "Undotree" },
    },
  },
}
