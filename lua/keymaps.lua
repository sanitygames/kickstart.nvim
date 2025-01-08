-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })


-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<leader>tq', ':tabc<CR>', { desc = 'tab close' })
vim.keymap.set('i', 'jj', '<ESC>', { noremap = true, silent = true })
vim.keymap.set('i', '<C-;>', '<C-o>o', { noremap = true, silent = true })
vim.keymap.set('i', '<C-e>', '<C-o>$', { noremap = true, silent = true })
vim.keymap.set('i', '<C-h>', '<BS>', { noremap = true, silent = true })

-- vim.keymap.set({ 'n' }, '<C-;>', '/\\d\\+<CR>', { noremap = true, silent = true, desc = 'Find variable' })
vim.keymap.set({ 'n' }, '<C-;>', '/\\v(^|[^A-Za-z])(-?\\d+(\\.\\d+)?([eE][-+]?\\d+)?)([^A-Za-z]|$)<CR>',
    { noremap = true, silent = true, desc = 'Find variable' })

vim.keymap.set('n', '<leader><leader>m',
    '<cmd>lua require("telescope.builtin").find_files({cwd = "~/.config/nvim/memo/", hidden = true })<CR>',
    { desc = 'Show memo' })


vim.keymap.set('n', '<C-s>', function()
    local count = vim.v.count
    count = count > 0 and count or 1
    for _ = 1, count do
        vim.cmd('normal! h')
    end
    vim.cmd('normal! X')
    vim.cmd('normal! p')
    for _ = 1, count do
        vim.cmd('normal! l')
    end
end)

vim.keymap.set('n', '<tab>', '<cmd>BufferNext<CR>', { desc = "Move focus to the next buffer" })
vim.keymap.set('n', '<S-tab>', '<cmd>BufferPrevious<CR>', { desc = "Move focus to the next buffer" })
