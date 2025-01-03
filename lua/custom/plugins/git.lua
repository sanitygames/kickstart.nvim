return {

    -- lazygit の設定
    {
        'kdheepak/lazygit.nvim',
        lazy = true,
        cmd = {
            'LazyGit',
            'LazyGitConfig',
            'LazyGitCurrentFile',
            'LazyGitFilter',
            'LazyGitFilterCurrentFile',
        },
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        keys = {
            { '<leader>gg', '<cmd>LazyGit<CR>', desc = 'LazyGit' },
        },
    },

    {
        'sindrets/diffview.nvim',
        config = function()
            local map = vim.api.nvim_set_keymap
            local opts = { noremap = true, silent = true }
            map('n', '<leader>gd', '<cmd>DiffviewOpen HEAD~1<CR>', opts)
            map('n', '<leader>gh', '<cmd>DiffviewFileHistory %<CR>', opts)
            require('diffview').setup()
        end,
    },

    -- Here is a more advanced example where we pass configuration
    -- options to `gitsigns.nvim`. This is equivalent to the following Lua:
    --    require('gitsigns').setup({ ... })
    --
    -- See `:help gitsigns` to understand what the configuration keys do
    { -- Adds git related signs to the gutter, as well as utilities for managing changes
        'lewis6991/gitsigns.nvim',
        opts = {
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
            },
        },
    },

}
