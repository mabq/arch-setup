return {
    {
        enabled = true,
        'ThePrimeagen/harpoon',
        branch = "harpoon2",
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function() require("harpoon"):setup() end,
        keys = {
            { "<leader>a", function() require("harpoon"):list():append() end, mode = { "n" }, desc = "Harpoon add file" },
            { "<leader>h", function() local harpoon = require("harpoon"); harpoon.ui:toggle_quick_menu(harpoon:list()) end, mode = { "n" }, desc = "Harpoon toggle quick menu" },
            { "<C-j>", function() require("harpoon"):list():select(1) end, mode = { "n" }, desc = "Harpoon nav file 2" },
            { "<C-k>", function() require("harpoon"):list():select(2) end, mode = { "n" }, desc = "Harpoon nav file 3" },
            { "<C-l>", function() require("harpoon"):list():select(3) end, mode = { "n" }, desc = "Harpoon nav file 4" },
            { "<C-;>", function() require("harpoon"):list():select(4) end, mode = { "n" }, desc = "Harpoon nav file 5" },
        },
    }
}
