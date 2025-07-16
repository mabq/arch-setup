-- Always prefer spaces
return {
  {
    -- Automatically override neovim indent options based on file detection.
    'NMAC427/guess-indent.nvim',
    opts = {},
  },
  {
    -- Automatically install formatting tools used by conform
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    config = function()
      require('mason-tool-installer').setup {
        ensure_installed = {
          'biome', -- https://biomejs.dev/internals/language-support/
          'black',
          'stylua',
        },
      }
    end,
  },
  {
    -- Automatically use LSP or manually pick a formatter per language.
    -- Available formatters: https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters
    -- `:checkhealth conform`
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>F',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = true,
      notify_no_formatters = true,
      formatters_by_ft = {
        lua = { 'stylua' },
        -- Conform will run multiple formatters sequentially
        python = { 'isort', 'black' },
        -- You can customize some of the format options for the filetype (:help conform.format)
        rust = { 'rustfmt', lsp_format = 'fallback' },
        -- Conform will run the first available formatter
        css = { 'biome', 'prettierd', 'prettier', stop_after_first = true },
        javascript = { 'biome', 'prettierd', 'prettier', stop_after_first = true },
        typescript = { 'biome', 'prettierd', 'prettier', stop_after_first = true },
        json = { 'biome', 'prettierd', 'prettier', stop_after_first = true },
        jsonc = { 'biome', 'prettierd', 'prettier', stop_after_first = true },
        markdown = { 'biome', 'prettierd', 'prettier', stop_after_first = true },
        nix = { 'nixfmt' },
      },
    },
  },
}
