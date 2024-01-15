-- Documentation: https://github.com/folke/lazy.nvim
-- Plugins are stored in `~/.local/share/nvim/lazy/`


-- Install lazy.nvim (if not already installled):
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


-- Launch lazy:
require("lazy").setup("plugins")


-- local plugins = {
--     -- LSP --
--     --   https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/you-might-not-need-lsp-zero.md#you-might-not-need-lsp-zero
--     { 'neovim/nvim-lspconfig' },
--     { 'williamboman/mason.nvim' },
--     { 'williamboman/mason-lspconfig.nvim' },
--     { 'hrsh7th/nvim-cmp' },
--     --   completion sources
--     { 'hrsh7th/cmp-nvim-lsp' },
--     { 'hrsh7th/cmp-path' },
--     { 'hrsh7th/cmp-buffer' },
--     { 'L3MON4D3/LuaSnip' },
--
--     -- Others --
--     { 'godlygeek/tabular' },
--     { 'kmonad/kmonad-vim' }, -- syntax highlightlting for kmonad files
--     { 'eandrju/cellular-automaton.nvim' },
--
-- }

