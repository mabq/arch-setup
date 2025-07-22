-- [Must watch](https://www.youtube.com/watch?v=HL7b63Hrc8U&list=PLx2ksyallYzW4WNYHD9xOFrPRYGlntAft&index=7)
-- `:h lsp`
-- `:checkhealth vim.lsp`
return {
  {
    -- Neovim
    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins used for completion, annotations and signatures of Neovim apis.
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
  {
    -- TypeScript
    -- Use `:TSToolsRenameFile` to rename files. See [custom user commans](https://github.com/pmizio/typescript-tools.nvim?tab=readme-ov-file#custom-user-commands)
    'pmizio/typescript-tools.nvim', -- faster than `typescript-language-server` with support for styled-components
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    opts = {
      tsserver_plugins = { '@styled/typescript-styled-plugin' }, -- support for styled-components
    },
  },
  {
    -- Main LSP Configuration
    'neovim/nvim-lspconfig', -- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig/tree/master)
    dependencies = {
      {
        { 'mason-org/mason.nvim', opts = {} },
        'mason-org/mason-lspconfig.nvim',
        'WhoIsSethDaniel/mason-tool-installer.nvim',
      },
      { 'j-hui/fidget.nvim', opts = {} }, -- LSP status updates
      'folke/trouble.nvim', -- nicer lsp actions
      'saghen/blink.cmp', -- extra LSP completion capabilities
    },
    config = function()
      -- Define LSP keymaps - check defaults with `:h lsp-defaults`.
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('mabq-lsp-attach', { clear = true }),

        callback = function(event)
          local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          map('gd', '<cmd>Trouble lsp_definitions<CR>', 'Definitions') -- Where a variable was first declared or a function is defined.
          map('K', vim.lsp.buf.hover, 'Definitions') -- Where a variable was first declared or a function is defined.
          map('<leader>lx', vim.lsp.buf.hover, 'Definitions') -- Where a variable was first declared or a function is defined.
          map('<leader>ln', vim.lsp.buf.rename, 'Rename')
          map('<leader>la', vim.lsp.buf.code_action, 'Code action', { 'n', 'x' }) -- Quick fixes, refactors, etc
          map('<leader>lr', '<cmd>Trouble lsp_references toggle<CR>', 'References')
          map('<leader>li', '<cmd>Trouble lsp_implementations toggle<CR>', 'Implementations') -- Useful when your language has ways of declaring types without an actual implementation.
          map('<leader>lD', '<cmd>Trouble lsp_declarations', 'Declarations') -- In C this will take you to the header
          map('<leader>ls', '<cmd>Trouble lsp_document_symbols', 'Symbols')
          map('<leader>lt', '<cmd>Trouble lsp_type_definitions toggle<CR>', 'Type definitions')
          map('<leader>lA', '<cmd>Trouble lsp toggle<CR>', 'All') -- all lsp functions

          -- AQUI ME QUEDE!

          -- vim.keymap.set('n', 'K', function()
          --   vim.lsp.buf.hover()
          -- end, opts)
          --
          -- -- LPS diagnitics
          -- vim.keymap.set('n', '<leader>ld', '<cmd>Trouble diagnostics toggle<CR>', opts)
          -- vim.keymap.set('n', '<leader>lD', '<cmd>Trouble diagnostics toggle filter.buf=0<CR>', opts)

          -- vim.keymap.set('i', '<C-h>', function()
          --     vim.lsp.buf.signature_help()
          -- end, opts)

          -- -- When you move your cursor, the highlights will be cleared (the second autocommand).
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          -- if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
          --     local highlight_augroup = augroup('mabq-lsp-highlight', { clear = false })
          --     vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
          --         buffer = e.buf,
          --         group = highlight_augroup,
          --         callback = vim.lsp.buf.document_highlight,
          --     })
          --     vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
          --         buffer = e.buf,
          --         group = highlight_augroup,
          --         callback = vim.lsp.buf.clear_references,
          --     })
          --     vim.api.nvim_create_autocmd('LspDetach', {
          --         group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
          --         callback = function(event2)
          --             vim.lsp.buf.clear_references()
          --             vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
          --         end,
          --     })
          -- end
          --
          -- The following code creates a keymap to toggle inlay hints in your
          -- code, if the language server you are using supports them
          -- This may be unwanted, since they displace some of your code
          if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
            vim.keymap.set('n', '<leader>lh', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled)
            end, opts)
          end
        end,
      })

      -------------------------------------------------------------------------

      require('fidget').setup {}
      require('mason').setup()

      -- Extend LSP capabilities with Blink -----------------------------------
      -- https://cmp.saghen.dev/installation.html#lazy-nvim
      local builtin_capabilities = vim.lsp.protocol.make_client_capabilities()
      local extended_capabilities = require('blink.cmp').get_lsp_capabilities()
      local capabilities = vim.tbl_deep_extend('force', {}, builtin_capabilities, extended_capabilities)
      require('mason-lspconfig').setup {
        ensure_installed = {
          -- Use nvim-lspconfig package names, not Mason package names.
          -- `:h lspconfig-all` shows the list of all pre-configured LSPs by `nvim-lspconfig`
          'lua_ls',
          'cssls',
          'html',
          'pyright',
        },
        automatic_installation = false,
        handlers = {
          -- Here you can customize the config provided by `nvim-lspconfig` for each LSP:

          -- Default handler:
          -- Adds the extra lsp capabilities provided by `blink.cmp`):
          function(server_name)
            require('lspconfig')[server_name].setup {
              capabilities = capabilities,
            }
          end,

          -- Zig handler (example):
          -- zls = function()
          --     local lspconfig = require 'lspconfig'
          --     lspconfig.zls.setup {
          --         root_dir = lspconfig.util.root_pattern('.git', 'build.zig', 'zls.json'),
          --         settings = {
          --             zls = {
          --                 enable_inlay_hints = true,
          --                 enable_snippets = true,
          --                 warn_style = true,
          --             },
          --         },
          --     }
          --     vim.g.zig_fmt_parse_errors = 0
          --     vim.g.zig_fmt_autosave = 0
          -- end,
        },
      }
    end,
  },
}
