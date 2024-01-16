return {
    {
        enabled = true,
        'rose-pine/neovim', 
        name = "rose-pine",  -- otherwise shown as `neovim`
        priority = 1000,  -- recommended by lazy docs
        config = function ()
            require("rose-pine").setup({
                highlight_groups = {
                    ColorColumn = { bg = 'highlight_low', blend = 30 },
                    CursorLine = { bg = 'highlight_low', blend = 50 },
                    StatusLine = { fg = "text", bg = "highlight_med", blend = 60 },
                    StatusLineNC = { fg = "muted", bg = "highlight_med", blend = 60 },
                    -- markdownH1 = { fg = "text", bg = "love", blend = 50 },
                }
            })
            vim.cmd.colorscheme('rose-pine')
        end
    },

    {
        enabled = false,
        'catppuccin/nvim', 
        name = "catpuccin",  -- otherwise shown as `nvim`
        priority = 1000,  -- recommended by lazy docs
        config = function ()
            vim.cmd.colorscheme('catppuccin')
        end
    },
}
