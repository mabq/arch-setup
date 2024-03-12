return {
	{
		enabled = false,
		"DreamMaoMao/yazi.nvim",
		cmd = "Yazi",
		keys = {
			{ "<leader>oe", "<cmd>Yazi<CR>", mode = { "n" }, desc = "Open [E]xplorer (Yazi)" },
		},
	},
	{
		"rolv-apneseth/tfm.nvim",
		lazy = false,
		opts = {
			file_manager = "yazi", -- tfm to use: "ranger" | "nnn" | "lf" | "vifm" | "yazi" (default)
			replace_netrw = false, -- replace netrw entirely
			-- Enable creation of commands
			-- Default: false
			-- Commands:
			--   Tfm: selected file(s) will be opened in the current window
			--   TfmSplit: selected file(s) will be opened in a horizontal split
			--   TfmVsplit: selected file(s) will be opened in a vertical split
			--   TfmTabedit: selected file(s) will be opened in a new tab page
			enable_cmds = true,
			-- Custom keybindings only applied within the TFM buffer
			-- Default: {}
			keybindings = {
				-- ["<ESC>"] = "q",
			},
			-- Customise UI. The below options are the default
			ui = {
				border = "rounded",
				height = 0.8,
				width = 0.9,
				x = 0.5,
				y = 0.5,
			},
		},
		keys = {
			-- Make sure to change these keybindings to your preference,
			-- and remove the ones you won't use
			{
				"<leader>e",
				"<cmd>Tfm<cr>",
				desc = "Open [E]xplorer (Yazi)",
			},
		},
	},
}
