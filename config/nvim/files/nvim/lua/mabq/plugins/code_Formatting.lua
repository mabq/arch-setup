-- Notes:
--
--   Indentation behaviour is controlled by the following neovim options:
--
--     - tabstop     - number of spaces to use for a <Tab>
--
--     - shiftwidth  - number of spaces to use for each step of (auto)indent
--                     >>, <<, =
--
--     - softtabstop = number of spaces that a <Tab> counts for while
--                     performing editing operations (insert mode)
--
--   The plugin `guess-indent` will automatically adjust these neovim
--   options for the given buffer based on the contents of the current buffer
--   when opening a file. It also checks for an `.editorconfig` file but does
--   not take into account configuration files for formatter tools like
--   `.stylua.toml` or `.prettierrc`.
--
--   When there is no `.editorconfig` and the content of the buffer does not
--   provide enough information to correctly adjust the settings you might
--   find that neovim indentation is not working accordingly to what you
--   specified in the formatter configuration file.
--
--   When this happens, you have 2 options:
--
--     1. Manually change the `tabstop` value to match the formatter's value.
--        `:set tabstop=<value>`
--        `shiftwidth` and `softtabstop` are configured to mimic the
--        value of `tabstop`, so you don't need to change those.
--
--     2. Configure neovim to use a different indentation level for all files
--        of a given file type.
--        `~/.config/nvim/after/ftplugin/<filetype>.lua`.
--
--  The `conform` plugin makes it really easy to specify one or more formatters
--  per language. If you do not specify any it will fallback to LSP.
--
--  Make sure you use `:checkhealth conform` to verify everything is working
--  properly.

return {
  {
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
        -- https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters
        lua = { 'stylua' },
        python = { 'isort', 'black' }, -- run multiple formatters sequentially
        rust = { 'rustfmt', lsp_format = 'fallback' },
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
