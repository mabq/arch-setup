require('rose-pine').setup({
    highlight_groups = {
        ColorColumn = { bg = 'surface' },
        -- CursorLine = { bg = 'highlight_low' },
        StatusLine = { bg = 'highlight_high', fg = 'text' },
        StatusLineNC = { bg = 'highlight_med', fg = 'subtle' },
    }
})

vim.cmd.colorscheme('rose-pine')

