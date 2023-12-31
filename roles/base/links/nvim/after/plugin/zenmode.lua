vim.keymap.set("n", "<leader>zz", function()
    require("zen-mode").setup {
        -- https://github.com/folke/zen-mode.nvim#%EF%B8%8F-configuration
        window = {
            backdrop = 0.95,
            width = 120,
            options = {
                number = false,
                relativenumber = false,
                cursorcolumn = false,
            }
        },
    }
    require("zen-mode").toggle()
end)
