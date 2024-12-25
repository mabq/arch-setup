return {
  -- {
  --   "rcarriga/nvim-notify",
  --   enabled = false,
  -- },
  {
    "folke/noice.nvim",
    enabled = false,
  },
  {
    "nvimdev/dashboard-nvim",
    enabled = false,
  },
  {
    "akinsho/bufferline.nvim",
    enabled = false, -- use harpoon instead
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      local icons = LazyVim.config.icons
      opts["sections"]["lualine_a"] = {
        -- capitalize only the first letter of the mode
        {
          "mode",
          fmt = function(str)
            return str:sub(1, 1):upper() .. str:sub(2):lower()
          end,
        },
      }
      opts["sections"]["lualine_c"] = {
        -- remove some info and edit others
        {
          -- don't show the "root" directory for the current buffer
          "diagnostics",
          symbols = {
            error = icons.diagnostics.Error,
            warn = icons.diagnostics.Warn,
            info = icons.diagnostics.Info,
            hint = icons.diagnostics.Hint,
          },
        },
        -- don't show the filetype icon
        {
          "filename",
          path = 3, -- show full path -  https://github.com/nvim-lualine/lualine.nvim?tab=readme-ov-file#filename-component-options
          color = { fg = "@markup" }, -- in white
        },
      }
    end,
  },

  -- Additional plugins ----------------------------------------------------------------

  {
    -- Distraction-free coding for Neovim
    "folke/zen-mode.nvim",
    keys = {
      {
        "<leader>uz",
        function()
          require("zen-mode").toggle()
        end,
        mode = { "n" },
        desc = "Zenmode",
      },
    },
    config = function()
      require("zen-mode").setup({
        -- https://github.com/folke/zen-mode.nvim#%EF%B8%8F-configuration
        window = {
          backdrop = 0.95,
          width = 110,
          options = {
            number = false,
            relativenumber = false,
            cursorcolumn = false,
          },
        },
      })
    end,
  },
  {
    -- Animations based on the content of neovim buffer
    "eandrju/cellular-automaton.nvim",
    keys = {
      {
        '<leader>u"',
        "<cmd>CellularAutomaton make_it_rain<CR>",
        desc = "Mait it rain (CellularAutomation)",
      },
    },
  },
}
