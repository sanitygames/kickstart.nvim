-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {

  -- skkeletonの設定
  {
    'vim-skk/skkeleton',
    dependencies = { 'vim-denops/denops.vim' },
    keys = {
      { '<C-j>', '<Plug>(skkeleton-enable)', mode = { 'i' }, { noremap = true } },
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
      { '<C-a>',  function() require('dial.map').manipulate('increment', 'normal') end,  mode = 'n' },
      { '<C-x>',  function() require('dial.map').manipulate('decrement', 'normal') end,  mode = 'n' },
      { 'g<C-a>', function() require('dial.map').manipulate('increment', 'gnormal') end, mode = 'n' },
      { 'g<C-x>', function() require('dial.map').manipulate('decrement', 'gnormal') end, mode = 'n' },
      { '<C-a>',  function() require('dial.map').manipulate('increment', 'visual') end,  mode = 'v' },
      { '<C-x>',  function() require('dial.map').manipulate('decrement', 'visual') end,  mode = 'v' },
      { 'g<C-a>', function() require('dial.map').manipulate('increment', 'gvisual') end, mode = 'v' },
      { 'g<C-x>', function() require('dial.map').manipulate('decrement', 'gvisual') end, mode = 'v' },
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
}
