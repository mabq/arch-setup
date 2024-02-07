-- For more information see:
--
--   https://neovim.io/doc/user/lua-guide.html#lua-guide-mappings
--   help: `:h lua-guide-mappings` 
--   Possible modes are described in `:h map-modes`

local map = vim.keymap.set

-------------------------------------------------------------------------------

-- Default lazyvim keymaps: 
-- see https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- Better up/down in editor
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Use up/down to move through popupmenus (pum)
map('c', '<down>', function()
    if vim.fn.pumvisible() == 1 then return '<c-n>' end
    return '<down>'
end, { expr = true })
map('c', '<up>', function()
    if vim.fn.pumvisible() == 1 then return '<c-p>' end
    return '<up>'
end, { expr = true })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +1<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -1<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -1<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +1<cr>", { desc = "Increase window width" })

-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- Buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

-- Clear search with <esc>
-- map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })
map("n", "<esc>", "<cmd>noh<cr>", { desc = "Clear hlsearch" })

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
-- map(
--     "n",
--     "<leader>ur",
--     "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
--     { desc = "Redraw / clear hlsearch / diff update" }
-- )

-- Center search match
map("n", "n", "'nzzzv'", { expr = true, desc = "Next search result" })
map("n", "N", "'Nzzzv'", { expr = true, desc = "Prev search result" })

-- Add undo break-points (this one is pretty clever)
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")
map("i", "<CR>", "<CR><c-g>u")

-- Keep selection while indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Lazy
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- Location list
-- map("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
-- map("n", "[l", vim.cmd.lprev, { desc = "Previous location" })
-- map("n", "]l", vim.cmd.lnext, { desc = "Next location" })

-- Quickfix list
-- map("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })
-- map("n", "[q", "<cmd>cprev<CR>zz", { desc = "Previous quickfix" })
-- map("n", "]q", "<cmd>cnext<CR>zz", { desc = "Next quickfix" })

-- Formatting
-- (apparently formating setup is complex)

-- Diagnostic
-- local diagnostic_goto = function(next, severity)
--     local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
--     severity = severity and vim.diagnostic.severity[severity] or nil
--     return function()
--         go({ severity = severity })
--     end
-- end
-- map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
-- map("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
-- map("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
-- map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
-- map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
-- map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
-- map("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-------------------------------------------------------------------------------

-- netrw
-- vim.keymap.set("n", "<leader>fe", vim.cmd.Ex)

-- tmux-sessionizer
vim.keymap.set("n", "<C-f>", ":silent !tmux neww $HOME/.config/tmux/scripts/tmux-sessionizer.sh<CR>")

-- join lines without changing cursor position (using marks)
vim.keymap.set("n", "J", "mzJ`z")

-- select all
-- vim.keymap.set("n", "<C-a>", "ggVG")

-- copy and delete to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["+d]])

-- paste (in visual mode) without replacing the content of the register with the deleted text
vim.keymap.set("x", "<leader>p", [["_dP]])

-- change all occurrences
--   literal substitution in the current buffer, use lsp to rename symbols across files
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- toggle wrap
vim.keymap.set("n", "<leader>w", "<cmd>set wrap!<CR>")

-- make Ctrl-c and Esc behave exactly the same
vim.keymap.set("i", "<C-c>", "<Esc>")

-- make file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- make it rain
-- vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

-- disable default commands
vim.keymap.set("n", "Q", "<nop>") -- replay last recorded macro (too easy to fired by accident)

