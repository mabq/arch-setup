-- Use `:luafile %` to source a lua file without having to close neovim

require("config.options")     -- must be loaded before lazy, because of mapleader
require("config.lazy")
require("config.keymaps")
require("config.autocmds")
