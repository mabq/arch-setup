return {
  -- Performant, batteries-included completion plugin for Neovim
  'saghen/blink.cmp',
  dependencies = {
    'rafamadriz/friendly-snippets',
    'moyiz/blink-emoji.nvim',
  },
  version = '*',
  opts = {
    -- https://cmp.saghen.dev/configuration/keymap.html#presets
    keymap = { preset = 'default' },
    signature = {
      enabled = false, -- just use Shift-k in normal mode to see the function signature
    },
    -- appearance = {
    -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'. Adjusts spacing to ensure icons are aligned.
    -- nerd_font_variant = 'mono',
    -- },
    -- https://cmp.saghen.dev/configuration/sources.html#sources
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer', 'emoji' },
      providers = {
        emoji = {
          module = 'blink-emoji',
          name = 'Emoji',
          score_offset = 15, -- Tune by preference
        },
      },
    },
  },
  opts_extend = { 'sources.default' },
}
