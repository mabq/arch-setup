return {
	{
		enabled = true,
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		-- opts = {},
		keys = {
			-- { "<leader>ld", "<cmd>TroubleToggle lsp_definitions<cr>", desc = "Go to definitions (trouble)" }, -- can't go back with `Ctrl-t` (only `Ctrl-o`), use telescope for now
			-- { "<leader>lr", "<cmd>TroubleToggle lsp_references<cr>", desc = "Go to references (trouble)" }, -- can't go back with `Ctrl-t` (only `Ctrl-o`), use telescope for now
			{ "<leader>xx", "<cmd>TroubleToggle<cr>", desc = "Trouble toggle" },
			{ "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Trouble workspace" }, -- workspace diagnostics from the builtin LSP client
			{ "<leader>xb", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Trouble buffer" }, -- document diagnostics from the builtin LSP client
			{ "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", desc = "Trouble quickfix" }, -- quickfix items
			{ "<leader>xl", "<cmd>TroubleToggle loclist<cr>", desc = "Trouble loclist" }, -- items from the window's location list
		},
	},
}
