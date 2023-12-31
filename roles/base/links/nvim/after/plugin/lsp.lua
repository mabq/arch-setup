-- You might not need lsp zero:
--   https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/you-might-not-need-lsp-zero.md

-- Prime config:
--   https://github.com/ThePrimeagen/init.lua/blob/249f3b14cc517202c80c6babd0f9ec548351ec71/after/plugin/lsp.lua


-------------------------------------------------------------------------------

--  1. Setup a few default options for lspconfig:

local lspconfig = require('lspconfig')

--     https://github.com/hrsh7th/cmp-nvim-lsp#capabilities
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local opts = { buffer = event.buf, remap = false }

        vim.keymap.set({ 'n', 'x' }, '<leader>fo', function() vim.lsp.buf.format({ async = true }) end, opts)

        vim.keymap.set('n', '<leader>r', function() vim.lsp.buf.rename() end, opts)

        vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)

        vim.keymap.set('n', '<leader>vr', function() vim.lsp.buf.references() end, opts)
        vim.keymap.set('n', '<leader>vca', function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)

        vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set('n', '[d', function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set('n', ']d', function() vim.diagnostic.goto_next() end, opts)

        vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
    end
})

local default_setup = function(server)
    lspconfig[server].setup({
        capabilities = lsp_capabilities,
    })
end


-------------------------------------------------------------------------------

-- 2. Use mason.nvim and mason-lspconfig.nvim to manage all your LSP servers:

require('mason').setup({})
require('mason-lspconfig').setup({
    -- for available servers see: https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
    ensure_installed = { 'lua_ls', 'tsserver' },

    handlers = {
        default_setup,

        -- Custom configs for LSP servers --
        lua_ls = function()
            -- fix undifined global "vim"
            require('lspconfig').lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' },
                        },
                    }
                }
            })
        end,
    },
})


-------------------------------------------------------------------------------

-- 3. Setup completions using nvim-cmp:
--    https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/autocomplete.md

local cmp = require('cmp')

cmp.setup({
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'buffer' },
        { name = 'LuaSnip' },
    }),
    mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-space>'] = cmp.mapping.complete(),
    }),
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
})

