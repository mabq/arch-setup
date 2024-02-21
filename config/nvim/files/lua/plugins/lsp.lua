-- Read `:h lsp-zero`
return {
    'VonHeikemen/lsp-zero.nvim', -- integrate `nvim-cmp` and `lspconfig` (https://lsp-zero.netlify.app/v3.x/introduction.html#what-is-lsp-zero)
    branch = 'v3.x',
    lazy = false,
    dependencies = {
        {
            'neovim/nvim-lspconfig',                                -- a collection of LSP configs
            dependencies = {
                'williamboman/mason.nvim',                          -- allow Neovim to download language servers (and other type of tools) into a particular folder
                'williamboman/mason-lspconfig.nvim',                -- integration between the external tools managed by mason and neovim
                {
                    'hrsh7th/nvim-cmp',                             -- improve Neovim's default LSP capabilities
                    dependencies = {
                        { 'hrsh7th/cmp-nvim-lsp' },                 -- completion source for neovim builtin LSP client
                        { 'hrsh7th/cmp-buffer' },                   -- completion source for buffer words
                        { 'hrsh7th/cmp-path' },                     -- completion source for paths
                        { 'hrsh7th/cmp-cmdline' },                  -- completion source for neovim command-line
                        { 'hrsh7th/cmp-nvim-lua' },                 -- completion source for neovim's Lua API
                        {
                            'L3MON4D3/LuaSnip',                     -- snippet engine for neovim
                            dependencies = {
                                { 'saadparwaiz1/cmp_luasnip' },     -- completion source for LuaSnip
                                { 'rafamadriz/friendly-snippets' }, -- preconfigured snippets for different languages
                            }
                        },
                    }
                },
            }
        },
    },

    config = function()
        local lsp_zero = require("lsp-zero")

        lsp_zero.on_attach(function(_, bufnr)
            -- use lsp-zero default keybindings (`:h lsp-zero-keybindings`)
            lsp_zero.default_keymaps({ buffer = bufnr })
        end)

        -- associate a language server with a list of filetypes, so {key} can format the buffer using only one LSP server
        -- lsp_zero.format_mapping('gq', {
        --     servers = {
        --         -- ['rust_analyzer'] = { 'rust' },
        --         -- ['tsserver'] = { 'javascript', 'typescript' },
        --         ['lua_ls'] = { 'lua' },
        --     }
        -- })

        -- customize `nvim-cmp` (`:h lsp-zero-guide:customize-nvim-cmp`)
        local cmp = require('cmp')
        local cmp_action = lsp_zero.cmp_action()
        cmp.setup({
            mapping = cmp.mapping.preset.insert({
                -- `Enter` key to confirm completion
                ['<CR>'] = cmp.mapping.confirm({ select = false }),

                -- Navigate between snippet placeholder
                ['<C-l>'] = cmp_action.luasnip_jump_forward(),
                ['<C-h>'] = cmp_action.luasnip_jump_backward(),

                -- Scroll up and down in the completion documentation
                ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                ['<C-d>'] = cmp.mapping.scroll_docs(4),
            }),
        })

        require('mason').setup({})
        require('mason-lspconfig').setup({
            ensure_installed = { 'lua_ls', 'tsserver', 'rust_analyzer' },
            handlers = {
                lsp_zero.default_setup,
                -- customize lsp behavior, see `:h lsp-zero-guide:integrate-with-mason-nvim`
                lua_ls = function()
                    -- fix Undefined global 'vim'
                    local lua_opts = lsp_zero.nvim_lua_ls()
                    require('lspconfig').lua_ls.setup(lua_opts)
                end
            },
        })
    end,
}
