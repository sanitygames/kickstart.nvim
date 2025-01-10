return {
  {
    'anuvyklack/help-vsplit.nvim',
    opts = {
      always = true,
    },
  },
  {
    'ysmb-wtsg/in-and-out.nvim',
    keys = {
      { "<C-k>", function() require('in-and-out').in_and_out() end, mode = "i" }
    },
    opts = {},
  },
  {
    'umblevable/quick-scope',
    config = function()
      vim.g.qs_highlight_on_keys = { 'f', 'F', 't', 'T' }
      vim.api.nvim_set_hl(0, "QuickScopePrimary",
        { fg = '#f4b6d7', underline = true, ctermfg = 155, cterm = { underline = true } })
      vim.api.nvim_set_hl(0, "QuickScopeSecondary",
        { fg = '#fff800', underline = true, ctermfg = 81, cterm = { underline = true } })
    end,
  },

  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'echasnovski/mini.nvim',
    },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {

    },
  },

  -- terminal
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = {
      size = 100,
      insert_mappings = false,
      open_mapping = [[<C-t>]],
      hide_numbers = true,
      shade_filetypes = {},
      shede_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      presist_size = true,
      direction = 'float',
      close_on_exit = true,
    },
  },

  -- 検索時の結果を近くに表示する
  {
    'kevinhwang91/nvim-hlslens',
    config = function()
      require('hlslens').setup()
      local kopts = { noremap = true, silent = true }
    end,

  },

  -- commandとかmessageをキレイに表示
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
      'MunifTanjim/nui.nvim', -- UI library
      'rcarriga/nvim-notify', -- 右上のウィンドウ
    },

    config = function()
      local noice = require("noice")
      local function myMiniView(pattern, kind)
        kind = kind or ""
        return {
          view = 'mini',
          filter = {
            event = "msg_show",
            kind = kind,
            find = pattern,
          },
        }
      end

      noice.setup({
        messages = {
          -- enabled = false,
          view_search = "mini",
        },
        routes = {
          {
            view = "notify",
            filter = { event = "msg_showmode" },
          },
          {
            filter = {
              event = "notify",
              warning = true,
              find = "failed to run generator.*is not exectuable",
            },
            opts = { skip = true },
          },
          myMiniView("Already at .* change"),
          myMiniView("written"),
          myMiniView("yanked"),
          myMiniView("more lines?"),
          myMiniView("fewer lines?"),
          myMiniView("fewer lines?", "lua_error"),
          myMiniView("change: before"),
          myMiniView("change: after"),
          myMiniView("line less"),
          myMiniView("lines indented"),
          myMiniView("No Lines in buffer"),
          myMiniView("search hit .* continuing at", "wmsg"),
          myMiniView("E486: Pattern not found", "emsg"),
        }
      })
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
      map('n', '<C-S-h>', '<Cmd>BufferPrevious<CR>', opts)

      map('n', '<C-S-L>', '<Cmd>BufferNext<CR>', opts)
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
      map('n', '<leader>x', '<Cmd>BufferClose<CR>', opts)

      -- Wipeout buffer
      -- :BufferWipeout

      -- Close commands
      -- :BufferCloseAllButPinned
      -- :BufferCloseAllButCurrentOrPinned
      map('n', '<leader>bca', '<Cmd>BufferCloseAllButCurrent<CR>', opts)
      map('n', '<leader>bcl', '<Cmd>BufferCloseBuffersLeft<CR>', opts)
      map('n', '<leader>bcr', '<Cmd>BufferCloseBuffersRight<CR>', opts)

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
      { '<leader>;', '<cmd>HopPattern<CR>' }
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
      line_num = {
        style = "#806d9c",
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

  -- which-key.nvim の設定
  {
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    opts = {
      -- delay between pressing a key and opening which-key (milliseconds)
      -- this setting is independent of vim.opt.timeoutlen
      delay = 0,
      icons = {
        -- set icon mappings to true if you have a Nerd Font
        mappings = vim.g.have_nerd_font,
        -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
        -- default which-key.nvim defined Nerd Font icons, otherwise define a string table
        keys = vim.g.have_nerd_font and {} or {
          Up = '<Up> ',
          Down = '<Down> ',
          Left = '<Left> ',
          Right = '<Right> ',
          C = '<C-…> ',
          M = '<M-…> ',
          D = '<D-…> ',
          S = '<S-…> ',
          CR = '<CR> ',
          Esc = '<Esc> ',
          ScrollWheelDown = '<ScrollWheelDown> ',
          ScrollWheelUp = '<ScrollWheelUp> ',
          NL = '<NL> ',
          BS = '<BS> ',
          Space = '<Space> ',
          Tab = '<Tab> ',
          F1 = '<F1>',
          F2 = '<F2>',
          F3 = '<F3>',
          F4 = '<F4>',
          F5 = '<F5>',
          F6 = '<F6>',
          F7 = '<F7>',
          F8 = '<F8>',
          F9 = '<F9>',
          F10 = '<F10>',
          F11 = '<F11>',
          F12 = '<F12>',
        },
      },

      -- Document existing key chains
      spec = {
        { '<leader>c',  group = '[C]ode',         mode = { 'n', 'x' } },
        { '<leader>d',  group = '[D]ocument' },
        { '<leader>r',  group = '[R]ename' },
        { '<leader>s',  group = '[S]earch' },
        { '<leader>w',  group = '[W]orkspace' },
        { '<leader>t',  group = '[T]oggle' },
        { '<leader>g',  group = '[G]it',          mode = { 'n' } },
        { '<leader>b',  group = '[B]uffer',       mode = { 'n' } },
        { '<leader>bc', group = 'Buffer [C]lose', mode = { 'n' } },
      },
    },
  },
}
