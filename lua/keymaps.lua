-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

local function map(mode, lhs, rhs, opts)
    opts = opts or {}
    local default_opts = { noremap = true, silent = true }
    setmetatable(opts, { __index = default_opts })
    vim.keymap.set(mode, lhs, rhs, opts)
end


-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })


-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

map('n', '<leader>tq', ':tabc<CR>', { desc = 'tab close' })
map('i', 'jj', '<ESC>', { noremap = true, silent = true })
map('i', '<C-;>', '<C-o>o', { noremap = true, silent = true })
map('i', '<C-e>', '<C-o>$', { noremap = true, silent = true })
map('i', '<C-h>', '<BS>', { noremap = true, silent = true })
-- <C-L>で、インサートモードでカーソルを行末に移動
map('i', '<C-l>', '<C-o>A', { desc = "Move Cursor at End" })


-- <C-;>で数字を検索
map({ 'n' }, '<C-;>', '/\\v(^|[^A-Za-z])(-?\\d+(\\.\\d+)?([eE][-+]?\\d+)?)([^A-Za-z]|$)<CR>',
    { noremap = true, silent = true, desc = 'Find variable' })

-- <Leader><Leader>mで、メモフォルダをTelescopeで開く
map('n', '<leader><leader>m',
    '<cmd>lua require("telescope.builtin").find_files({cwd = "~/.config/nvim/memo/", hidden = true })<CR>',
    { desc = 'Show memo' })


-- <C-b>でSuperSwap
map('n', '<C-b>', function()
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
end, { desc = "Super Char Swap" })

-- <Tab><S-Tab>でバッファ移動
map('n', '<tab>', '<cmd>BufferNext<CR>', { desc = "Move focus to the next buffer" })
map('n', '<S-tab>', '<cmd>BufferPrevious<CR>', { desc = "Move focus to the next buffer" })

-- <C-s>でセーブ
map({ 'n', 'i' }, '<C-s>', '<cmd>w<CR>', { desc = "Save" })

-- コマンドウィンドウで<C-P><C-N>で上下
map('c', '<C-p>', '<Up>')
map('c', '<C-n>', '<Down>')

-- Meta+o, iで空行を追加
map('n', '<M-o>', '<cmd>put _<CR>', { desc = "Insert Blank line" })
map('n', '<M-i>', '<cmd>put! _<CR>', { desc = "Insert Blank line Pre" })
