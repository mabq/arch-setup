-- Use `:Telescope colorscheme` to fuzzy find colorschemes
return {
	{
		enabled = true,
		"folke/tokyonight.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("tokyonight").setup({
				style = "moon",
				-- https://github.com/folke/tokyonight.nvim?tab=readme-ov-file#-overriding-colors--highlight-groups
				on_highlights = function(hl, c)
					hl.CursorLine.bg = "#1d1e2a" -- enable `vim.opt.cursorline`
					hl.ColorColumn.bg = "#1b1c27" -- enable `vim.opt.colorcolumn`
				end,
			})
			vim.cmd.colorscheme("tokyonight-night")
		end,
	},
	{
		enabled = false,
		"catppuccin/nvim",
		name = "catppuccin", -- otherwise shown as `nvim`
		priority = 1000, -- recommended by lazy docs
		config = function()
			require("catppuccin").setup({
				-- have to enable integrations manually, see https://github.com/catppuccin/nvim?tab=readme-ov-file#integrations
				integrations = {
					cmp = true,
					gitsigns = true,
					lsp_trouble = true,
					mason = true,
					markdown = true,
					mini = true,
					native_lsp = {
						enabled = true,
						underlines = {
							errors = { "undercurl" },
							hints = { "undercurl" },
							warnings = { "undercurl" },
							information = { "undercurl" },
						},
					},
					semantic_tokens = true,
					telescope = true,
					treesitter = true,
					treesitter_context = true,
					which_key = true,
				},
			})
			vim.cmd.colorscheme("catppuccin-mocha")
		end,
	},
	{
		enabled = false,
		"rose-pine/neovim",
		name = "rose-pine", -- otherwise shown as `neovim`
		priority = 1000, -- recommended by lazy docs
		config = function()
			require("rose-pine").setup({
				-- customize
				disable_background = true,
				highlight_groups = {
					ColorColumn = { bg = "highlight_low", blend = 30 },
					CursorLine = { bg = "highlight_low", blend = 50 },
					StatusLine = { fg = "text", bg = "highlight_med", blend = 60 },
					StatusLineNC = { fg = "muted", bg = "highlight_med", blend = 60 },
				},
			})
			vim.cmd.colorscheme("rose-pine")
		end,
	},
}
