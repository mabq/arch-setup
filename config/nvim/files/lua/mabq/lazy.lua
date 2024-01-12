-- Documentation:
--   https://github.com/folke/lazy.nvim

-------------------------------------------------------------------------------
-- Install lazy.nvim (if not already installled):
-------------------------------------------------------------------------------

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)


-------------------------------------------------------------------------------
-- Define plugins to install:
--   Plugins are stored in `~/.local/share/nvim/lazy/`
-------------------------------------------------------------------------------

local plugins = {

    -- treesitter is all about parsing code as fast as possible (create an abstract syntax tree)
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

    -- themes map colors to parsed syntax tree items
    { 'rose-pine/neovim',                name = 'rose-pine' },
    { "catppuccin/nvim",                 name = "catppuccin", priority = 1000 },

    -- fuzzy find
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },


    { 'numToStr/Comment.nvim' },
    {
        'ThePrimeagen/harpoon',
        branch = "harpoon2",
        dependencies = {
            'nvim-lua/plenary.nvim',
        }
    },
    { 'mbbill/undotree' },
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            -- https://github.com/folke/trouble.nvim#setup
        },
    },
    { "tpope/vim-fugitive" },
    { "folke/zen-mode.nvim" },
    { "DreamMaoMao/yazi.nvim" },

    -- LSP --
    --   https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/you-might-not-need-lsp-zero.md#you-might-not-need-lsp-zero
    { 'neovim/nvim-lspconfig' },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'hrsh7th/nvim-cmp' },
    --   completion sources
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-buffer' },
    { 'L3MON4D3/LuaSnip' },

    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            -- https://github.com/folke/trouble.nvim#setup
        },
    },

    -- Others --
    { 'godlygeek/tabular' },
    { 'kmonad/kmonad-vim' }, -- syntax highlightlting for kmonad files
    { 'eandrju/cellular-automaton.nvim' },
    -- 'nvim-lualine/lualine.nvim',
    -- 'TimUntersberger/neogit', -- possible alternative to vim-fugitive (written in lua)
}


-------------------------------------------------------------------------------
-- Define options:
-------------------------------------------------------------------------------

local opts = {} -- empty table for default options, you can check those in https://github.com/folke/lazy.nvim#%EF%B8%8F-configuration


-------------------------------------------------------------------------------
-- Let lazy do it's magic:
--   Run `:checkhealth lazy` to verify everything is working properly
-------------------------------------------------------------------------------

require("lazy").setup(plugins, opts)
