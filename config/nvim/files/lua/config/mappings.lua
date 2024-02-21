-- `:h lua-guide-mappings`
-- `:h map-modes`


-- Tools:

vim.keymap.set("n", "<leader>fe", vim.cmd.Ex, { desc = "Open netrw" })

vim.keymap.set("n", "<C-f>", ":silent !tmux neww $HOME/.config/tmux/scripts/tmux-sessionizer.sh<CR>", { desc = "tmux-sessionizer" })


-- Cursor position:

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Page down and center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Page up and center" })

vim.keymap.set("n", "n", "nzzzv", { desc = "Next match and center" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Prev match and center" })

vim.keymap.set("n", "J", "mzJ`z", {desc = "Join line without moving cursor position" })


-- Yanking/pasting:

vim.keymap.set("x", "<leader>p", [["_c<Esc>p]], { desc = "Paste without replacing register content" }) -- [["_dP]] was sometimes problematic

vim.keymap.set({"n","v"}, "<leader>y", [["+y]], { desc = "Yank to clipboard" })
vim.keymap.set({"n"}, "<leader>Y", [["+Y]], { desc = "Yank til end of line to clipboard" })

vim.keymap.set({"n","v"}, "<leader>d", [["+d]], { desc = "Delete to clipboard register" })
vim.keymap.set({"n"}, "<leader>D", [["+D]], { desc = "Delete til end of line to clipboard" })


-- Editing:

vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move seleted lines down" })
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv", { desc = "Move selected lines up" })

vim.keymap.set("v", "<", "<gv", { desc = "Increate indentation and re-select" })
vim.keymap.set("v", ">", ">gv", { desc = "Decrease indentation and re-select" })

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Substitute word under cursor" }) -- for symbols use LSP


-- Behaviour:

vim.keymap.set("n", "<C-n>", "<cmd>cnext<CR>zz", { desc = "Next quickfix item and center" })
vim.keymap.set("n", "<C-p>", "<cmd>cprev<CR>zz", { desc = "Previous quickfix item and center" })

vim.keymap.set("i", "<C-c>", "<Esc>", { desc = "Ctrl-c as Esc" }) -- there are a few cases where they don't work the same

vim.keymap.set("n", "Q", "<nop>", { desc = "Disable replay last recorded macro" }) -- to easy to trigger accidentally

vim.keymap.set("n", "<leader>w", "<cmd>set wrap!<CR>", { desc = "Toggle wrap" })

vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true, desc = "Screen line down" }) -- gj only when no counter is provided
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, desc = "Screen line up" }) -- gk only when no counter is provided

--

-- vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>") -- move it to the plugin file

-- vim.keymap.set("n", "<esc>", "<cmd>noh<cr>", { desc = "Clear hlsearch" }) -- now noh is the default

-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { desc = "Make file executable", silent = true })

-- Move to window using the <ctrl> hjkl keys (leave these for harpoon)
-- vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
-- vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
-- vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
-- vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Resize window using <ctrl> arrow keys (not that frequent, use the mouse)
-- vim.keymap.set("n", "<C-Up>", "<cmd>resize +1<cr>", { desc = "Increase window height" })
-- vim.keymap.set("n", "<C-Down>", "<cmd>resize -1<cr>", { desc = "Decrease window height" })
-- vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -1<cr>", { desc = "Decrease window width" })
-- vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +1<cr>", { desc = "Increase window width" })

-- Buffers:
-- vim.keymap.set("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
-- vim.keymap.set("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })

-- Use up/down to move through popupmenus (pum):
-- vim.keymap.set('c', '<down>', function()
--     if vim.fn.pumvisible() == 1 then return '<c-n>' end
--     return '<down>'
-- end, { expr = true })
-- vim.keymap.set('c', '<up>', function()
--     if vim.fn.pumvisible() == 1 then return '<c-p>' end
--     return '<up>'
-- end, { expr = true })

-- Clear search, diff update and redraw:
-- taken from runtime/lua/_editor.lua
-- vim.keymap.set(
--     "n",
--     "<leader>ur",
--     "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
--     { desc = "Redraw / clear hlsearch / diff update" }
-- )

-- Add undo break-points (this one is pretty clever):
-- vim.keymap.set("i", ",", ",<c-g>u")
-- vim.keymap.set("i", ".", ".<c-g>u")
-- vim.keymap.set("i", ";", ";<c-g>u")
-- vim.keymap.set("i", "<CR>", "<CR><c-g>u")

-- Location list:
-- vim.keymap.set("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
-- vim.keymap.set("n", "[l", vim.cmd.lprev, { desc = "Previous location" })
-- vim.keymap.set("n", "]l", vim.cmd.lnext, { desc = "Next location" })

-- Diagnostics:
-- local diagnostic_goto = function(next, severity)
--     local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
--     severity = severity and vim.diagnostic.severity[severity] or nil
--     return function()
--         go({ severity = severity })
--     end
-- end
-- vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
-- vim.keymap.set("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
-- vim.keymap.set("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
-- vim.keymap.set("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
-- vim.keymap.set("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
-- vim.keymap.set("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
-- vim.keymap.set("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

