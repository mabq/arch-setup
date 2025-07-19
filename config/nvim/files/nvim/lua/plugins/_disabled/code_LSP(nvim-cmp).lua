-- Watch [LSP in Neovim](https://www.youtube.com/watch?v=MpnjYb-t12A&list=PLep05UYkc6wTyBe7kPjQFWVXTlhKeQejM&index=7)
-- LSP facilitates features like go-to-definition, find references, hover, completion, rename, format, refactor, etc., using semantic whole-project analysis (unlike ctags).
-- `:h lsp`

return {
    {
        -- Default Nvim LSP client configurations for various LSP servers.
        'neovim/nvim-lspconfig',
        dependencies = {
            -- Neovim acts as an LSP client, you still need to install the actual LPS servers. Mason allows you to easily install and manage LSP servers, DAP servers, linters, and formatters.
            -- Tip: run `:echo executable('{tool-name}')` to check if the tools is findable by Neovim.
            'williamboman/mason.nvim',
            -- Makes it easier to use lspconfig with Mason
            -- Read: https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#introduction
            'williamboman/mason-lspconfig.nvim',
            -- Show LSP status updates
            'j-hui/fidget.nvim',
            -- Add extra capabilities for LSP completions
            'hrsh7th/cmp-nvim-lsp',
            {
                -- Faster LuaLS setup for Neovim
                'folke/lazydev.nvim',
                ft = 'lua', -- only load on lua files
                opts = {
                    library = {
                        -- See the configuration section for more details
                        -- Load luvit types when the `vim.uv` word is found
                        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
                    },
                },
            },
            {
                -- Better TypeScript LSP with support for styled-components
                'pmizio/typescript-tools.nvim',
                dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
                opts = {
                    -- Enable support for styled-components
                    tsserver_plugins = {
                        '@styled/typescript-styled-plugin',
                    },
                    -- LSP keymaps below do not include one to rename files, to TS use the `:TSToolsRenameFile` command provided by this plugin.
                    -- For other commands, see: https://github.com/pmizio/typescript-tools.nvim?tab=readme-ov-file#custom-user-commands
                },
            },
            {
                -- A simple popup display that provides breadcrumbs feature using LSP server
                'SmiteshP/nvim-navbuddy',
                dependencies = {
                    'SmiteshP/nvim-navic',
                    'MunifTanjim/nui.nvim',
                },
                opts = { lsp = { auto_attach = true } },
                -- keymap set below in autocommand
            },
        },
        config = function()
            require('fidget').setup {}
            require('mason').setup()

            -- Extend lsp capabilities:
            local builtin_capabilities = vim.lsp.protocol.make_client_capabilities()
            local extended_capabilities = require('cmp_nvim_lsp').default_capabilities()
            local capabilities = vim.tbl_deep_extend('force', {}, builtin_capabilities, extended_capabilities)
            require('mason-lspconfig').setup {
                ensure_installed = {
                    -- `:h lspconfig-all` shows the list of all pre-configured LSPs (by `nvim-lspconfig`)
                    'lua_ls',
                    'cssls',
                    'html',
                },
                automatic_installation = false,
                handlers = {
                    -- Here you can customize the config provided by `nvim-lspconfig` for each LSP:

                    -- Default handler:
                    -- Adds the extra lsp capabilities provided by `cmp-nvim-lsp`):
                    function(server_name)
                        require('lspconfig')[server_name].setup {
                            capabilities = capabilities,
                        }
                    end,

                    -- Zig handler (example):
                    -- zls = function()
                    --     local lspconfig = require 'lspconfig'
                    --     lspconfig.zls.setup {
                    --         root_dir = lspconfig.util.root_pattern('.git', 'build.zig', 'zls.json'),
                    --         settings = {
                    --             zls = {
                    --                 enable_inlay_hints = true,
                    --                 enable_snippets = true,
                    --                 warn_style = true,
                    --             },
                    --         },
                    --     }
                    --     vim.g.zig_fmt_parse_errors = 0
                    --     vim.g.zig_fmt_autosave = 0
                    -- end,
                },
            }

            -- Create keymaps when LSP attaches to a buffer:
            -- You can check default Neovim LPS keymaps with `:h lsp-defaults`
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('mabq_lspAttach', { clear = true }),
                callback = function(e)
                    -- LSP keymaps
                    local opts = { buffer = e.buf }

                    vim.keymap.set('n', 'K', function()
                        vim.lsp.buf.hover()
                    end, opts)

                    -- Jump to the definition of the word under your cursor.
                    --  This is where a variable was first declared, or where a function is defined, etc.
                    vim.keymap.set('n', 'gd', function()
                        --  Do not use Trouble for this one in order to be able to jump back with `<C-t>`.
                        --  By default, `C-]` (jump-in) and `C-t` (jump-out) are used for tags.
                        vim.lsp.buf.definition()
                    end, opts)

                    -- Find references for the word under your cursor.
                    vim.keymap.set('n', '<leader>lr', '<cmd>Trouble lsp_references toggle<CR>', opts)

                    -- nvim-navbuddy
                    vim.keymap.set('n', '<leader>le', '<cmd>Navbuddy<CR>', opts)

                    -- LPS diagnitics
                    vim.keymap.set('n', '<leader>ld', '<cmd>Trouble diagnostics toggle<CR>', opts)
                    vim.keymap.set('n', '<leader>lD', '<cmd>Trouble diagnostics toggle filter.buf=0<CR>', opts)

                    -- Important! This is not Goto Definition, this is Goto Declaration.
                    --  For example, in C this would take you to the header.
                    -- vim.keymap.set('n', '<leader>lD', '<cmd>Trouble lsp_declarations focus<CR>', opts)

                    -- Jump to the implementation of the word under your cursor.
                    --  Useful when your language has ways of declaring types without an actual implementation.
                    vim.keymap.set('n', '<leader>li', '<cmd>Trouble lsp_implementations toggle<CR>', opts)

                    -- Jump to the type of the word under your cursor.
                    --  Useful when you're not sure what type a variable is and you want to see
                    --  the definition of its *type*, not where it was *defined*.
                    vim.keymap.set('n', '<leader>lt', '<cmd>Trouble lsp_type_definitions toggle<CR>', opts)

                    -- Fuzzy find all the symbols in your current document.
                    --  Symbols are things like variables, functions, types, etc.
                    vim.keymap.set('n', '<leader>ls', '<cmd>Trouble lsp_document_symbols toggle<CR>', opts)

                    vim.keymap.set('n', '<leader>ln', function()
                        vim.lsp.buf.rename()
                    end, opts)

                    vim.keymap.set('n', '<leader>la', function()
                        vim.lsp.buf.code_action()
                    end, opts)

                    -- vim.keymap.set('i', '<C-h>', function()
                    --     vim.lsp.buf.signature_help()
                    -- end, opts)

                    -- -- When you move your cursor, the highlights will be cleared (the second autocommand).
                    local client = vim.lsp.get_client_by_id(e.data.client_id)
                    -- if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
                    --     local highlight_augroup = augroup('mabq-lsp-highlight', { clear = false })
                    --     vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                    --         buffer = e.buf,
                    --         group = highlight_augroup,
                    --         callback = vim.lsp.buf.document_highlight,
                    --     })
                    --     vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                    --         buffer = e.buf,
                    --         group = highlight_augroup,
                    --         callback = vim.lsp.buf.clear_references,
                    --     })
                    --     vim.api.nvim_create_autocmd('LspDetach', {
                    --         group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
                    --         callback = function(event2)
                    --             vim.lsp.buf.clear_references()
                    --             vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
                    --         end,
                    --     })
                    -- end
                    --
                    -- The following code creates a keymap to toggle inlay hints in your
                    -- code, if the language server you are using supports them
                    -- This may be unwanted, since they displace some of your code
                    if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
                        vim.keymap.set('n', '<leader>lh', function()
                            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled)
                        end, opts)
                    end
                end,
            })
        end,
    },
}
