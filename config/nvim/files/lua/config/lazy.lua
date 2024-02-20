-- https://github.com/folke/lazy.nvim

-- Install
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


-- Load - passing the string "plugins" instead of a spec instructs lazyvim to source every file in the `~/.config/nvim/lua/plugins` directory
require("lazy").setup("plugins")


-- See:
--  [Plugin spec](https://github.com/folke/lazy.nvim#-plugin-spec) -- brief description about spec properties
--  [Plugin configuration](https://dev.to/vonheikemen/lazynvim-plugin-configuration-3opi) -- comprenhensive explanation of when to use each property
