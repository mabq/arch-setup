return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = false,

    config = function()
        local lsp_zero = require("lsp-zero")

        lsp_zero.on_attach(function(client, bufnr)
            -- see `:h lsp-zero-keybindings` to learn the available actions
            lsp_zero.default_keymaps({ buffer = bufnr })
        end)

        -- load mason
        require('mason').setup({})
        require('mason-lspconfig').setup({
            handlers = {
                lsp_zero.default_setup,
            },
        })

        -- configure `lua_ls`
        local lua_opts = lsp_zero.nvim_lua_ls() -- this configuration disable warnings for the `vim` global variable
        require('lspconfig').lua_ls.setup(lua_opts)

        -- customize `nvim_cmp`
        local cmp = require('cmp')
        local cmp_action = require('lsp-zero').cmp_action()
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
    end,

    dependencies = {
        -- mason (install LSP servers)
        { 'williamboman/mason.nvim' },
        -- mason-lspconfig (automatic setup of every language server we install)
        { 'williamboman/mason-lspconfig.nvim' },
        -- LSP support
        {
            'neovim/nvim-lspconfig',
            dependencies = {
                { 'hrsh7th/cmp-nvim-lsp' },
            }
        },
        -- Autocompletion
        {
            'hrsh7th/nvim-cmp',
            dependencies = {
                { 'L3MON4D3/LuaSnip' }
            },
        },
    },
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
