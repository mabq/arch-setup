return {
	{
		enabled = true,
		"folke/zen-mode.nvim",
		keys = {
			{
				"<leader>tz", -- Category: Toggle
				function()
					require("zen-mode").toggle()
				end,
				mode = { "n" },
				desc = "Toggle zenmode",
			},
		},
		config = function()
			require("zen-mode").setup({
				-- https://github.com/folke/zen-mode.nvim#%EF%B8%8F-configuration
				window = {
					backdrop = 0.95,
					width = 110,
					options = {
						number = false,
						relativenumber = false,
						cursorcolumn = false,
					},
				},
			})
		end,
	},
}
