return {
    -- A buffer can be formatted by one or more tools. Conform allows you to
    -- easily configure which tools you want to use for each language.
    --
    -- Specialized formatting tools like `stylua` or `biome` can be used
    -- when the LPS does not provide (or does it but poorly) formatting
    -- capabilities.
    --
    --
    -- Make sure there is only one format configuration file (`.editorconfig`,
    -- `.stylua.tom`, `biome.json`, etc), otherwise Vim-sleuth might set a
    -- `shiftwidth` different than the one specified in the format configuration
    -- file.
    --
    -- For more info, watch:
    --   [Code Formatting made easy](https://youtu.be/mEqqkHLhlGY?si=TkREPnxfCoWKpcl_&t=394]
    --   [Configure Neovim's Options (and per-language config)](https://www.youtube.com/watch?v=F1CQVXA5gf0&list=PLep05UYkc6wTyBe7kPjQFWVXTlhKeQejM&index=7)
    --
    -- Tip!
    --   When changing a formatting configuration file, reload the buffer
    --   with `:e`.
    --   Run `:checkhealth conform` to verify everything is ok with this plugin.

    {
        -- Vim-sleuth will adjust `shiftwidth` based on the current file status
        -- or based on other files of the same type nearby. Respects `.editorconfig`.
        'tpope/vim-sleuth',
    },
    {
        -- Install formatting tools
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        config = function()
            require('mason-tool-installer').setup {
                ensure_installed = {
                    'biome', -- https://biomejs.dev/internals/language-support/
                    'prettierd',
                    'stylua',
                },
            }
        end,
    },
    {
        -- Specify formatting tools per language
        'stevearc/conform.nvim',
        event = { 'BufWritePre' },
        cmd = { 'ConformInfo' },
        keys = {
            -- stylua: ignore
            { '<leader>f', function() require('conform').format { async = true, lsp_format = 'fallback' } end, mode = '', },
        },
        opts = {
            notify_on_error = true,
            format_on_save = function(bufnr)
                -- Disable LSP fallback for `format_on_save` for languages that don't
                -- have a well standardized coding style. You can add additional
                -- languages here or re-enable it for the disabled ones.
                local disable_filetypes = {
                    c = true,
                    cpp = true,
                }
                local lsp_format_opt
                if disable_filetypes[vim.bo[bufnr].filetype] then
                    lsp_format_opt = 'never'
                else
                    lsp_format_opt = 'fallback'
                end
                return {
                    timeout_ms = 500,
                    lsp_format = lsp_format_opt,
                }
            end,
            formatters_by_ft = {
                -- Available formatters:
                --   https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters
                lua = { 'stylua' },
                -- Run multiple formatters sequentially:
                -- python = { "isort", "black" },
                -- You can use 'stop_after_first' to run the first available formatter from the list
                css = { 'biome', stop_after_first = true },
                javascript = { 'biome', stop_after_first = true },
                typescript = { 'biome', stop_after_first = true },
                json = { 'biome', stop_after_first = true },
                jsonc = { 'biome', stop_after_first = true },
                markdown = { 'biome', stop_after_first = true },
            },
        },
    },
}