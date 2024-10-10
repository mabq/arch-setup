return {
	{
		enabled = true,
		"echasnovski/mini.comment",
		version = false,
		config = function()
			require("mini.comment").setup({
				options = {
					custom_commentstring = function()
						return require("ts_context_commentstring").calculate_commentstring() or vim.bo.commentstring
					end,
				},
			})
		end,
	},
	{
		-- Add support for JSX comments and other embedded languages (requires tree-sitter and mini.comment)
		enabled = true,
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	-- {
	-- 	enabled = false, -- replaced with mini.comment
	-- 	"numToStr/Comment.nvim",
	-- 	config = function()
	-- 		require("Comment").setup({
	-- 			pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
	-- 		})
	-- 	end,
	-- },
}
