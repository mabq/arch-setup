return {
	{
		enabled = true,
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			-- Apparently I can only pass highlight-group names in the `highlight` options below, so I need to create
			-- new highlight group names.
			-- Create the highlight groups in the highlight setup hook, so they are reset every time the colorscheme changes
			local hooks = require("ibl.hooks")
			hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
				-- These colors go well with the tokyo-night theme
				-- I only want two colors, but you can define as many as you want
				vim.api.nvim_set_hl(0, "indent-blankline-unfocus", { fg = "#24283b" })
				vim.api.nvim_set_hl(0, "indent-blankline-focused", { fg = "#565f89" })
			end)

			require("ibl").setup({
				indent = {
					-- char: reuse the same character defined in 'mabq/options.lua' (vim.opt.listchars)
					char = "▏",
					highlight = { "indent-blankline-unfocus" },
				},
				scope = {
					highlight = { "indent-blankline-focused" },
					show_start = false,
					show_end = false,
				},
			})
		end,
	},
}
