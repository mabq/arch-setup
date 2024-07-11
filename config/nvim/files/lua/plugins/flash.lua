return {
	-- navigate your code with search labels
	enabled = true,
	"folke/flash.nvim",
	event = "VeryLazy",
	opts = {
		-- https://github.com/folke/flash.nvim?tab=readme-ov-file#%EF%B8%8F-configuration
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
		{ "<leader>j", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" }, -- think "jump"
		-- { "<leader>fe", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash treesitter" },
		-- { "<leader>fs", mode = { "n", "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter search" },
		-- { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
		-- { "<leader>tf", mode = { "n" }, function() require("flash").toggle() end, desc = "Toggle flash search" },
	},
}
