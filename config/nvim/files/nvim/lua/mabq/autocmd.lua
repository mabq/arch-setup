--  See `:help lua-guide-autocommands`

local function augroup(name)
    return vim.api.nvim_create_augroup('mabq_' .. name, { clear = true })
end

local autocmd = vim.api.nvim_create_autocmd

--

autocmd('TextYankPost', {
    group = augroup 'highlightYank',
    callback = function()
        (vim.hl or vim.highlight).on_yank()
    end,
})

autocmd({ 'BufWritePre' }, {
    group = augroup 'removeTraillingSpace',
    pattern = '*',
    command = [[%s/\s\+$//e]],
})

-- autocmd('BufEnter', {
--     group = mabqGroup,
--     callback = function()
--         if vim.bo.filetype == 'zig' then
--             vim.cmd.colorscheme 'tokyonight-night'
--         else
--             vim.cmd.colorscheme 'rose-pine-moon'
--         end
--     end,
-- })

-- close some filetypes with <q>
vim.api.nvim_create_autocmd('FileType', {
    group = augroup 'close_with_q',
    pattern = {
        'PlenaryTestPopup',
        'checkhealth',
        'dbout',
        'gitsigns-blame',
        'grug-far',
        'help',
        'lspinfo',
        'neotest-output',
        'neotest-output-panel',
        'neotest-summary',
        'notify',
        'qf',
        'snacks_win',
        'spectre_panel',
        'startuptime',
        'tsplayground',
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.schedule(function()
            vim.keymap.set('n', 'q', function()
                vim.cmd 'close'
                pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
            end, {
                buffer = event.buf,
                silent = true,
                desc = 'Quit buffer',
            })
        end)
    end,
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd('BufReadPost', {
    group = augroup 'last_loc',
    callback = function(event)
        local exclude = { 'gitcommit' }
        local buf = event.buf
        if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
            return
        end
        vim.b[buf].lazyvim_last_loc = true
        local mark = vim.api.nvim_buf_get_mark(buf, '"')
        local lcount = vim.api.nvim_buf_line_count(buf)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd('FileType', {
    group = augroup 'wrap_spell',
    pattern = { 'text', 'plaintex', 'typst', 'gitcommit', 'markdown' },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
    end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
    group = augroup 'auto_create_dir',
    callback = function(event)
        if event.match:match '^%w%w+:[\\/][\\/]' then
            return
        end
        local file = vim.uv.fs_realpath(event.match) or event.match
        vim.fn.mkdir(vim.fn.fnamemodify(file, ':p:h'), 'p')
    end,
})
