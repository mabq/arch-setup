-- Watch [Treesitter basics and installation](https://www.youtube.com/watch?v=MpnjYb-t12A&list=PLep05UYkc6wTyBe7kPjQFWVXTlhKeQejM&index=6)
-- `:help lsp-vs-treesitter`
-- `:help nvim-treesitter`
-- `:checkhealth nvim-treesitter`
-- `:Inspect` - shows all currently applied highlights for text under cursor.

-- If you get an error, try syncing all plugins with Lazy.

return {
    {
        -- Treesitter
        --   Better code highlight, indent `=`, incremental selection
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            require('nvim-treesitter.configs').setup {
                -- Supported languages: https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#supported-languages
                ensure_installed = {
                    'bash',
                    'css',
                    'diff',
                    'editorconfig',
                    'git_config',
                    'go',
                    'html',
                    'javascript',
                    'jq',
                    'jsdoc',
                    'json',
                    'json5',
                    -- 'latex',
                    'lua',
                    'luadoc',
                    'markdown',
                    'markdown_inline',
                    'python',
                    'query',
                    'rust',
                    'sql',
                    'ssh_config',
                    'styled',
                    -- 'tmux', (doesn't work properly)
                    'toml',
                    'tsx',
                    'typescript',
                    'vim',
                    'vimdoc',
                    'xml',
                    'yaml',
                },
                -- Install parsers synchronously (only applied to `ensure_installed`)
                sync_install = false,
                -- Automatically install missing parsers when entering buffer
                -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
                auto_install = false,
                -- List of parsers to ignore installing (or "all")
                ignore_install = {},
                -- Hightlight feature
                highlight = {
                    enable = true,
                    -- Disable for large files
                    disable = function(lang, buf)
                        local max_filesize = 100 * 1024 -- 100 KB
                        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                        if ok and stats and stats.size > max_filesize then
                            return true
                        end
                    end,
                    -- only really required for ruby or php
                    additional_vim_regex_highlighting = false,
                },
                indent = {
                    -- Indentation based on treesitter for the `=` operator.
                    enable = true,
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = '<right>',
                        node_incremental = '<right>',
                        scope_incremental = false,
                        node_decremental = '<left>',
                    },
                },
                modules = {
                    -- Additional modules that might interest you:
                    --   - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
                    --   - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
                    --   - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
                },
            }
        end,
    },

    {
        -- Use treesitter to auto close and auto rename html tag (works with all major syntax extensions)
        --   Will not work unless you have treesitter parsers (like ht ml) installed for a given filetype.
        'windwp/nvim-ts-autotag',
        -- opts = {
        --     enable_close = true, -- auto close tags
        --     enable_rename = true, -- auto rename pairs of tags
        --     enable_close_on_slash = false, -- auto close on trailing </
        -- },
    },
}
