return {
    'VonHeikemen/lsp-zero.nvim', -- a starting point to setup some lsp related features in neovim
    branch = 'v3.x',
    lazy = false,
    dependencies = {
        {
            'neovim/nvim-lspconfig', -- a collection of LSP configs
            dependencies = {
                'williamboman/mason.nvim', -- allow Neovim to download language servers (and other type of tools) into a particular folder
                'williamboman/mason-lspconfig.nvim', -- integration between the external tools managed by mason and neovim
                {
                    'hrsh7th/nvim-cmp', -- the response content of lsp servers depends on the capabilities of the client, `nvim-cmp` extends those capabilities
                    dependencies = {
                        { 'hrsh7th/cmp-nvim-lsp' }, -- completion source for neovim builtin LSP client
                        { 'hrsh7th/cmp-buffer' }, -- completion source for buffer words
                        { 'hrsh7th/cmp-path' }, -- completion source for paths
                        { 'hrsh7th/cmp-cmdline' }, -- completion source for neovim command-line
                        { 'hrsh7th/cmp-nvim-lua' }, -- completion source for neovim's Lua API
                        {
                            'L3MON4D3/LuaSnip', -- snippet engine for neovim
                            dependencies = {
                                { 'saadparwaiz1/cmp_luasnip' }, -- completion source for LuaSnip
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

        require('mason').setup({})
        require('mason-lspconfig').setup({
            handlers = {
                lsp_zero.default_setup,
            },
        })

        lsp_zero.on_attach(function(client, bufnr)
            -- see `:h lsp-zero-keybindings` to learn the available actions
            lsp_zero.default_keymaps({ buffer = bufnr })
        end)

        local cmp = require('cmp')
        local cmp_action = lsp_zero.cmp_action()
        cmp.setup({
            mapping = cmp.mapping.preset.insert({
                -- `Enter` key to confirm completion
                ['<CR>'] = cmp.mapping.confirm({ select = false }),

                -- Ctrl+Space to trigger completion menu
                ['<C-Space>'] = cmp.mapping.complete(),

                -- Navigate between snippet placeholder
                ['<C-f>'] = cmp_action.luasnip_jump_forward(),
                ['<C-b>'] = cmp_action.luasnip_jump_backward(),

                -- Scroll up and down in the completion documentation
                ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                ['<C-d>'] = cmp.mapping.scroll_docs(4),
            })
        })

        -- configure `lua language server`
        local lua_opts = lsp_zero.nvim_lua_ls() -- this configuration disable warnings for the `vim` global variable
        require('lspconfig').lua_ls.setup(lua_opts)
    end,

}

-- use {
    -- 	  'VonHeikemen/lsp-zero.nvim',
    -- 	  branch = 'v1.x',
    -- 	  requires = {
        -- 		  -- LSP Support
        -- 		  {'neovim/nvim-lspconfig'}, -- done
        -- 		  {'williamboman/mason.nvim'},
        -- 		  {'williamboman/mason-lspconfig.nvim'},
        --
        -- 		  -- Autocompletion
        -- 		  {'hrsh7th/nvim-cmp'}, -- done
        -- 		  {'hrsh7th/cmp-buffer'},
        -- 		  {'hrsh7th/cmp-path'},
        -- 		  {'saadparwaiz1/cmp_luasnip'},
        -- 		  {'hrsh7th/cmp-nvim-lsp'}, -- done
        -- 		  {'hrsh7th/cmp-nvim-lua'},
        --
        -- 		  -- Snippets
        -- 		  {'L3MON4D3/LuaSnip'}, -- done
        -- 		  {'rafamadriz/friendly-snippets'},
        -- 	  }
        --   }
