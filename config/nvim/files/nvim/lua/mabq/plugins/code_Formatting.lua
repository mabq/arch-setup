return {
    -- Some languages provide standardized formatting tools (Go, Rust, etc.),
    -- some others don't (JavaScript, CSS, etc).
    --
    -- For the ones that do, just use a `.editorconfig` file. For the ones that
    -- do not install a specialized tool here.
    --
    -- Conform makes it really ease to use a specialized tools and in case
    -- there is none, use the LPS formatter as a fallback option.
    --
    -- Watch:
    --   [Code Formatting made easy](https://youtu.be/mEqqkHLhlGY?si=TkREPnxfCoWKpcl_&t=394]
    --   [Configure Neovim's Options (and per-language config)](https://www.youtube.com/watch?v=F1CQVXA5gf0&list=PLep05UYkc6wTyBe7kPjQFWVXTlhKeQejM&index=7)
    --
    -- Tip!
    --   When changing a formatting configuration file, reload the buffer with `:e`.
    --   Run `:checkhealth conform` to verify everything is ok with this plugin.

    {
        -- Adjust `shiftwidth` based on the current file status or based on
        -- other files of the same type nearby. Respects `.editorconfig`.
        'tpope/vim-sleuth',
    },
    {
        -- Install formatting tools
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        config = function()
            require('mason-tool-installer').setup {
                ensure_installed = {
                    'biome', -- https://biomejs.dev/internals/language-support/
                    'stylua',
                    'black', -- python
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
            { '<leader>f', function() require('conform').format() end, mode = '', },
        },
        opts = {
            formatters_by_ft = {
                -- Available formatters:
                --   https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters
                lua = { 'stylua' },
                -- Run multiple formatters sequentially:
                -- python = { "isort", "black" },
                css = { 'biome' },
                javascript = { 'biome' },
                typescript = { 'biome' },
                json = { 'biome' },
                jsonc = { 'biome' },
                markdown = { 'biome' },
                python = { 'black' },
            },
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
                    lsp_format = lsp_format_opt,
                }
            end,
            default_format_opts = {
                lsp_format = 'fallback', -- only use LPS format as a fallback option
                stop_after_first = true, -- make sure only one formatter applies
                timeout_ms = 500,
                async = true,
                quiet = false, -- show if there is no formatter
            },
            notify_on_error = true,
            notify_no_formatters = true,
        },
    },
}
