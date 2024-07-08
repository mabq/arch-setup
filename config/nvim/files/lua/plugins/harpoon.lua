return {
	{
		-- Getting you where you want with the fewest keystrokes
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
				desc = "Add file",
			},
			{
				"<leader>ho",
				function()
					local harpoon = require("harpoon")
					harpoon.ui:toggle_quick_menu(harpoon:list())
				end,
				desc = "Open harpoon",
			},
			{
				"<leader>h1",
				function()
					require("harpoon"):list():select(1)
				end,
				desc = "File 1",
			},
			{
				"<leader>h2",
				function()
					require("harpoon"):list():select(2)
				end,
				desc = "File 2",
			},
			{
				"<leader>h3",
				function()
					require("harpoon"):list():select(3)
				end,
				desc = "File 3",
			},
			{
				"<leader>h4",
				function()
					require("harpoon"):list():select(4)
				end,
				desc = "File 4",
			},
			{
				"<leader>h5",
				function()
					require("harpoon"):list():select(5)
				end,
				desc = "File 5",
			},
			{
				"<leader>h6",
				function()
					require("harpoon"):list():select(6)
				end,
				desc = "File 6",
			},
		},
	},
}
