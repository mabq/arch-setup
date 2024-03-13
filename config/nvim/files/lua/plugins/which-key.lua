-- use `:checkhealth whick-key` to check for possible keybindings duplicates
-- timeout options are set on the `options` config file
return {
	{
		enabled = true,
		"folke/which-key.nvim", -- Useful plugin to show you pending keybinds.
		event = "VimEnter", -- load before all the UI elements
		config = function() -- this is the function that runs, AFTER loading
			require("which-key").setup()

			-- To show all mappings run `:WhichKey`
			require("which-key").register({
				["]"] = { name = "+Next", _ = "which_key_ignore" },
				["["] = { name = "+Previous", _ = "which_key_ignore" },
				["g"] = { name = "+Go", _ = "which_key_ignore" },
				["z"] = { name = "+Fold, spell, move and more", _ = "which_key_ignore" },
				["<leader>"] = { name = "+(LeaderKey)", _ = "which_key_ignore" },
				["<leader>f"] = { name = "Flash", _ = "which_key_ignore" },
				["<leader>h"] = { name = "Harpoon", _ = "which_key_ignore" },
				["<leader>l"] = { name = "LSP", _ = "which_key_ignore" },
				["<leader>o"] = { name = "Open", _ = "which_key_ignore" },
				["<leader>s"] = { name = "Search", _ = "which_key_ignore" },
				["<leader>t"] = { name = "Toggle", _ = "which_key_ignore" },
				["<leader>x"] = { name = "Trouble", _ = "which_key_ignore" },
			})
		end,
	},
}
