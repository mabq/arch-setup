-- Use `opts = {}` to force loading a plugin on startup.
-- Use `:checkhealth` to check for errors

local onLspAttach = function(event)
	-- Remember that lua is a real programming language, and as such it is possible
	-- to define small helper and utility functions so you don't have to repeat yourself
	-- many times.
	--
	-- In this case, we create a function that lets us more easily define mappings specific
	-- for LSP related items. It sets the mode, buffer and description for us each time.
	local map = function(keys, func, desc)
		vim.keymap.set("n", keys, func, { buffer = event.buf, desc = desc })
	end

	-- Jump to the definition of the word under your cursor.
	--  This is where a variable was first declared, or where a function is defined, etc.
	--  To jump back, press <C-T>.
	map("gd", require("telescope.builtin").lsp_definitions, "Go to definition (lsp)") -- default keybinding
	map("<leader>ld", require("telescope.builtin").lsp_definitions, "Go to definition (lsp - also 'gd')")

	--  NOTE: This is not Goto Definition, this is Goto Declaration.
	--  For example, in C this would take you to the header
	map("gD", require("telescope.builtin").lsp_definitions, "Go to declaration (lsp)") -- default keybinding
	map("<leader>lD", vim.lsp.buf.declaration, "Go to declaration (lsp - also 'dD')")

	-- Find references for the word under your cursor.
	-- map("<leader>lr", require("telescope.builtin").lsp_references, "Go to references (lsp)") -- replaced with Trouble

	-- Jump to the implementation of the word under your cursor.
	--  Useful when your language has ways of declaring types without an actual implementation.
	map("<leader>li", require("telescope.builtin").lsp_implementations, "Go to implementation (lsp)")

	-- Jump to the type of the word under your cursor.
	--  Useful when you're not sure what type a variable is and you want to see
	--  the definition of its *type*, not where it was *defined*.
	-- map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
	map("<leader>lt", require("telescope.builtin").lsp_type_definitions, "Go to type definition (lsp)")

	-- Fuzzy find all the symbols in your current document.
	--  Symbols are things like variables, functions, types, etc.
	map("<leader>lsd", require("telescope.builtin").lsp_document_symbols, "Symbols document (lsp)")

	-- Fuzzy find all the symbols in your current workspace
	--  Similar to document symbols, except searches over your whole project.
	map("<leader>lsw", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Symbols workspace (lsp)")

	-- Rename the variable under your cursor
	--  Most Language Servers support renaming across files, etc.
	map("<leader>lr", vim.lsp.buf.rename, "Rename symbol (lsp)") -- now that references is done via trouble "r" is free

	-- Execute a code action, usually your cursor needs to be on top of an error
	-- or a suggestion from your LSP for this to activate.
	map("<leader>la", vim.lsp.buf.code_action, "Code action (lsp)")

	-- Opens a popup that displays documentation about the word under your cursor
	--  See `:help K` for why this keymap
	map("K", vim.lsp.buf.hover, "Hover documentation (lsp)") -- default keybinding
	map("<leader>lk", vim.lsp.buf.code_action, "Code action (lsp - also 'K')")

	-- The following two autocommands are used to highlight references of the
	-- word under your cursor when your cursor rests there for a little while.
	--    See `:help CursorHold` for information about when this is executed
	--
	-- When you move your cursor, the highlights will be cleared (the second autocommand).
	-- local client = vim.lsp.get_client_by_id(event.data.client_id)
	-- if client and client.server_capabilities.documentHighlightProvider then
	-- 	vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
	-- 		buffer = event.buf,
	-- 		callback = vim.lsp.buf.document_highlight,
	-- 	})
	--
	-- 	vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
	-- 		buffer = event.buf,
	-- 		callback = vim.lsp.buf.clear_references,
	-- 	})
	-- end
end

local servers = {
	-- These packages will be automatically installed with Mason.

	-- Language servers:
	--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
	--  Add any additional override configuration in the following tables. Available keys are:
	--  - cmd (table): Override the default command used to start the server
	--  - filetypes (table): Override the default list of associated filetypes for the server
	--  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
	--  - settings (table): Override the default settings passed when initializing the server.
	lua_ls = {}, -- see https://luals.github.io/wiki/settings/
	-- tsserver = {}, -- must be installed globally for `typescript-tools.nvim` to support styled-components (see the ansible file)
	-- clangd = {},
	-- gopls = {},
	-- pyright = {},
	-- rust_analyzer = {},

	-- Formatters:
	stylua = {}, -- lua formatter
	-- prettierd = {}, -- (for some reason `prettierd` does not work)
	prettier = {}, -- js, json, css, html formatter
	shfmt = {}, -- A shell parser, formatter, and interpreter with bash support.

	-- Linters:
	eslint_d = {}, -- js linter
}

return {

	{
		-- Trouble ----------------------------------------------------------

		enabled = true,
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		-- opts = {},
		keys = {
			-- { "<leader>ld", "<cmd>TroubleToggle lsp_definitions<cr>", desc = "Go to definitions (trouble)" }, -- can't go back with `Ctrl-t` (only `Ctrl-o`), use telescope for now
			{ "<leader>lR", "<cmd>TroubleToggle lsp_references<cr>", desc = "Go to references (lsp-trouble)" },

			{ "<leader>xx", "<cmd>TroubleToggle<cr>", desc = "Trouble toggle" },
			{ "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Trouble workspace" }, -- workspace diagnostics from the builtin LSP client
			{ "<leader>xb", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Trouble buffer" }, -- document diagnostics from the builtin LSP client
			{ "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", desc = "Trouble quickfix" }, -- quickfix items
			{ "<leader>xl", "<cmd>TroubleToggle loclist<cr>", desc = "Trouble loclist" }, -- items from the window's location list
		},
	},

	{
		-- LSP -----------------------------------------------------------------
		enabled = true,
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs and related tools to stdpath for neovim
			{
				"williamboman/mason.nvim",
				config = function()
					vim.keymap.set("n", "<leader>om", "<cmd>Mason<cr>", { desc = "Open Mason" })
				end,
			},
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",

			-- LSP status updates
			{ "j-hui/fidget.nvim", opts = {} },

			-- Automatically configures lua-language-server for your Neovim config, Neovim runtime and plugin directories
			{ "folke/neodev.nvim", opts = {} },

			-- Replace tsserver with typescript-tools to support styled-components auto-completion, syntax highlighting is supported by treesitter
			{
				"pmizio/typescript-tools.nvim",
				dependencies = {
					"nvim-lua/plenary.nvim",
				},
				config = function()
					require("typescript-tools").setup({
						settings = {
							tsserver_plugins = {
								"@styled/typescript-styled-plugin",
							},
						},
					})
				end,
			},
		},
		config = function()
			-- LSP stands for Language Server Protocol. It's a protocol that helps editors
			-- and language tooling communicate in a standardized fashion.
			--
			-- In general, you have a "server" which is some tool built to understand a particular
			-- language (such as `gopls`, `lua_ls`, `rust_analyzer`, etc). These Language Servers
			-- (sometimes called LSP servers, but that's kind of like ATM Machine) are standalone
			-- processes that communicate with some "client" - in this case, Neovim!
			--
			-- LSP provides Neovim with features like:
			--  - Go to definition
			--  - Find references
			--  - Autocompletion
			--  - Symbol Search
			--  - and more!
			--
			-- Thus, Language Servers are external tools that must be installed separately from
			-- Neovim. This is where `mason` and related plugins come into play.
			--
			-- If you're wondering about lsp vs treesitter, you can check out the wonderfully
			-- and elegantly composed help section, `:help lsp-vs-treesitter`

			--  This function gets run when an LSP attaches to a particular buffer.
			--    That is to say, every time a new file is opened that is associated with
			--    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`)
			--    this function will be executed to configure the current buffer.
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("mabq-lsp-attach", { clear = true }),
				callback = onLspAttach,
			})

			-- LSP servers and clients are able to communicate to each other what features they support.
			--  By default, Neovim doesn't support everything that is in the LSP Specification.
			--  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
			--  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			-- Ensure the servers and tools above are installed
			--  To check the current status of installed tools and/or manually install
			--  other tools, you can run
			--    :Mason
			--
			--  You can press `g?` for help in this menu
			require("mason").setup()

			-- You can add other tools here that you want Mason to install
			-- for you, so that they are available from within Neovim.
			local ensure_installed = vim.tbl_keys(servers or {})
			-- vim.list_extend(ensure_installed, {
			-- 	"stylua", -- Used to format lua code
			-- })
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			require("mason-lspconfig").setup({
				handlers = {
					-- this function is automatically called for each server
					function(server_name)
						local server = servers[server_name] or {}
						-- This handles overriding only values explicitly passed
						-- by the server configuration above. Useful when disabling
						-- certain features of an LSP (for example, turning off formatting for tsserver)
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})
		end,
	},

	{
		-- Formatting ----------------------------------------------------------

		enabled = true,
		"stevearc/conform.nvim",
		lazy = true,
		cmd = { "ConformInfo" },
		event = { "BufWritePre" },
		keys = {
			{
				mode = { "n" },
				"<leader>lf",
				function()
					require("conform").format({ lsp_fallback = false, async = false, timeout_ms = 1000 })
				end,
				desc = "Format buffer (lsp + conform)",
			},
		},
		opts = {
			format_on_save = {
				timeout_ms = 1000,
				lsp_format = "never",
				async = false,
			},
			formatters_by_ft = {
				-- Important! Use a sub-list to run only the first available formatter
				-- Available formatters: https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters
				lua = { "stylua" },
				-- javascript = { { "prettier", "biome" } }, -- default to lsp (nvim-tools)
				javascript = { "prettier" },
				-- javascriptreact = { { "prettier", "prettier", "biome" } }, -- default to lsp (nvim-tools)
				javascriptreact = { { "prettier" } },
				-- typescript = { "prettier" }, -- default to lsp (nvim-tools)
				-- typescriptreact = { "prettier" }, -- default to lsp (nvim-tools)
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				jsonc = { "prettier" },
				yaml = { "prettier" },
				bash = { "shfmt" },
			},
		},
	},

	{
		-- Autocompletion ------------------------------------------------------

		enabled = true,
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			-- Snippet engine and its associated nvim-cmp source
			{
				"L3MON4D3/LuaSnip",
				build = (function()
					-- Build Step is needed for regex support in snippets
					return "make install_jsregexp"
				end)(),
			},
			"saadparwaiz1/cmp_luasnip",

			-- Other completion capabilities.
			--  nvim-cmp does not ship with all sources by default. They are split into multiple repos for maintenance purposes.
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",

			-- If you want to add a bunch of pre-configured snippets, you can use this plugin to help you.
			--  It even has snippets for various frameworks/libraries/etc., but you will have to set up the ones that are useful for you.
			{
				"rafamadriz/friendly-snippets",
				config = function()
					require("luasnip.loaders.from_vscode").lazy_load()
				end,
			},

			-- formatting lsp completion items
			"onsails/lspkind.nvim",

			-- emojis
			"hrsh7th/cmp-emoji",
		},
		config = function()
			-- See `:help cmp`
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			luasnip.config.setup({})

			local lspkind = require("lspkind")

			cmp.setup({
				completion = { completeopt = "menu,menuone,noinsert" },

				-- For an understanding of why these mappings were chosen, you will need to read `:help ins-completion`
				-- No, but seriously. Please read `:help ins-completion`, it is really good!
				mapping = cmp.mapping.preset.insert({
					-- Select the [n]ext item
					["<C-n>"] = cmp.mapping.select_next_item(),
					-- Select the [p]revious item
					["<C-p>"] = cmp.mapping.select_prev_item(),

					-- Accept ([y]es) the completion.
					--  This will auto-import if your LSP supports it.
					--  This will expand snippets if the LSP sent a snippet.
					["<C-y>"] = cmp.mapping.confirm({ select = true }),

					-- Manually trigger a completion from nvim-cmp.
					--  Generally you don't need this, because nvim-cmp will display
					--  completions whenever it has completion options available.
					-- ['<C-Space>'] = cmp.mapping.complete {},
					-- ["<C-Space>"] = cmp.mapping.complete({}), -- TODO

					-- <c-l> will move you to the right of each of the expansion locations.
					-- <c-h> is similar, except moving you backwards.
					["<C-l>"] = cmp.mapping(function()
						if luasnip.expand_or_locally_jumpable() then
							luasnip.expand_or_jump()
						end
					end, { "i", "s" }),
					["<C-h>"] = cmp.mapping(function()
						if luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						end
					end, { "i", "s" }),
				}),
				sources = {
					-- In this same order completions will appear.
					{ name = "nvim_lsp" },
					{ name = "path" },
					{ name = "luasnip" },
					{ name = "buffer", keyword_lenght = 5 }, -- start showing options only when X characters are typed
					{ name = "emoji" },
				},
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				formatting = {
					-- https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance
					format = lspkind.cmp_format({
						mode = "symbol", -- show only symbol annotations
						maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
						-- can also be a function to dynamically calculate max width such as
						-- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
						ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
						show_labelDetails = true, -- show labelDetails in menu. Disabled by default
						-- The function below will be called before any actual modifications from lspkind
						-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
						-- before = function(entry, vim_item)
						-- 	return vim_item
						-- end,
					}),
				},
			})
		end,
	},

	{
		-- Linting -----------------------------------------------------------------
		enabled = true,
		"mfussenegger/nvim-lint",
		config = function()
			require("lint").linters_by_ft = {
				-- Available linters: https://github.com/mfussenegger/nvim-lint?tab=readme-ov-file#available-linters
				javascript = { "eslint_d" },
				javascriptreact = { "eslint_d" },
				typescript = { "eslint_d" },
				typescriptreact = { "eslint_d" },
				-- markdown = { "vale" },
			}

			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = vim.api.nvim_create_augroup("mabq_lint", { clear = true }),
				callback = function()
					require("lint").try_lint()
				end,
			})

			vim.keymap.set("n", "<leader>tli", function()
				require("lint").try_lint()
			end, { desc = "Toogle linting (nvim-lint)" })
		end,
	},
}
