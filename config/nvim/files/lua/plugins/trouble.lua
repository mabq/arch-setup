-- https://github.com/folke/trouble.nvim
return {
	{
		enabled = true,
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		-- opts = {},
		keys = { -- launches only via keybindings
			{
				"<leader>xx",
				"<cmd>TroubleToggle<cr>",
				desc = "Trouble toggle",
			},
			{
				"<leader>xw",
				"<cmd>TroubleToggle workspace_diagnostics<cr>", -- workspace diagnostics from the builtin LSP client
				desc = "Trouble workspace",
			},
			{
				"<leader>xb",
				"<cmd>TroubleToggle document_diagnostics<cr>", -- document diagnostics from the builtin LSP client
				desc = "Trouble buffer",
			},
			{
				"<leader>xr",
				"<cmd>TroubleToggle lsp_references<cr>", -- references of the word under the cursor from the builtin LSP client
				desc = "Trouble references",
			},
			{
				"<leader>xd",
				"<cmd>TroubleToggle lsp_definitions<cr>", -- definitions of the word under the cursor from the builtin LSP client
				desc = "Trouble definitions",
			},
			{
				"<leader>xq",
				"<cmd>TroubleToggle quickfix<cr>", -- quickfix items
				desc = "Trouble quickfix",
			},
			{
				"<leader>xl",
				"<cmd>TroubleToggle loclist<cr>", -- items from the window's location list
				desc = "Trouble loclist",
			},
		},
	},
}
