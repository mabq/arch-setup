return {
    {
        enabled = true,
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        -- opts = {
        --      see https://github.com/folke/trouble.nvim#setup
        -- },
        keys = {
            { "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", mode = { "n" }, desc = "Trouble toggle", },
        }
    },
}
