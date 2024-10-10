return {
	enabled = true,
	"karb94/neoscroll.nvim",
	config = function()
		local neoscroll = require("neoscroll")

		local keymap = {
			["<C-u>"] = function()
				neoscroll.ctrl_u({ duration = 200 })
			end,
			["<C-d>"] = function()
				neoscroll.ctrl_d({ duration = 200 })
			end,
			["zt"] = function()
				neoscroll.zt({ half_win_duration = 100 })
			end,
			["zz"] = function()
				neoscroll.zz({ half_win_duration = 100 })
			end,
			["zb"] = function()
				neoscroll.zb({ half_win_duration = 100 })
			end,
		}

		local modes = { "n", "v", "x" }
		for key, func in pairs(keymap) do
			vim.keymap.set(modes, key, func)
		end

		neoscroll.setup({
			mappings = {}, -- disable default mappings
			hide_cursor = false, -- Hide cursor while scrolling
			stop_eof = true, -- Stop at <EOF> when scrolling downwards
			respect_scrolloff = true, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
			cursor_scrolls_alone = false, -- Keep cursor in its relative position
			easing = "sine", -- Default easing function
			performance_mode = true,
		})
	end,
}
