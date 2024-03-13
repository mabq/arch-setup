-- Collection of various small independent plugins/modules
return {
	"echasnovski/mini.nvim",
	config = function()
		-- Better Around/Inside textobjects ------------------------------------
		--  - va)  - [V]isually select [A]round [)]paren
		--  - yinq - [Y]ank [I]nside [N]ext [']quote
		--  - ci'  - [C]hange [I]nside [']quote
		-- require("mini.ai").setup({ n_lines = 500 })

		-- Add/delete/replace surroundings (brackets, quotes, etc.) ------------
		-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
		-- - sd'   - [S]urround [D]elete [']quotes
		-- - sr)'  - [S]urround [R]eplace [)] [']
		require("mini.surround").setup({
			mappings = {
				add = "gsa", -- Add surrounding in Normal and Visual modes
				delete = "gsd", -- Delete surrounding
				find = "gsf", -- Find surrounding (to the right)
				find_left = "gsF", -- Find surrounding (to the left)
				highlight = "gsh", -- Highlight surrounding
				replace = "gsr", -- Replace surrounding
				update_n_lines = "gsn", -- Update `n_lines`

				suffix_last = "l", -- Suffix to search with "prev" method
				suffix_next = "n", -- Suffix to search with "next" method
			},
		})

		-- Autopairs -----------------------------------------------------------
		local function toggleAutoPairs()
			local Util = require("lazy.core.util")
			vim.g.minipairs_disable = not vim.g.minipairs_disable
			if vim.g.minipairs_disable then
				Util.warn("Disabled auto pairs", { title = "Option" })
			else
				Util.info("Enabled auto pairs", { title = "Option" })
			end
		end
		require("mini.pairs").setup({
			vim.keymap.set("n", "<leader>tp", toggleAutoPairs, { desc = "Toggle auto pairs" }),
		})

		-- Simple and easy statusline ------------------------------------------
		local statusline = require("mini.statusline")
		-- set use_icons to true if you have a Nerd Font
		statusline.setup({ use_icons = vim.g.have_nerd_font })
		-- You can configure sections in the statusline by overriding their
		-- default behavior. For example, here we set the section for
		-- cursor location to LINE:COLUMN
		---@diagnostic disable-next-line: duplicate-set-field
		statusline.section_location = function()
			return "%2l:%-2v"
		end

		-- Highlight colors ----------------------------------------------------
		local hipatterns = require("mini.hipatterns")
		hipatterns.setup({
			highlighters = {
				-- Highlight hex color strings (`#rrggbb`) using that color
				hex_color = hipatterns.gen_highlighter.hex_color(),
			},
		})

		-- ... and there is more!
		--  Check out: https://github.com/echasnovski/mini.nvim
	end,
}
