-- set default colorscheme in `init.lua`
return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      style = 'night', -- storm, moon, night, day
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
      },
      on_highlights = function(hl, _)
        -- (Customized colors for `night`)
        -- hl.CursorLine = {
        --   bg = '#1a1b26', -- same color, highlights line number
        -- }
        hl.ColorColumn = {
          bg = '#1c1d29', -- `:colorcolumn=[value|empty]`
        }
        hl.Search = {
          bg = '#292E42', -- lighter constrast
          fg = '#c0caf5',
        }
        hl.LspReferenceRead = {
          bg = '#292E42', -- lighter constrast
        }
        hl.LspReferenceText = {
          bg = '#292E42',
        }
        hl.LspReferenceWrite = {
          bg = '#292E42',
        }
        hl.WinSeparator = {
          bold = true,
          fg = '#404464', -- lighter contrast
        }
      end,
    },
  },
  -- {
  --   'rose-pine/neovim',
  --   name = 'rose-pine',
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     styles = {
  --       italic = false,
  --     },
  --   },
  -- },
  -- {
  --   'catppuccin/nvim',
  --   name = 'catppuccin',
  --   lazy = false,
  --   priority = 1000,
  -- },
  -- {
  --   'rebelot/kanagawa.nvim',
  --   name = 'kanagawa',
  --   lazy = false,
  --   priority = 1000,
  -- },
  -- {
  --   'sainnhe/everforest',
  --   lazy = false,
  --   priority = 1000,
  -- },
  -- {
  --   'EdenEast/nightfox.nvim',
  --   lazy = false,
  --   priority = 1000,
  -- },
}
