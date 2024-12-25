return {
    'folke/flash.nvim',
    event = 'VeryLazy',
    opts = {
        -- https://github.com/folke/flash.nvim?tab=readme-ov-file#%EF%B8%8F-configuration
        modes = {
            search = { enabled = false }, -- do not integrate jump on default search
            char = { enabled = false }, -- do not integrate on default `f`, `F`, `t`, `T`
        },
    },
    keys = {
        -- stylua: ignore
        { 'f', mode = { 'n', 'x', 'o' }, function() require('flash').jump() end, desc = 'Flash', },
    },
}
