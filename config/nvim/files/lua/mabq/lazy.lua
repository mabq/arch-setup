----------------------------------------------------------------------
-- Auto-install lazy.nvim if not present
--   https://github.com/folke/lazy.nvim#-installation
---------------------------------------------------------------------

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


----------------------------------------------------------------------
-- Plugins to install
--   https://github.com/folke/lazy.nvim#-plugin-spec
----------------------------------------------------------------------

local plugins = {

    -- Basics --
    { 'numToStr/Comment.nvim' },
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
    { 'rose-pine/neovim',                name = 'rose-pine' },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        dependencies = {
            'nvim-lua/plenary.nvim',
        }
    },
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


----------------------------------------------------------------------
-- Launch lazy
----------------------------------------------------------------------

local opts = {} -- empty table for default options, you can check those in https://github.com/folke/lazy.nvim#%EF%B8%8F-configuration

-- Run `:checkhealth lazy` to verify everything is working properly.
require("lazy").setup(plugins, opts)
