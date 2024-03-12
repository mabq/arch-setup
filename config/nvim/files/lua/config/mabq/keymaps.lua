-- General keymaps:
--  `:h lua-guide-mappings`
--  `:h map-modes`
--  https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- Clear search with <esc>
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Better join line
vim.keymap.set("n", "J", "mzJ`z")

-- Better next/previous match
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Yank/Delete to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>d", [["+d]], { desc = "Delete to clipboard" })

-- Paste without yanking
vim.keymap.set("x", "<leader>p", [["_c<Esc>p]], { desc = "Paste without yanking" }) -- [["_dP]]

-- Better up/down pop up menu
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

-- Toggle options
vim.keymap.set("n", "<leader>tw", "<cmd>set wrap!<CR>", { desc = "Toggle word wrap" })
vim.keymap.set("n", "<leader>ts", "<cmd>set spell!<CR>", { desc = "Toggle spelling" })
vim.keymap.set("n", "<leader>tL", "<cmd>set relativenumber!<CR>", { desc = "Toggle relative line numbers" })
vim.keymap.set("n", "<leader>tl", "<cmd>set number!<CR>", { desc = "Toggle line numbers" })
vim.keymap.set("n", "<leader>ti", vim.show_pos, { desc = "Toggle highlight symbol under cursor" })

-- Move to window using the <ctrl> hjkl keys (use default keybindings, these are now used by Harpoon)
-- vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
-- vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
-- vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
-- vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Resize window using <ctrl> arrow keys
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move lines
vim.keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- Buffers
-- vim.keymap.set("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
vim.keymap.set("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
vim.keymap.set("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })

-- Keywordprg
-- vim.keymap.set("n", "<leader>K", "<cmd>norm! K<cr>", { desc = "Keywordprg" })

-- Quickfix
-- vim.keymap.set("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
-- vim.keymap.set("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })
vim.keymap.set("n", "[q", vim.cmd.cprev, { desc = "Previous quickfix" })
vim.keymap.set("n", "]q", vim.cmd.cnext, { desc = "Next quickfix" })

-- Diagnostic
local diagnostic_goto = function(next, severity)
	local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
	severity = severity and vim.diagnostic.severity[severity] or nil
	return function()
		go({ severity = severity })
	end
end
-- vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
vim.keymap.set("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
vim.keymap.set("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
vim.keymap.set("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
vim.keymap.set("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
vim.keymap.set("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
vim.keymap.set("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-- Substitute word under cursor
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Rename word (raw)" }) -- for symbols use LSP

-- Add undo break-points
vim.keymap.set("i", ",", ",<c-g>u")
vim.keymap.set("i", ".", ".<c-g>u")
vim.keymap.set("i", ";", ";<c-g>u")

-- Make Ctrl-c behave exactly like Esc
vim.keymap.set("i", "<C-c>", "<Esc>", { desc = "Ctrl-c as Esc" })

-- Easier exit from terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Disable replay last recorded macro, to easy to trigger accidentally
vim.keymap.set("n", "Q", "<nop>")

--

-- Tmux-sessioninzer
vim.keymap.set(
	"n",
	"<C-f>",
	":silent !tmux neww $HOME/.config/tmux/scripts/tmux-sessionizer.sh<CR>",
	{ desc = "Tmux-sessionizer" }
) -- same shortcut in Neovim and Zsh

--

-- NetRW
vim.g.netrw_browse_split = 0 -- always re-use the same window when opening files
vim.g.netrw_banner = 0 -- suppress the banner
vim.g.netrw_winsize = 25 -- initial size of new windows

vim.keymap.set("n", "<leader>oe", vim.cmd.Ex, { desc = "Open NetRW" })

--

-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { desc = "Make file executable", silent = true })
