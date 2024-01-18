-- Documentation: https://github.com/folke/lazy.nvim


-- 1. Install `lazy.nvim` plugin manager:
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    -- clone the repo into `~/.local/share/nvim/lazy/lazy.nvim/`
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
-- add the path to the runtimepath so that we can require lazy
vim.opt.rtp:prepend(lazypath)
-- there is also a `package.path` which lists all of the paths searched by `require()`, for more information see https://neovim.io/doc/user/luaref.html#package.path


-- 2. Load lazy:
-- Passing `plugins` instead of a spec instructs lazyvim to source every file in the `~/.config/nvim/lua/plugins` directory
require("lazy").setup("plugins")

