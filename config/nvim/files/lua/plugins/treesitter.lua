return {
    {
        --  Treesitter is a new parser generator tool that we can use in Neovim to power faster and more accurate syntax highlighting.
        enabled = true,
        'nvim-treesitter/nvim-treesitter',
        name = 'treesitter',
        build = ':TSUpdate',
        event = 'VeryLazy',
        config = function ()
            require('nvim-treesitter.configs').setup({
                ensure_installed = { 
                    -- A list of parser names, or "all" (the first five listed parsers should always be installed)
                    "c",
                    "lua",
                    "vim",
                    "vimdoc",
                    "query",
                },

                -- Install parsers synchronously (only applied to `ensure_installed`)
                sync_install = false,

                -- Automatically install missing parsers when entering buffer
                -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
                auto_install = true,

                -- Modules
                highlight = {
                    enable = true,

                    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                    -- Using this option may slow down your editor, and you may see some duplicate highlights.
                    -- Instead of true it can also be a list of languages
                    additional_vim_regex_highlighting = false,
                },

                -- indent = { enable = true },
            })
        end
    },

    {
        -- Use treesitter to autoclose and autorename html tag
        enabled = true,
        'windwp/nvim-ts-autotag',
        name = 'autotag',
        ft = { 'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'tsx', 'jsx', 'rescript', 'xml', 'php', 'markdown', 'astro', 'glimmer', 'handlebars', 'hbs' },
        config = function ()
            require'nvim-treesitter.configs'.setup {
                autotag = {
                    enable = true,
                }
            }
        end
    },
}
