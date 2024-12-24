return {
    -- The order of precedence for formatting is:
    --   1) Formatter specified in the Conform plugin
    --   2) vim-sleuth automatically adjusts 'shiftwidth' and 'expandtab'
    --      heuristically based on the current file, or, in the case the current
    --      file is new, blank, or otherwise insufficient, by looking at other
    --      files of the same type in the current and parent directories.
    --      Modelines and EditorConfig are also consulted, adding 'tabstop',
    --      'textwidth', 'endofline', 'fileformat', 'fileencoding', and 'bomb'
    --      to the list of supported options.
    --      Watch: https://youtu.be/mEqqkHLhlGY?si=TkREPnxfCoWKpcl_&t=394
    --   3) To manually configure `shiftwidth` per language watch:
    --      https://www.youtube.com/watch?v=F1CQVXA5gf0&list=PLep05UYkc6wTyBe7kPjQFWVXTlhKeQejM&index=7
    --
    -- Tip!
    --   Reload the file `:e` to update intentation options.

    {
        -- Heuristically based configs (respects `.editorconfig`).
        'tpope/vim-sleuth',
    },
    {
        -- Automatically install formatter tools
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        config = function()
            require('mason-tool-installer').setup {
                ensure_installed = {
                    'biome',
                    'prettierd',
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
            -- stylua: ignore
            { '<leader>f', function() require('conform').format { async = true, lsp_format = 'fallback' } end, mode = '', },
        },
        opts = {
            notify_on_error = true,
            format_on_save = function(bufnr)
                -- Disable "format_on_save lsp_fallback" for languages that don't
                -- have a well standardized coding style. You can add additional
                -- languages here or re-enable it for the disabled ones.
                local disable_filetypes = { c = true, cpp = true }
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
                lua = { 'stylua' },
                -- Conform can also run multiple formatters sequentially
                -- python = { "isort", "black" },
                -- You can use 'stop_after_first' to run the first available formatter from the list
                javascript = { 'biome', 'prettierd', stop_after_first = true },
                typescript = { 'biome', 'prettierd', stop_after_first = true },
            },
        },
    },
}
