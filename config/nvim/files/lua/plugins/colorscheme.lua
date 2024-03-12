-- Use `:Telescope colorscheme` to fuzzy find colorschemes
return {
	{
		enabled = true,
		"folke/tokyonight.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
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
					treesitter = true,
					mini = {
						enabled = true,
						indentscope_color = "",
					},
					fidget = true,
					mason = true,
					lsp_trouble = true,
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
