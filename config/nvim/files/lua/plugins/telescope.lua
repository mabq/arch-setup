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
            { "<leader>fg", "<cmd>Telescope git_files<CR>", mode = { "n" }, desc = "Telescope git files", },
            { "<leader>ff", "<cmd>Telescope find_files<CR>", mode = { "n" }, desc = "Telescope find files", },
            { "<leader>f/", function() require("telescope.builtin").grep_string({ search = vim.fn.input("Project search: ")}); end, mode = { "n" }, desc = "Telescope find grep", },
            { "<leader>fb", "<cmd>Telescope buffers<CR>", mode = { "n" }, desc = "Telescope find buffers", },
            { "<leader>fh", "<cmd>Telescope help_tags<CR>", mode = { "n" }, desc = "Telescope find help", },
        },
    },
    -- {
    --     (replaced with a system-level tool)
    --     enabled = true,
    --     'xiyaowong/telescope-emoji.nvim', -- (replaced with emote, system level)
    --     keys = {
    --         { "<leader>fj", "<cmd>Telescope emoji<CR>", mode = { "n" }, desc = "Telescope find emoji", },
    --     },
    --     config = function ()
    --         -- when launching emoji before running telescope
    --         require('telescope')
    --     end
    -- },
}
