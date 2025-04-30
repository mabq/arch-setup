return {
  {
    "catppuccin/nvim",
    enabled = false, -- disable catppuccin
  },
  {
    "folke/tokyonight.nvim", -- edit some tokyonight colors
    opts = {
      style = "moon",
      on_colors = function(colors)
        colors.bg_hightlight = colors.yellow
      end,
      on_highlights = function(hl, _)
        hl.CursorLine = {
          bg = "#1f202e", -- much lighter contrast
        }
        hl.CursorLineNr = {
          bold = false, -- disabled bold
          fg = "#ff9e64",
        }
        hl.CursorColumn = {
          bg = "#1f202e", -- set it manually `:set cursorColumn!`
        }
        hl.ColorColumn = {
          bg = "#1f202e", -- set it manually with `:colorcolumn=[value|empty]`
        }
        hl.LspReferenceRead = {
          bg = "#292E42", -- much lighter contrast
        }
        hl.LspReferenceText = {
          bg = "#292E42",
        }
        hl.LspReferenceWrite = {
          bg = "#292E42",
        }
        hl.WinSeparator = {
          bold = true,
          fg = "#404464", -- much lighter contrast
        }
      end,
    },
  },

  --- Set the theme -----------------------------------------------------------
  {
    "LazyVim/LazyVim",
    opts = {
      -- update LazyVim configuration to setup the colorscheme
      colorscheme = "tokyonight-night",
    },
  },
}
