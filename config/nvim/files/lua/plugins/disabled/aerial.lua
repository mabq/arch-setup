return {
	-- A code outline window for skimming and quick navigation
	enabled = false,
	"stevearc/aerial.nvim",
	opts = {},
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{ mode = { "n" }, "<leader>ta", "<cmd>AerialToggle!<CR>", desc = "Toggle aerial" },
	},
	config = function()
		require("aerial").setup({
			backends = { "lsp", "treesitter", "markdown", "man" },
			on_attach = function(bufnr)
				-- Jump forwards/backwards with '{' and '}'
				vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr, desc = "Aerial previous" })
				vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr, desc = "Aerial next" })
			end,
		})
	end,
}
