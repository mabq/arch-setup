-- `require` looks for files in directories listed on the runtimepath (not in paths relative to this file), that's why you need to include `config.`

require("config.options")     -- must be loaded before lazy, because of mapleader
require("config.lazy")
require("config.mappings")
require("config.autocmds")
