--You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {

    -- skkeletonの設定
    {
        'vim-skk/skkeleton',
        dependencies = { 'vim-denops/denops.vim' },
        keys = {
            { '<C-j>', '<Plug>(skkeleton-enable)', mode = { 'i' }, noremap = true, desc = 'skkeleton' },
        },
        config = function()
            vim.fn['skkeleton#config'] {
                globalDictionaries = { '~/.skk/SKK-JISYO.L' },
                eggLikeNewline = true,
            }
        end,
    },

    -- dial.nvimの設定
    -- TODO: g<C-a>, g<C-x> visualモード時の挙動がちょっとおかしい
    {
        'monaqa/dial.nvim',
        keys = {
            { '<C-a>',  function() require('dial.map').manipulate('increment', 'normal') end,  mode = 'n', desc = 'increment(dial.nvim)' },
            { '<C-x>',  function() require('dial.map').manipulate('decrement', 'normal') end,  mode = 'n', desc = 'decrement(dial.nvim)' },
            { 'g<C-a>', function() require('dial.map').manipulate('increment', 'gnormal') end, mode = 'n', desc = 'g_increment(dial.nvim)' },
            { 'g<C-x>', function() require('dial.map').manipulate('decrement', 'gnormal') end, mode = 'n', desc = 'g_decrement(dial.nvim)' },
            { '<C-a>',  function() require('dial.map').manipulate('increment', 'visual') end,  mode = 'v', desc = 'increment(dial.nvim)' },
            { '<C-x>',  function() require('dial.map').manipulate('decrement', 'visual') end,  mode = 'v', desc = 'decrement(dial.nvim)' },
            { 'g<C-a>', function() require('dial.map').manipulate('increment', 'gvisual') end, mode = 'v', desc = 'g_increment(dial.nvim)' },
            { 'g<C-x>', function() require('dial.map').manipulate('decrement', 'gvisual') end, mode = 'v', desc = 'g_decrement(dial.nvim)' },
        },

        config = function()
            local augend = require 'dial.augend'
            require('dial.config').augends:register_group {
                default = {
                    augend.integer.alias.decimal,
                    augend.integer.alias.hex,
                    augend.date.alias['%Y/%m/%d'],
                    augend.constant.alias.bool,
                    require('dial.augend').decimal_fraction.new {
                        decimal_places = 2,
                        signed = false,
                        increment = 0.01,
                    },
                },
            }
        end,
    },

    -- treesj の設定
    -- <leader>mm ,mj, msにてブロックの改行をトグルする。
    {
        'wansmer/treesj',
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        keys = {
            { '<leader>mm', '<cmd>lua require("treesj").toggle()<CR>', desc = 'Split or Join code block with autodetect' },
            { '<leader>mj', '<cmd>lua require("treesj").join()<CR>',   desc = 'Join code block' },
            { '<leader>ms', '<cmd>lua require("treesj").split()<CR>',  desc = 'Split code block' },
        },
        opts = {
            max_join_length = 200,
            use_default_keymaps = false,
        },
    },

    -- vim-findroot の設定
    -- カレントフォルダを自動で設定する。
    { 'mattn/vim-findroot' },
    {
        'ahmedkhalf/project.nvim',
        opt = {},
    },


    -- vim-sleuth の設定
    -- 自動でtabstopとshiftwidthを設定する。
    'pope/vim-sleuth',

    -- nvim-surround の設定
    {
        'kylechui/nvim-surround',
        event = 'VeryLazy',
        config = true,
    },
    -- 'tpope/vim-surround',
    -- 'machakann/vim-sandwich',


}
