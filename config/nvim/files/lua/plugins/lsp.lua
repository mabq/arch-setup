-- If you experience any errors, run `:checkhealth` for more info.
return {
    -- -- Autocompletion
    -- {
    --     -- https://lsp-zero.netlify.app/v3.x/autocomplete.html
    --     -- https://lsp-zero.netlify.app/v3.x/template/opinionated.html
    --     enabled = true,
    --     "hrsh7th/nvim-cmp",
    --     event = "InsertEnter",
    --     dependencies = {
    --         -- Snippet Engine & its associated nvim-cmp source
    --         {
    --             "L3MON4D3/LuaSnip",
    --             build = (function()
    --                 -- Build Step is needed for regex support in snippets
    --                 -- This step is not supported in many windows environments, remove the below condition to re-enable on windows
    --                 if vim.fn.has("win32") == 1 then
    --                     return
    --                 end
    --                 return "make install_jsregexp"
    --             end)(),
    --         },
    --         { "saadparwaiz1/cmp_luasnip" },
    --         -- Adds LSP completion capabilities
    --         { "hrsh7th/cmp-nvim-lsp" },
    --         { "hrsh7th/cmp-path" },
    --         { "hrsh7th/cmp-buffer" },
    --         -- Adds a number of user-friendly snippets
    --         { "rafamadriz/friendly-snippets" },
    --     },
    --     config = function()
    --         -- Here is where you configure the autocompletion settings.
    --         local lsp_zero = require("lsp-zero")
    --         lsp_zero.extend_cmp()
    --
    --         -- And you can configure cmp even more, if you want to.
    --         local cmp = require("cmp")
    --         local cmp_action = lsp_zero.cmp_action()
    --
    --         -- This is the function that loads the extra snippets from rafamadriz/friendly-snippets
    --         require("luasnip.loaders.from_vscode").lazy_load()
    --
    --         cmp.setup({
    --             formatting = lsp_zero.cmp_format(), -- show completion source
    --             sources = {
    --                 { name = "nvim_lsp" },
    --                 { name = "luasnip", keyword_length = 2 },
    --                 { name = "path" },
    --                 { name = "buffer",  keyword_length = 3 },
    --             },
    --             window = {
    --                 completion = cmp.config.window.bordered(),
    --                 documentation = cmp.config.window.bordered(),
    --             },
    --             mapping = cmp.mapping.preset.insert({
    --                 ["<CR>"] = cmp.mapping.confirm({ select = false }),
    --                 ["<C-y>"] = cmp.mapping.confirm({ select = true }),
    --                 ["<C-u>"] = cmp.mapping.scroll_docs(-4),
    --                 ["<C-d>"] = cmp.mapping.scroll_docs(4),
    --                 ["<C-f>"] = cmp_action.luasnip_jump_forward(),
    --                 ["<C-b>"] = cmp_action.luasnip_jump_backward(),
    --             }),
    --             completion = {
    --                 completeopt = "menu,menuone,noinsert",
    --             },
    --         })
    --     end,
    -- },

    -- LSP
    {
        enabled = true,
        "neovim/nvim-lspconfig",
        cmd = { "LspInfo", "LspInstall", "LspStart" },
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            -- Automatically install LSPs and related tools to stdpath for neovim
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'WhoIsSethDaniel/mason-tool-installer.nvim',

            -- Useful status updates for LSP.
            -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
            { 'j-hui/fidget.nvim', opts = {} },

            -- Automatically configure `luals` for Neovim
            -- { "folke/neodev.nvim", opts = {} },
        },
        config = function()
            -- LSP is an acronym you've probably heard, but might not understand what it is.
            --
            -- LSP stands for Language Server Protocol. It's a protocol that helps editors
            -- and language tooling communicate in a standardized fashion.
            --
            -- In general, you have a "server" which is some tool built to understand a particular
            -- language (such as `gopls`, `lua_ls`, `rust_analyzer`, etc). These Language Servers
            -- (sometimes called LSP servers) are standalone processes that communicate with some
            -- "client" - in this case, Neovim!
            --
            -- LSP provides Neovim with features like: go to definition, find references,
            -- autocompletion, symbol Search and more!
            --
            -- Thus, Language Servers are external tools that must be installed separately from
            -- Neovim. This is where `mason` and related plugins come into play.
            --
            -- If you're wondering about lsp vs treesitter, you can check out the wonderfully
            -- and elegantly composed help section, `:help lsp-vs-treesitter`.
            --
            -- This function gets run when an LSP attaches to a particular buffer.
            -- That is to say, every time a new file is opened that is associated with
            -- an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
            -- function will be executed to configure the current buffer.
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
                callback = function(event)
                    -- NOTE: Remember that lua is a real programming language, and as such it is possible
                    -- to define small helper and utility functions so you don't have to repeat yourself
                    -- many times.
                    --
                    -- In this case, we create a function that lets us more easily define mappings specific
                    -- for LSP related items. It sets the mode, buffer and description for us each time.
                    local map = function(keys, func, desc)
                        vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
                    end

                    -- Jump to the definition of the word under your cursor.
                    --  This is where a variable was first declared, or where a function is defined, etc.
                    --  To jump back, press <C-T>.
                    map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

                    -- Find references for the word under your cursor.
                    map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

                    -- Jump to the implementation of the word under your cursor.
                    --  Useful when your language has ways of declaring types without an actual implementation.
                    map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

                    -- Jump to the type of the word under your cursor.
                    --  Useful when you're not sure what type a variable is and you want to see
                    --  the definition of its *type*, not where it was *defined*.
                    map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')

                    -- Fuzzy find all the symbols in your current document.
                    --  Symbols are things like variables, functions, types, etc.
                    map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

                    -- Fuzzy find all the symbols in your current workspace
                    --  Similar to document symbols, except searches over your whole project.
                    map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

                    -- Rename the variable under your cursor
                    --  Most Language Servers support renaming across files, etc.
                    map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

                    -- Execute a code action, usually your cursor needs to be on top of an error
                    -- or a suggestion from your LSP for this to activate.
                    map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

                    -- Opens a popup that displays documentation about the word under your cursor
                    --  See `:help K` for why this keymap
                    map('K', vim.lsp.buf.hover, 'Hover Documentation')

                    -- WARN: This is not Goto Definition, this is Goto Declaration.
                    --  For example, in C this would take you to the header
                    map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

                    -- -- The following two autocommands are used to highlight references of the
                    -- -- word under your cursor when your cursor rests there for a little while.
                    -- --    See `:help CursorHold` for information about when this is executed
                    -- --
                    -- -- When you move your cursor, the highlights will be cleared (the second autocommand).
                    -- local client = vim.lsp.get_client_by_id(event.data.client_id)
                    -- if client and client.server_capabilities.documentHighlightProvider then
                    --     vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                    --         buffer = event.buf,
                    --         callback = vim.lsp.buf.document_highlight,
                    --     })
                    --
                    --     vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                    --         buffer = event.buf,
                    --         callback = vim.lsp.buf.clear_references,
                    --     })
                    -- end
                end,
            })

            -- LSP servers and clients are able to communicate to each other what features they support.
            --  By default, Neovim doesn't support everything that is in the LSP Specification.
            --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
            --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

            -- Enable the following language servers
            --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
            --
            --  Add any additional override configuration in the following tables. Available keys are:
            --    - cmd (table): Override the default command used to start the server
            --    - filetypes (table): Override the default list of associated filetypes for the server
            --    - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
            --    - settings (table): Override the default settings passed when initializing the server.
            --          For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
            local servers = {
                -- clangd = {},
                -- gopls = {},
                -- pyright = {},
                -- rust_analyzer = {},
                -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
                --
                -- Some languages (like typescript) have entire language plugins that can be useful:
                --    https://github.com/pmizio/typescript-tools.nvim
                --
                -- But for many setups, the LSP (`tsserver`) will work just fine
                -- tsserver = {},
                --

                cssls = {},

                lua_ls = {
                    -- cmd = {...},
                    -- filetypes { ...},
                    -- capabilities = {},
                    settings = {
                        Lua = {
                            runtime = { version = 'LuaJIT' },
                            workspace = {
                                checkThirdParty = false,
                                -- Tells lua_ls where to find all the Lua files that you have loaded
                                -- for your neovim configuration.
                                library = {
                                    '${3rd}/luv/library',
                                    unpack(vim.api.nvim_get_runtime_file('', true)),
                                },
                                -- If lua_ls is really slow on your computer, you can try this instead:
                                -- library = { vim.env.VIMRUNTIME },
                            },
                            completion = {
                                callSnippet = 'Replace',
                            },
                            -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
                            -- diagnostics = { disable = { 'missing-fields' } },
                        },
                    },
                },
            }

            -- Ensure the servers and tools above are installed
            --  To check the current status of installed tools and/or manually install
            --  other tools, you can run
            --    :Mason
            --
            --  You can press `g?` for help in this menu
            require('mason').setup()

            -- You can add other tools here that you want Mason to install
            -- for you, so that they are available from within Neovim.
            local ensure_installed = vim.tbl_keys(servers or {})
            vim.list_extend(ensure_installed, {
                'stylua', -- Used to format lua code
            })
            require('mason-tool-installer').setup { ensure_installed = ensure_installed }

            require('mason-lspconfig').setup {
                handlers = {
                    function(server_name)
                        local server = servers[server_name] or {}
                        -- This handles overriding only values explicitly passed
                        -- by the server configuration above. Useful when disabling
                        -- certain features of an LSP (for example, turning off formatting for tsserver)
                        server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
                        require('lspconfig')[server_name].setup(server)
                    end,
                },
            }
        end,
    },
}
