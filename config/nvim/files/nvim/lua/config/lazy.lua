-- [Undestanding Neovim #2](https://www.youtube.com/watch?v=N-RFCfs6rxI&list=PLx2ksyallYzW4WNYHD9xOFrPRYGlntAft&index=2&t=389s)

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
  spec = 'plugins',
  change_detection = { notify = false },
}
