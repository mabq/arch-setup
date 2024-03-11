return {
	{
		enabled = true,
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("harpoon"):setup()
		end,
		keys = {
			{
				"<leader>ha",
				function()
					require("harpoon"):list():append()
				end,
				desc = "Harpoon: Add file",
			},
			{
				"<leader>ho",
				function()
					local harpoon = require("harpoon")
					harpoon.ui:toggle_quick_menu(harpoon:list())
				end,
				desc = "Harpoon: Open list",
			},
			{
				"<C-j>",
				function()
					require("harpoon"):list():select(1)
				end,
				desc = "Harpoon: File 1",
			},
			{
				"<C-k>",
				function()
					require("harpoon"):list():select(2)
				end,
				desc = "Harpoon: File 2",
			},
			{
				"<C-l>",
				function()
					require("harpoon"):list():select(3)
				end,
				desc = "Harpoon: File 3",
			},
			{
				"<C-;>",
				function()
					require("harpoon"):list():select(4)
				end,
				desc = "Harpoon: File 4",
			},
		},
	},
}
