return {
  {
    'epwalsh/obsidian.nvim',
    version = '*', -- recommended, use latest release instead of latest commit
    lazy = false,
    ft = 'markdown',
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    --   -- refer to `:h file-pattern` for more examples
    --   'BufReadPre '
    --     .. vim.fn.expand '~'
    --     .. '/Documents/Obsidian/obsidian-main/*.md',
    --   'BufNewFile ' .. vim.fn.expand '~' .. '/Documents/Obsidian/obsidian-main/*.md',
    -- },
    keys = {
      { '<leader>od', '<cmd>ObsidianDailies<cr>', desc = 'Open dailies picker' },
      { '<leader>op', '<cmd>ObsidianPasteImg<cr>', desc = 'Paste image from clipboard' },
      { '<leader>oc', '<cmd>ObsidianTOC<cr>', desc = 'Load table of contents' },
      { '<leader>ot', '<cmd>ObsidianToday<cr>', desc = "Open/create today's note" },
      { '<leader>om', '<cmd>ObsidianTomorrow<cr>', desc = "Open/create tomorrow's note" },
      { '<leader>oy', '<cmd>ObsidianYesterday<cr>', desc = "Open/create yesterday's note" },
      { '<leader>oo', '<cmd>ObsidianOpen<cr>', desc = 'Open note in Obsidian' },
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'nvim-treesitter',
    },
    opts = {
      workspaces = {
        {
          name = 'main',
          path = '~/Documents/Obsidian/obsidian-main',
        },
      },
      attachments = {
        img_folder = 'attachments',
      },
      daily_notes = {
        folder = 'work/Journal/Daily',
      },
    },
    completion = {
      nvim_cmp = false,
      -- Enables completion using blink.cmp
      blink = true,
      -- Trigger completion at 2 chars.
      min_chars = 1,
    },
  },
  {
    'joshuadanpeterson/typewriter',
    config = function()
      require('typewriter').setup {
        enable_with_zen_mode = true,
        keep_cursor_position = true,
        enable_notifications = false,
        enable_horizontal_scroll = false,
      }
    end,
    opts = {},
  },
  {
    'folke/zen-mode.nvim',
    opts = {
      on_open = function()
        vim.cmd 'TWEnable'
      end,
      on_close = function()
        vim.cmd 'TWDisable'
      end,
    },
  },
}
