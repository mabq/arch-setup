-- Documentation: https://github.com/nvim-telescope/telescope.nvim
--   `:help telescope.nvim`
--   `:help telescope.setup`
--   `:help telescope.builtin`
--   `:help telescope.layout`
--   `:help telescope.actions`

return {
    {
        enabled = true,
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                -- improve sorting performance (native C)
                enabled = true,
                'nvim-telescope/telescope-fzf-native.nvim',
                build =
                'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
            },
        },
        keys = {
            { "<leader>fg", function() require("telescope.builtin").git_files() end, mode = { "n" }, desc = "Telescope git_files", },
            { "<leader>ff", function() require("telescope.builtin").find_files() end, mode = { "n" }, desc = "Telescope find_files (all)", },
            { "<leader>fs", function() require("telescope.builtin").grep_string({ search = vim.fn.input("Project search: ")}); end, mode = { "n" }, desc = "Telescope grep_string", },
            -- { "<leader>fs", function() require("telescope.builtin").spell_suggest() end, mode = { "n" }, desc = "Telescope spell_suggest", },
            { "<leader>fb", function() require("telescope.builtin").buffers() end, mode = { "n" }, desc = "Telescope buffers", },
            { "<leader>fh", function() require("telescope.builtin").help_tags() end, mode = { "n" }, desc = "Telescope help_tags", },
        },
    },

    ---------------------------------------------------------------------------

    {
        enabled = true,
        'xiyaowong/telescope-emoji.nvim',
        keys = {
            { "<leader>fj", "<cmd>Telescope emoji<CR>", mode = { "n" }, desc = "Telescope emoji", },
        }
    },
}
