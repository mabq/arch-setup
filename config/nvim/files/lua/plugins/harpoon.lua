return {
    {
        enabled = false,
        'ThePrimeagen/harpoon',
        branch = "harpoon2",
        dependencies = { 'nvim-lua/plenary.nvim' },
        keys = {
            { "<leader>a", function() require("harpoon"):list():append() end, mode = { "n" }, desc = "Harpoon add file", },
            { "<C-e>", function() local harpoon = require("harpoon") harpoon.ui:toggle_quick_menu(harpoon:list()) end, mode = { "n" }, desc = "Harpoon quick menu", },
            { "<C-h>", function() require("harpoon"):list():select(1) end, mode = { "n" }, desc = "Harpoon to file 1", },
            { "<C-j>", function() require("harpoon"):list():select(2) end, mode = { "n" }, desc = "Harpoon to file 2", },
            { "<C-k>", function() require("harpoon"):list():select(3) end, mode = { "n" }, desc = "Harpoon to file 3", },
            { "<C-l>", function() require("harpoon"):list():select(4) end, mode = { "n" }, desc = "Harpoon to file 4", },
            { "<C-;>", function() require("harpoon"):list():select(5) end, mode = { "n" }, desc = "Harpoon to file 5", },
        },
    }
}
