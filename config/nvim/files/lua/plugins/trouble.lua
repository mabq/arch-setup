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
				desc = "Trouble: Toogle",
			},
			{
				"<leader>xw",
				"<cmd>TroubleToggle workspace_diagnostics<cr>", -- workspace diagnostics from the builtin LSP client
				desc = "Trouble: Workspace",
			},
			{
				"<leader>xb",
				"<cmd>TroubleToggle document_diagnostics<cr>", -- document diagnostics from the builtin LSP client
				desc = "Trouble: Buffer",
			},
			{
				"<leader>xr",
				"<cmd>TroubleToggle lsp_references<cr>", -- references of the word under the cursor from the builtin LSP client
				desc = "Trouble: References",
			},
			{
				"<leader>xd",
				"<cmd>TroubleToggle lsp_definitions<cr>", -- definitions of the word under the cursor from the builtin LSP client
				desc = "Trouble: Definitions",
			},
			{
				"<leader>xq",
				"<cmd>TroubleToggle quickfix<cr>", -- quickfix items
				desc = "Trouble: Quickfix",
			},
			{
				"<leader>xl",
				"<cmd>TroubleToggle loclist<cr>", -- items from the window's location list
				desc = "Trouble: Loclist",
			},
		},
	},
}
