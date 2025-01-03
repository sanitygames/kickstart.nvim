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

  -- winsep.nvim の設定
  -- ウィンドウの枠色を変える。
  {
    'nvim-zh/colorful-winsep.nvim',
    event = { 'WinLeave' },
    opts = {
      hi = { bg = '', fg = '#39FFE3' },
    },
    config = true
  },

  -- incline.nvim の設定
  -- 右上のファイル名表示
  {
    'b0o/incline.nvim',
    event = 'VeryLazy',
    config = function()
      local helpers = require 'incline.helpers'
      local devicons = require 'nvim-web-devicons'
      require('incline').setup {
        window = {
          padding = 0,
          margin = { horizontal = 0 },
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
          if filename == '' then
            filename = '[no name]'
          end
          local ft_icon, ft_color = devicons.get_icon_color(filename)
          local modified = vim.bo[props.buf].modified
          return {
            ft_icon and { ' ', ft_icon, ' ', guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or '',
            ' ',
            { filename, gui = modified and 'bold,italic' or 'bold' },
            ' ',
            guibg = '#44406e',
          }
        end,
      }
    end,
  },

  -- treesj の設定
  -- <leader>mm ,mj, msにてブロックの改行をトグルする。
  -- TODO: 一度起動すると、mのみでtoggleするのが正常なのかわからない。
  {
    'wansmer/treesj',
    keys = { '<leader>mm', '<leader>mj', '<leader>ms' },
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = {},
  },

  -- vim-findroot の設定
  -- カレントフォルダを自動で設定する。
  { 'mattn/vim-findroot' },


  -- wildfire.nvim の設定
  -- NOTE: 一旦無効にします。
  -- {
  --   'sustech-data/wildfire.nvim',
  --   dependencies = { 'nvim-treesitter/nvim-treesitter' },
  --   event = { 'bufreadpre', 'bufnewfile' },
  --   config = function()
  --     require('wildfire').setup()
  --   end,
  -- },

  -- barbar.nvim の設定
  -- タブ移動を便利にする。
  -- TODO: 設定途中
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    -- init = function()
    --   vim.g.barbar_auto_setup = true
    -- end,
    opts = {},
    config = function()
      local map = vim.api.nvim_set_keymap
      local opts = { noremap = true, silent = true }
      -- Move to previous/next
      map('n', '≤', '<Cmd>BufferPrevious<CR>', opts)
      map('n', '≥', '<Cmd>BufferNext<CR>', opts)
      -- Re-order to previous/next
      map('n', '¯', '<Cmd>BufferMovePrevious<CR>', opts)
      map('n', '˘', '<Cmd>BufferMoveNext<CR>', opts)

      -- Goto buffer in position
      map('n', '<C-!>', '<Cmd>BufferGoto 1<CR>', opts)
      map('n', '<C-@>', '<Cmd>BufferGoto 2<CR>', opts)
      map('n', '<C-#>', '<Cmd>BufferGoto 3<CR>', opts)
      map('n', '<C-$>', '<Cmd>BufferGoto 4<CR>', opts)
      map('n', '<C-%>', '<Cmd>BufferGoto 5<CR>', opts)
      map('n', '<C-^>', '<Cmd>BufferGoto 6<CR>', opts)
      map('n', '<C-&>', '<Cmd>BufferGoto 7<CR>', opts)
      map('n', '<C-*>', '<Cmd>BufferGoto 8<CR>', opts)
      map('n', '<C-(>', '<Cmd>BufferGoto 9<CR>', opts)
      map('n', '<C-,>', '<Cmd>BufferLast<CR>', opts)

      -- Pin/unpin buffer
      -- map('n', '<M-p>', '<Cmd>BufferPin<CR>', opts)
      -- Goto pinned/unpinned buffer
      -- :BufferGotoPinned
      -- :BufferGotoUnpinned

      -- Close buffer
      map('n', 'ç', '<Cmd>BufferClose<CR>', opts)

      -- Wipeout buffer
      -- :BufferWipeout

      -- Close commands
      -- :BufferCloseAllButCurrent
      -- :BufferCloseAllButPinned
      -- :BufferCloseAllButCurrentOrPinned
      -- :BufferCloseBuffersLeft
      -- :BufferCloseBuffersRight

      -- Magic buffer-picking mode
      map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
      map('n', '<C-s-p>', '<Cmd>BufferPickDelete<CR>', opts)

      -- Sort automatically by...
      map('n', '<leader>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
      map('n', '<leader>bn', '<Cmd>BufferOrderByName<CR>', opts)
      map('n', '<leader>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
      map('n', '<leader>bl', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
      map('n', '<leader>bw', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
    end,
  },
}
