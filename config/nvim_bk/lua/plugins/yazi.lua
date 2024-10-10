return {
	{
		enabled = true,
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
				["<ESC>"] = "q",
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
				desc = "Explore (yazi)",
			},
		},
	},

	{
		enable = false,
		"mikavilpas/yazi.nvim",
		event = "VeryLazy",
		keys = {
			{
				"<leader>e",
				"<cmd>Yazi<cr>",
				desc = "Open yazi at the current file",
			},
			-- {
			-- 	-- Open in the current working directory
			-- 	"<leader>cw",
			-- 	"<cmd>Yazi cwd<cr>",
			-- 	desc = "Open the file manager in nvim's working directory",
			-- },
			-- {
			-- 	-- NOTE: this requires a version of yazi that includes
			-- 	-- https://github.com/sxyazi/yazi/pull/1305 from 2024-07-18
			-- 	"<c-up>",
			-- 	"<cmd>Yazi toggle<cr>",
			-- 	desc = "Resume the last yazi session",
			-- },
		},
		opts = {
			-- if you want to open yazi instead of netrw, see below for more info
			open_for_directories = false,

			-- enable these if you are using the latest version of yazi
			-- use_ya_for_events_reading = true,
			-- use_yazi_client_id_flag = true,

			keymaps = {
				show_help = "<f1>",
			},
		},
	},
}
