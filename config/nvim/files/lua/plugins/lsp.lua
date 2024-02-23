-- local disableFormatCapabilities = function(client)
--     client.server_capabilities.documentFormattingProvider = false
--     client.server_capabilities.documentRangeFormattingProvider = false
-- end

-- https://lsp-zero.netlify.app/v3.x/guide/lazy-loading-with-lazy-nvim.html
return {
    {
        -- https://lsp-zero.netlify.app/v3.x/getting-started.html
        enabled = true,
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        lazy = true,
        config = false,
        init = function()
            -- Disable automatic setup, we are doing it manually
            vim.g.lsp_zero_extend_cmp = 0
            vim.g.lsp_zero_extend_lspconfig = 0
        end,
    },

    {
        enabled = true,
        "williamboman/mason.nvim",
        lazy = false,
        config = true,
    },

    -- Autocompletion
    {
        -- https://lsp-zero.netlify.app/v3.x/autocomplete.html
        -- https://lsp-zero.netlify.app/v3.x/template/opinionated.html
        enabled = true,
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            -- Snippet Engine & its associated nvim-cmp source
            {
                "L3MON4D3/LuaSnip",
                build = (function()
                    -- Build Step is needed for regex support in snippets
                    -- This step is not supported in many windows environments, remove the below condition to re-enable on windows
                    if vim.fn.has("win32") == 1 then
                        return
                    end
                    return "make install_jsregexp"
                end)(),
            },
            { "saadparwaiz1/cmp_luasnip" },
            -- Adds LSP completion capabilities
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-path" },
            { "hrsh7th/cmp-buffer" },
            -- Adds a number of user-friendly snippets
            { "rafamadriz/friendly-snippets" },
        },
        config = function()
            -- Here is where you configure the autocompletion settings.
            local lsp_zero = require("lsp-zero")
            lsp_zero.extend_cmp()

            -- And you can configure cmp even more, if you want to.
            local cmp = require("cmp")
            local cmp_action = lsp_zero.cmp_action()

            -- This is the function that loads the extra snippets from rafamadriz/friendly-snippets
            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup({
                formatting = lsp_zero.cmp_format(), -- show completion source
                sources = {
                    { name = "nvim_lsp" },
                    { name = "luasnip", keyword_length = 2 },
                    { name = "path" },
                    { name = "buffer",  keyword_length = 3 },
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ["<CR>"] = cmp.mapping.confirm({ select = false }),
                    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-d>"] = cmp.mapping.scroll_docs(4),
                    ["<C-f>"] = cmp_action.luasnip_jump_forward(),
                    ["<C-b>"] = cmp_action.luasnip_jump_backward(),
                }),
                completion = {
                    completeopt = "menu,menuone,noinsert",
                },
            })
        end,
    },

    -- LSP
    {
        enabled = true,
        "neovim/nvim-lspconfig",
        cmd = { "LspInfo", "LspInstall", "LspStart" },
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            { "williamboman/mason-lspconfig.nvim" },
            {
                "folke/neodev.nvim", -- additional lua configuration, makes nvim stuff amazing!
                config = true,
            },
        },
        config = function()
            -- This is where all the LSP shenanigans will live
            local lsp_zero = require("lsp-zero")
            lsp_zero.extend_lspconfig()

            --- if you want to know more about lsp-zero and mason.nvim
            --- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
            lsp_zero.on_attach(function(client, bufnr)
                lsp_zero.default_keymaps({ buffer = bufnr }) -- `:h lsp-zero-keybindings`
            end)

            lsp_zero.set_sign_icons({
                error = "e",
                warn = "w",
                hint = "h",
                info = "i",
            })

            require("mason-lspconfig").setup({
                ensure_installed = {}, -- https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
                handlers = {
                    lsp_zero.default_setup,
                    -- Configure a language server (https://lsp-zero.netlify.app/v3.x/guide/integrate-with-mason-nvim.html#configure-a-language-server)
                    -- lua_ls = function()
                    -- 	--   format with stylua instead (see below)
                    -- 	require("lspconfig").lua_ls.setup({
                    -- 		on_attach = disableFormatCapabilities,
                    -- 	})
                    -- end,
                    -- tsserver = function()
                    -- 	-- format with biome instead (see below)
                    -- 	require("lspconfig").tsserver.setup({
                    -- 		on_attach = disableFormatCapabilities,
                    -- 	})
                    -- end,
                },
            })
        end,
    },

    -- Formatting
    --   Use none-ls only when there is no LSP server for a desired language
    --   video https://www.youtube.com/watch?v=SxuwQJ0JHMU&list=PLsz00TDipIffreIaUNk64KxTIkQaGguqn&index=4
    --   built-in sources: https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md#built-in-sources
    -- {
    -- 	enabled = true,
    -- 	"nvimtools/none-ls.nvim",
    -- 	config = function()
    -- 		local null_ls = require("null-ls")
    -- 		null_ls.setup({
    -- 			sources = {
    -- 				null_ls.builtins.formatting.stylua,
    -- 				null_ls.builtins.formatting.biome,
    -- 			},
    -- 		})
    -- 	end,
    -- },
}
