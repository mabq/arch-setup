-- LazyVim keymaps are stores in `~/.local/share/nvim/lazy/LazyVim/lua/lazyvim/config/keymaps.lua`

-- Helpful commands:
--  `:h lua-guide-mappings`    - how to set keymappings in Lua
--  `:h map-modes`             - check modes table

-- Important!
--   Make sure you don't overwrite any LazyVim keybind.

-- No-leader-key combinations --------------------------------------------------

-- Disable replay last recorded macro, to easy to trigger accidentally
-- vim.keymap.set("n", "Q", "<nop>")

-- Better join line
-- vim.keymap.set("n", "J", "mzJ`z", { desc = "Join line" })

-- Scroll only one line at a time
-- vim.keymap.set({ "n", "v" }, "<ScrollWheelUp>", "<C-y>", { desc = "Scroll up a single line" })
-- vim.keymap.set({ "n", "v" }, "<ScrollWheelDown>", "<C-e>", { desc = "Scroll down a single line" })

-- Leader-key combinations -----------------------------------------------------

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank (to clipboard)" })
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete (to void)" })

vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste (without yanking)" }) -- [["_c<Esc>p]]

-- Substitute word under cursor
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Rename word (raw)" })

-- Ctrl-key combinations -------------------------------------------------------

-- Tmux-sessionizer (same as Zsh)
vim.keymap.set(
  "n",
  "<C-s>",
  ":silent !tmux neww $HOME/.config/tmux/scripts/tmux-sessionizer.sh<CR>",
  { desc = "Tmux-sessionizer" }
)

-- Move through popup options with up/down arrows
vim.keymap.set("c", "<down>", function()
  if vim.fn.pumvisible() == 1 then
    return "<c-n>"
  end
  return "<down>"
end, { expr = true })
vim.keymap.set("c", "<up>", function()
  if vim.fn.pumvisible() == 1 then
    return "<c-p>"
  end
  return "<up>"
end, { expr = true })
