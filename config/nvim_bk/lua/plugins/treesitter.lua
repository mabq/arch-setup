-- https://vonheikemen.github.io/devlog/es/tools/neovim-plugins-to-get-started/#treesitter
return {
	{
		enabled = true,
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = "VeryLazy",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					-- https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#supported-languages
					"bash",
					"c",
					"css",
					"html",
					"javascript",
					"json",
					"json5",
					"jsonc",
					"lua",
					"markdown",
					"markdown_inline",
					"rust",
					"styled", -- styled components
					"tsx",
					"typescript",
					"vim",
					"vimdoc",
					"yaml",
				},
				-- Install parsers synchronously (only applied to `ensure_installed`)
				sync_install = false,

				-- Automatically install missing parsers when entering buffer
				-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
				auto_install = true,

				highlight = {
					enable = true,
					-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
					-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
					-- Using this option may slow down your editor, and you may see some duplicate highlights.
					-- Instead of true it can also be a list of languages
					additional_vim_regex_highlighting = false,
				},

				-- indentation based on treesitter for the = operator
				indent = {
					enable = true,
				},

				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<A-l>", -- in normal mode, start incremental selection (or enter visual mode normally)
						node_incremental = "<A-l>", -- in visual mode, increment to the upper named parent
						node_decremental = "<A-h>", -- in visual mode, decrement to the previous named node
						scope_incremental = "<A-s>", -- in visual mode, increment to the upper scope
					},
				},

				-- textobjects = {
				-- 	enable = true,
				-- },
			})
		end,
	},
	{
		enabled = false,
		"kevinhwang91/nvim-ufo",
		dependencies = {
			"kevinhwang91/promise-async",
		},
		config = function()
			vim.o.foldcolumn = "1" -- '0' is not bad
			vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
			vim.o.foldlevelstart = 99
			vim.o.foldenable = true
			-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
			vim.keymap.set("n", "zR", require("ufo").openAllFolds)
			vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
			require("ufo").setup({
				provider_selector = function(bufnr, filetype, buftype)
					return { "treesitter", "indent" }
				end,
			})
		end,
	},
	{
		-- Use treesitter to autoclose and autorename html tag
		enabled = true,
		"windwp/nvim-ts-autotag",
		name = "autotag",
		ft = {
			"html",
			"javascript",
			"typescript",
			"javascriptreact",
			"typescriptreact",
			"svelte",
			"vue",
			"tsx",
			"jsx",
			"rescript",
			"xml",
			"php",
			"markdown",
			"astro",
			"glimmer",
			"handlebars",
			"hbs",
		},
		config = function()
			require("nvim-treesitter.configs").setup({
				autotag = {
					enable = true,
				},
			})
		end,
	},
}
