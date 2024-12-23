return {
    {
        'echasnovski/mini.statusline',
        version = false,
        config = function()
            vim.opt.showmode = false
            local statusline = require 'mini.statusline'
            statusline.setup {
                use_icons = true,
            }
        end,
    },
}
