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
				desc = "Trouble: [W]orkspace",
			},
			{
				"<leader>xb",
				"<cmd>TroubleToggle document_diagnostics<cr>", -- document diagnostics from the builtin LSP client
				desc = "Trouble: [B]uffer",
			},
			{
				"<leader>xr",
				"<cmd>TroubleToggle lsp_references<cr>", -- references of the word under the cursor from the builtin LSP client
				desc = "Trouble: [R]eferences",
			},
			{
				"<leader>xd",
				"<cmd>TroubleToggle lsp_definitions<cr>", -- definitions of the word under the cursor from the builtin LSP client
				desc = "Trouble: [D]efinitions",
			},
			{
				"<leader>xq",
				"<cmd>TroubleToggle quickfix<cr>", -- quickfix items
				desc = "Trouble: [Q]uickfix",
			},
			{
				"<leader>xl",
				"<cmd>TroubleToggle loclist<cr>", -- items from the window's location list
				desc = "Trouble: [L]oclist",
			},
		},
	},
}
