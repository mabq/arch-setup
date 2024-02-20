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
            { 'nvim-lua/plenary.nvim' },
            {
                -- improve sorting performance (native C)
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
                config = function ()
                    require('telescope').load_extension('fzf')
                end
            },
        },
        cmd = "Telescope",
        keys = {
            { "<leader>ff", ":Telescope git_files<CR>", mode = { "n" }, desc = "Telescope find git", },
            { "<leader>fa", ":Telescope find_files<CR>", mode = { "n" }, desc = "Telescope find all", },
            { "<leader>fg", function() require("telescope.builtin").grep_string({ search = vim.fn.input("Project search: ")}); end, mode = { "n" }, desc = "Telescope find grep", },
            { "<leader>fb", ":Telescope buffers<CR>", mode = { "n" }, desc = "Telescope find buffers", },
            { "<leader>fh", ":Telescope help_tags<CR>", mode = { "n" }, desc = "Telescope find help", },
        },
    },
    {
        enabled = true,
        'xiyaowong/telescope-emoji.nvim', -- (replaced with emote, system level)
        keys = {
            { "<leader>fj", "<cmd>Telescope emoji<CR>", mode = { "n" }, desc = "Telescope find emoji", },
        },
        config = function ()
            -- when launching emoji before running telescope
            require('telescope')
        end
    },
}
