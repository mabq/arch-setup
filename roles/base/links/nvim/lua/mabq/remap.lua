-- Notes:
--   info: https://neovim.io/doc/user/lua-guide.html#lua-guide-mappings
--   mapleader is defined in options since it must be set before calling lazy.

-- netrw
vim.keymap.set("n", "<leader>fe", vim.cmd.Ex)

-- tmux-sessionizer
vim.keymap.set("n", "<C-f>", ":silent !tmux neww $HOME/.config/tmux/tmux-sessionizer.sh<CR>")

-- remove search highlight
vim.keymap.set("n", "<ESC>", ":nohlsearch<CR>")

-- allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
--   http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
vim.keymap.set({ "n", "v" }, "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
vim.keymap.set({ "n", "v" }, "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })
vim.keymap.set({ "n", "v" }, "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
vim.keymap.set({ "n", "v" }, "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })

-- append next line without moving the cursor
vim.keymap.set("n", "J", "mzJ`z")

-- keep search terms in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- copy and delete to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["+d]])

-- paste without losing the content of the register
vim.keymap.set("x", "<leader>p", [["_dP]])

-- move lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- change all occurrences
--   literal substitution in the current buffer, use lsp to rename symbols across files
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- quickfix navigation
vim.keymap.set("n", "<C-Up>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-Down>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- make Ctrl-c and Esc behave exactly the same
vim.keymap.set("i", "<C-c>", "<Esc>")

-- make file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- disable capital Q
vim.keymap.set("n", "Q", "<nop>")

