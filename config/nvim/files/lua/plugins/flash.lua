return {
	enable = true,
	"folke/flash.nvim",
	event = "VeryLazy",
	opts = {
		modes = {
			search = {
				enabled = false, -- do not activate during regular search by default
			},
			char = {
				enabled = false, -- do not activate through `f`, `F`, `t`, `T`, `;` and `,` motions
			},
		},
	},
	-- stylua: ignore
	keys = {
		{ "<leader>fj", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
		{ "<leader>ft", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash treesitter" },
		-- { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
		{ "<leader>fs", mode = { "n", "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter search" },
		{ "<leader>tf", mode = { "n" }, function() require("flash").toggle() end, desc = "Toggle flash search" },
	},
}
