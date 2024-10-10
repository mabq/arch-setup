return {
	{
		-- Vim syntax highlighting for .kbd files (kmonad, kanata)
		enabled = false,
		"ton/vim-bufsurf",
		lazy = false,
		keys = {
			{ "<C-S-o>", "<cmd>BufSurfBack<CR>", mode = { "n" }, desc = "Buffer Surf Back" },
			{ "<C-S-i>", "<cmd>BufSurfForward<CR>", mode = { "n" }, desc = "Buffer Surf Forward" },
		},
	},
}
