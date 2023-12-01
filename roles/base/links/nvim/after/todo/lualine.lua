-- Info: https://github.com/nvim-lualine/lualine.nvim

-- Theme -----------------------------------------------------------------------

local color_black_low = "#191724"
local color_black = "#1f1d2e"
local color_black_high = "#26233a"

local color_highlight_low = "#21202e"
local color_highlight = "#403d52"
local color_highlight_high = "#524f67"

local color_white_low = "#6e6a86"
local color_white = "#908caa"
local color_white_high = "#e0def4"

local color_red_low = "#eb6f92"
local color_red = "#eb6f92"
local color_red_high = "#eb6f92"

local color_green_low = "#31748f"
local color_green = "#31748f"
local color_green_op = "#31748f7f"
local color_green_high = "#31748f"

local color_yellow_low = "#f6c177"
local color_yellow = "#f6c177"
local color_yellow_high = "#f6c177"

local color_cyan_low = "#9ccfd8"
local color_cyan = "#9ccfd8"
local color_cyan_high = "#9ccfd8"

local color_magenta_low = "#c4a7e7"
local color_magenta = "#c4a7e7"
local color_magenta_high = "#c4a7e7"

local color_rose_low = "#ebbcba"
local color_rose = "#ebbcba"
local color_rose_high = "#ebbcba"

local custom_theme = {
  normal = {
    a = { bg = color_magenta, fg = color_black_low },
    b = { bg = color_highlight, fg = color_white_high },
    c = { bg = color_highlight_low, fg = color_white_high, gui = 'italic' },
    x = { bg = color_highlight_low, fg = color_white_high },
    y = { bg = color_highlight, fg = color_white_high },
    z = { bg = color_highlight_high, fg = color_white_high },
  },
  insert = {
    a = { bg = color_green, fg = color_white_high },
    b = { bg = color_highlight_high, fg = color_white_high },
    c = { bg = color_highlight_low, fg = color_white_high },
    x = { bg = color_highlight_low, fg = color_white_high },
    y = { bg = color_highlight, fg = color_white_high },
    z = { bg = color_highlight_high, fg = color_white_high },
  },
  visual = {
    a = { bg = color_white_high, fg = color_black_low },
    b = { bg = color_highlight_high, fg = color_white_high },
    c = { bg = color_highlight_low, fg = color_white_high },
    x = { bg = color_highlight_low, fg = color_white_high },
    y = { bg = color_highlight, fg = color_white_high },
    z = { bg = color_highlight_high, fg = color_white_high },
  },
  replace = {
    a = { bg = color_red, fg = color_black_low },
    b = { bg = color_highlight_high, fg = color_white_high },
    c = { bg = color_highlight_low, fg = color_white_high },
    x = { bg = color_highlight_low, fg = color_white_high },
    y = { bg = color_highlight, fg = color_white_high },
    z = { bg = color_highlight_high, fg = color_white_high },
  },
  command = {
    a = { bg = color_yellow, fg = color_black_low },
    b = { bg = color_highlight_high, fg = color_white_high },
    c = { bg = color_highlight_low, fg = color_white_high },
    x = { bg = color_highlight_low, fg = color_white_high },
    y = { bg = color_highlight, fg = color_white_high },
    z = { bg = color_highlight_high, fg = color_white_high },
  },
  terminal = {
    a = { bg = color_yellow, fg = color_black_low },
    b = { bg = color_highlight_high, fg = color_white_high },
    c = { bg = color_highlight_low, fg = color_white_high },
    x = { bg = color_highlight_low, fg = color_white_high },
    y = { bg = color_highlight, fg = color_white_high },
    z = { bg = color_highlight_high, fg = color_white_high },
  },
  inactive = {
    -- a = { bg = color_highlight, fg = color_white, gui = 'bold' },
    -- b = { bg = color_highlight_low, fg = color_white },
    c = { bg = color_highlight, fg = color_white, gui = 'italic' },
    -- x = { bg = color_highlight_low, fg = color_white_low, gui = 'italic' },
    -- y = { bg = color_black_high, fg = color_white },
    -- z = { bg = color_highlight_low, fg = color_white_low },
  },
}


-- Config ----------------------------------------------------------------------

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = custom_theme,
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = false,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = { {'mode', fmt = function(str) return string.lower(str) end } },
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {'searchcount', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
