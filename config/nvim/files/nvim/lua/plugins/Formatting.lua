-- Indentation is controlled by the following vim options:
--
--   - tabstop     - number of spaces to use for a `<Tab>`.
--   - shiftwidth  - number of spaces to use for each step of (auto)indent `>>`, `<<`, `=`.
--   - softtabstop - number of spaces that a `<Tab>` counts for while performing editing operations (insert mode).
--
-- `guess-indent` plugin will automatically adjust these options (for the current buffer) by analizing contents of the file.
-- It also checks for an `.editorconfig` file but does NOT check for any formatter configuration file like `.stylua.toml` or `.prettierrc`.
--
-- When there is no `.editorconfig` and the content of the buffer does not provide enough information to correctly adjust these options, indentation will work as you specified in the formatter configuration file. When this happens, you can:
--
--   1. Manually change the `tabstop` value to match the formatter's value with `:set tabstop=<value>`. `shiftwidth` and `softtabstop` are configured to mimic the value of `tabstop`, so you don't need to change those.
--   2. If you don't want to do that every time you open a buffer of that file type, you can configure neovim to use a different `tabstop` value for that specific file type in `~/.config/nvim/after/ftplugin/<filetype>.lua`.
--
-- The `conform` plugin makes it really easy to specify one or more formatters per language. If you do not specify any formatter it will fallback to LSP.
-- Make sure you use `:checkhealth conform` to verify everything is working properly.

return {
  {
    'NMAC427/guess-indent.nvim',
    opts = {},
  },
  {
    'stevearc/conform.nvim',
    dependencies = {
      {
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        dependencies = { 'mason-org/mason.nvim', opts = {} },
        opts = {
          ensure_installed = {
            'biome', -- https://biomejs.dev/internals/language-support/
            -- 'black',
            'stylua',
          },
        },
      },
    },
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      -- stylua: ignore
      { '<leader>f', function() require('conform').format { async = true, lsp_format = 'fallback' } end, mode = '', desc = 'Format buffer', },
    },
    opts = {
      notify_on_error = true,
      notify_no_formatters = true,
      formatters_by_ft = {
        -- https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters
        lua = { 'stylua' },
        -- python = { 'isort', 'black' }, -- run multiple formatters sequentially
        -- rust = { 'rustfmt', lsp_format = 'fallback' },
        css = { 'biome', 'prettierd', 'prettier', stop_after_first = true },
        javascript = { 'biome', 'prettierd', 'prettier', stop_after_first = true },
        typescript = { 'biome', 'prettierd', 'prettier', stop_after_first = true },
        json = { 'biome', 'prettierd', 'prettier', stop_after_first = true },
        jsonc = { 'biome', 'prettierd', 'prettier', stop_after_first = true },
        markdown = { 'biome', 'prettierd', 'prettier', stop_after_first = true },
      },
    },
  },
}
