return {
    {
        enabled = false,
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",  -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            "3rd/image.nvim",  -- optional image support in preview window: See `# Preview Mode` for more information
        },
        keys = {
            { "<leader>fe", "<cmd>Neotree<CR>", mode = { "n" }, desc = "Neotree toggle position=float", },
        },
    },
}
