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
  {
    'monaqa/dial.nvim',
    keys = {
      { '<C-a>',  function() require('dial.map').manipulate('increment', 'normal') end },
      { '<C-x>',  function() require('dial.map').manipulate('decrement', 'normal') end },
      { 'g<C-a>', function() require('dial.map').manipulate('increment', 'gnormal') end },
      { 'g<C-x>', function() require('dial.map').manipulate('decrement', 'gnormal') end },
      { '<C-a>',  function() require('dial.map').manipulate('increment', 'normal') end,  'v' },
      { '<C-x>',  function() require('dial.map').manipulate('decrement', 'normal') end,  'v' },
      { 'g<C-a>', function() require('dial.map').manipulate('increment', 'gnormal') end, 'v' },
      { 'g<C-x>', function() require('dial.map').manipulate('decrement', 'gnormal') end, 'v' },
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
