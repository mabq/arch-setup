return {
	{
		enabled = false,
		"ggandor/leap.nvim",
		config = function()
			local leap = require("leap")
			leap.add_default_mappings(true)
			leap.opts.preview_filter = function()
				return true
			end
			vim.keymap.set({ "n", "x", "o" }, "f", "<Plug>(leap-forward)")
			vim.keymap.set({ "n", "x", "o" }, "F", "<Plug>(leap-backward)")
		end,
	},
}
