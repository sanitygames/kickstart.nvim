return {


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

  -- hop.nvim の設定
  -- jumpmotionみたいなの
  {
    'phaazon/hop.nvim',
    branch = 'v2',
    opts = {
      multi_windows = false,
    },
    keys = {
      { '<leader>j', '<cmd>HopChar1<CR>',     desc = 'HopChar' },
      { '<leader>l', '<cmd>HopLineStart<CR>', desc = 'HopLine' },
      { '<leader>k', '<cmd>HopWord<CR>',      desc = 'HopWord' },
    },
  },

  {
    'shellRaining/hlchunk.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      chunk = {
        enable = true,
        style = {
          { fg = '#FF00DD' },
          { fg = '#f35336' },
        },
      },
      indent = {
        enable = false,
        chars = {
          '│',
        },
        style = {
          '#990000',
          '#990900',
          '#999900',
          '#009900',
          '#009999',
          '#000099',
          '#090099',
        },
      },
      blank = {
        enable = true,
        chars = {
          ' ',
          '․',
          '⁚',
          '⁖',
          '⁘',
          '⁙',
        },
      },
    },
  },

  -- TODO: カッコを色付きで表示する
  {
    'HiPhish/rainbow-delimiters.nvim',
    config = function()
      local rainbow_delimiters = require 'rainbow-delimiters'
      vim.g.rainbow_delimiters = {
        strategy = {
          [''] = rainbow_delimiters.strategy['global'],
          vim = rainbow_delimiters.strategy['local'],
        },
        query = {
          [''] = 'rainbow-delimiters',
          lua = 'rainbow-blocks',
        },
        priority = {
          [''] = 110,
          lua = 210,
        },
        highlight = {
          'RainbowDelimiterRed',
          'RainbowDelimiterYellow',
          'RainbowDelimiterBlue',
          'RainbowDelimiterOrange',
          'RainbowDelimiterGreen',
          'RainbowDelimiterViolet',
          'RainbowDelimiterCyan',
        },
      }
    end,
  },
}
