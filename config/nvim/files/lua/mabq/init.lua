-- Use `:luafile %` to source a lua file without having to close neovim

require("mabq.options")     -- must be loaded before lazy, because of mapleader
require("mabq.lazy")
require("mabq.remap")   -- must be loaded after plugings since we reference plugins in our mappings
