return {
    {
        enabled = true,
       "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        -- opts = {
        --      see https://github.com/folke/trouble.nvim#setup
        -- },
        keys = {
            { "<leader>t", function() require("trouble").toggle() end, mode = { "n" }, desc = "Trouble toggle", },
        }
    },
}
