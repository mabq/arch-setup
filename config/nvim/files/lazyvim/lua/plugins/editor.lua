return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
  },
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- make the easier keybinding search the cwd, use `<leader>ff` for root directory
      { "<leader><space>", LazyVim.pick("files", { root = false }), desc = "Find Files (cwd)" },
    },
  },
  {
    "monaqa/dial.nvim",
    enabled = false,
  },

  --- Additional plugins -------------------------------------------------------
  {
    -- Detect tabstop and shiftwidth automatically
    "tpope/vim-sleuth",
  },
  {
    -- Yazi as file explorer
    "rolv-apneseth/tfm.nvim",
    name = "yazi (tfm.nvim)",
    lazy = false,
    opts = {
      file_manager = "yazi",
      replace_netrw = false,
      enable_cmds = true,
      ui = {
        border = "rounded",
        height = 0.8,
        width = 0.9,
        x = 0.5,
        y = 0.5,
      },
    },
    keys = {
      {
        "<leader>e", -- same keybinding as nvim-neo-tree
        "<cmd>Tfm<cr>",
        desc = "Explore (yazi)",
      },
    },
  },
  {
    -- Seamless navigation between tmux panes and vim splits
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<CR>", mode = { "n" }, desc = "Go to Left Window", remap = true },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<CR>", mode = { "n" }, desc = "Go to Lower Window", remap = true },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<CR>", mode = { "n" }, desc = "Go to Upper Window", remap = true },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<CR>", mode = { "n" }, desc = "Go to Right Window", remap = true },
    },
  },
  {
    -- Delete all the buffers except the current buffer
    "schickling/vim-bufonly",
    keys = {
      -- This command is also provided by bufferline but I disabled it.
      -- Unlike some suggested commands on Reddit, this plugin does not move the scroll position of the current buffer.
      -- You can also use `Alt-d` in Telescope to close the buffer under cursor.
      {
        "<leader>bo",
        "<cmd>BufOnly<CR>",
        desc = "Only buffer",
      },
    },
  },
  {
    -- overlay *'s over defined patterns in defined files
    enabled = false,
    "laytan/cloak.nvim",
  },
}
