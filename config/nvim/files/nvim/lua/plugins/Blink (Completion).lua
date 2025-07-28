return {
  'saghen/blink.cmp',
  event = 'VimEnter',
  version = '1.*',
  dependencies = {
    'rafamadriz/friendly-snippets',
    'moyiz/blink-emoji.nvim',
    'folke/lazydev.nvim',
  },
  opts = {
    keymap = { preset = 'default' }, -- similar to built-in completion keymaps, see https://cmp.saghen.dev/configuration/keymap#default
    signature = { enabled = true }, -- or use `Ctrl-k` to toggle it manually
    appearance = { nerd_font_variant = 'mono' },
    completion = {
      documentation = {
        auto_show = false, -- or set to `true` to auto-show documentation after a delay
        auto_show_delay_ms = 500,
      },
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer', 'lazydev', 'emoji' },
      providers = {
        lazydev = {
          module = 'lazydev.integrations.blink',
          score_offset = 100,
        },
        emoji = {
          module = 'blink-emoji',
          score_offset = 15,
        },
      },
    },
    fuzzy = { implementation = 'prefer_rust_with_warning' },
  },
  opts_extend = { 'sources.default' },
}

-- Use `checkhealth blink.cmp` to verify everything is setup correctly.
