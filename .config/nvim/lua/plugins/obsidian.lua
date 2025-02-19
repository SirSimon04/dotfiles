return {
  {
    'okuuva/auto-save.nvim',
    ft = 'markdown',
    lazy = true, -- Lazy load Obsidian.nvim
    opts = {},
  },

  {
    'bullets-vim/bullets.vim',
    lazy = true, -- Lazy load Obsidian.nvim
    ft = 'markdown',
  },

  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    lazy = true, -- Lazy load Obsidian.nvim
    ft = { 'markdown' },
    build = function()
      vim.fn['mkdp#util#install']()
    end,
  },

  {
    '3rd/image.nvim',
    build = false, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
    opts = {
      processor = 'magick_cli',
      download_remote_images = false,
      only_render_image_at_cursor = false,
    },
    lazy = true, -- Lazy load
  },

  {
    'epwalsh/obsidian.nvim',
    version = '*', -- recommended, use latest release instead of latest commit
    lazy = true, -- Lazy load Obsidian.nvim
    ft = 'markdown', -- Only load for Markdown files
    cmd = {
      'ObsidianOpen',
      'ObsidianNew',
      'ObsidianQuickSwitch',
      'ObsidianSearch',
      'ObsidianDailies',
      'ObsidianPasteImg',
      'ObsidianTOC',
      'ObsidianToday',
      'ObsidianTomorrow',
      'ObsidianYesterday',
    },
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
      { 'nvim-lua/plenary.nvim', lazy = true }, -- Lazy load dependencies
      { 'nvim-telescope/telescope.nvim', lazy = true },
      { 'nvim-treesitter/nvim-treesitter', lazy = true },
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
    lazy = true, -- Lazy load Typewriter
    cmd = { 'TWEnable', 'TWDisable' },
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
    lazy = true, -- Lazy load Zen Mode
    cmd = { 'ZenMode' },
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
