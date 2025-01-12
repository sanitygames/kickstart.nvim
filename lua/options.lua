-- See `:help vim.opt`
-- You can change these options as you wish!
-- For more options, you can see `:help option-list`

-- NOTE: settings for neovide
if vim.g.neovide then
    vim.o.guifont = 'JetBrainsMono Nerd Font Mono:h14'
    vim.g.neovide_remember_window_size = true
    vim.g.neovide_transparency = 0.85
    vim.g.neovide_window_blurred = true
    vim.o.pumblend = 20
    vim.o.winblend = 0
    vim.g.neovide_input_macos_option_key_is_meta = 'only_left'
end

-- LSPデバッグ用
-- vim.lsp.set_log_level("DEBUG")

vim.o.laststatus = 3
vim.o.swapfile = false

-- NOTE: 自動コメントアウトの無効化
vim.cmd([[autocmd BufNewFile,BufRead,BufWinEnter * set formatoptions-=r]])
vim.cmd([[autocmd BufNewFile,BufRead,BufWinEnter * set formatoptions-=o]])


-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true

-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
    vim.opt.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10


vim.api.nvim_create_autocmd("FileType", {
    pattern = 'gdscript',
    callback = function()
        vim.opt_local.tabstop = 4
        vim.opt_local.shiftwidth = 4
        vim.opt_local.expandtab = true
    end,
})
