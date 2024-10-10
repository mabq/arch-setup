-- use `:checkhealth whick-key` to check for possible keybindings duplicates
-- timeout options are set on the `options` config file
return {
	{
		enabled = true,
		"folke/which-key.nvim", -- Useful plugin to show you pending keybinds.
		event = "VeryLazy",
		config = function() -- this is the function that runs, AFTER loading
			local wk = require("which-key")

			-- To show all mappings run `:WhichKey`
			wk.add({
				-- ["]"] = { name = "+Next", _ = "which_key_ignore" },
				-- ["["] = { name = "+Previous", _ = "which_key_ignore" },
				-- ["g"] = { name = "+Go", _ = "which_key_ignore" },
				-- ["z"] = { name = "+Fold, spell, move and more", _ = "which_key_ignore" },
				{ "<leader>", group = "(LeaderKey)" },
				{ "<leader>f", group = "Flash" },
				{ "<leader>h", group = "Harpoon" },
				{ "<leader>l", group = "LSP" },
				{ "<leader>o", group = "Open" },
				{ "<leader>s", group = "Search" },
				{ "<leader>t", group = "Toggle" },
				{ "<leader>x", group = "Trouble" },
				{ "[", group = "Previous" },
				{ "]", group = "Next" },
				{ "g", group = "Go" },
				{ "z", group = "Fold, spell, move and more" },
				-- ["<leader>f"] = { name = "Flash", _ = "which_key_ignore" },
				-- ["<leader>h"] = { name = "Harpoon", _ = "which_key_ignore" },
				-- ["<leader>l"] = { name = "LSP", _ = "which_key_ignore" },
				-- ["<leader>o"] = { name = "Open", _ = "which_key_ignore" },
				-- ["<leader>s"] = { name = "Search", _ = "which_key_ignore" },
				-- ["<leader>t"] = { name = "Toggle", _ = "which_key_ignore" },
				-- ["<leader>x"] = { name = "Trouble", _ = "which_key_ignore" },
			})
		end,
	},
}
