return {
  -- The Typescript language extra provided by LazyVim uses the `vtsls` lsp,
  -- which does not provide support for `styled-components`. But the LazyVim
  -- configurations make it super useful.

  -- Alternatively, you can opt to use the following instead.
  -- {
  --   -- Disable tsserver
  --   -- https://github.com/pmizio/typescript-tools.nvim?tab=readme-ov-file#-installation
  --   "neovim/nvim-lspconfig",
  --   opts = {
  --     servers = {
  --       tsserver = {
  --         enabled = false,
  --       },
  --     },
  --     setup = {
  --       tsserver = function()
  --         return true
  --       end,
  --     },
  --   },
  -- },
  -- {
  --   -- Use this LPS instead
  --   "pmizio/typescript-tools.nvim",
  --   dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  --   opts = {
  --     settings = {
  --       -- array of strings("fix_all"|"add_missing_imports"|"remove_unused"|
  --       -- "remove_unused_imports"|"organize_imports") -- or string "all"
  --       -- to include all supported code actions
  --       -- specify commands exposed as code_actions
  --       expose_as_code_action = { "all" },
  --       -- specify a list of plugins to load by tsserver, e.g., for support `styled-components`
  --       -- the styled-components npm package is installed with Ansible
  --       tsserver_plugins = {
  --         "@styled/typescript-styled-plugin",
  --       },
  --       jsx_close_tag = {
  --         enable = true,
  --         filetypes = { "javascriptreact", "typescriptreact" },
  --       },
  --     },
  --   },
  -- },

  -- Prefer Biome for formatting -----------------------------------------------
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = { "biome" },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        javascript = { "biome", lsp_format = "fallback" },
        javascriptreact = { "biome", lsp_format = "fallback" },
        typescript = { "biome", lsp_format = "fallback" },
        typescriptreact = { "biome", lsp_format = "fallback" },
      },
    },
  },
}
