-- use `:checkhealth whick-key` to check for possible keybindings duplicates
-- timeout options are set on the `options` config file
return {
	{
		enabled = true,
		"folke/which-key.nvim", -- Useful plugin to show you pending keybinds.
		event = "VimEnter", -- load before all the UI elements
		config = function() -- this is the function that runs, AFTER loading
			require("which-key").setup()

			-- Document existing key chains
			require("which-key").register({
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
