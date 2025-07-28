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
    keymap = {
      preset = 'default', -- similar to built-in completion keymaps, see https://cmp.saghen.dev/configuration/keymap#default
      ['<C-o>'] = { 'show', 'show_documentation', 'hide_documentation' }, -- default is `Ctrl-Space` but I use that as Tmux-prefix
    },
    signature = { enabled = true }, -- or use `Ctrl-k` to toggle it manually
    completion = {
      documentation = { auto_show = true }, -- or use `Ctro-o` to toggle it manually
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer', 'lazydev', 'emoji' },
      providers = {
        lazydev = {
          name = 'LazyDev',
          module = 'lazydev.integrations.blink',
          score_offset = 100,
        },
        emoji = {
          module = 'blink-emoji',
        },
      },
    },
    fuzzy = { implementation = 'prefer_rust_with_warning' },
    appearance = { nerd_font_variant = 'mono' },
  },
  opts_extend = { 'sources.default' },
}

-- Use `checkhealth blink.cmp` to verify everything is setup correctly.
