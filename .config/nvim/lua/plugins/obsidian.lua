return {
  {
    -- dir = '/Users/simon/Documents/Programmieren/notes.nvim',
    'SirSimon04/notes.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    lazy = true,
    keys = {
      { '<leader>od', '<cmd>NotesOpenDailies<CR>', desc = 'Open Dailies' },
      { '<leader>oy', '<cmd>NotesOpenYesterdayNote<CR>', desc = 'Open Yesterday Note' },
      { '<leader>ot', '<cmd>NotesOpenTodayNote<CR>', desc = 'Open Today Note' },
      { '<leader>oz', '<cmd>NotesOpenTomorrowNote<CR>', desc = 'Open Tomorrow Note' },
      { '<leader>obo', '<cmd>NotesOpenBook<CR>', desc = 'Open Book' },
      { '<leader>oba', '<cmd>NotesAddNoteToBook<CR>', desc = 'Add Note to Book' },
      { '<leader>obc', '<cmd>NotesCreateBook<CR>', desc = 'Create Book' },
      { '<leader>omo', '<cmd>NotesOpenMeeting<CR>', desc = 'Open Meeting Note' },
      { '<leader>omc', '<cmd>NotesCreateMeeting<CR>', desc = 'Create Meeting Note' },
    },
    opts = {
      books_dir = '~/Documents/Obsidian/obsidian-main/learning/Books/',
      dailies_dir = '~/Documents/Obsidian/obsidian-main/work/Journal/Daily/',
      -- dailies_dir = '~/Documents/Obsidian/test-vault-plugin/Dailynotes/',
      -- books_dir = '~/Documents/Obsidian/test-vault-plugin/Books/',
      templates = {
        daily = '~/Documents/Obsidian/obsidian-main/work/templates/daily.md',
        -- book = '~/Documents/Obsidian/test-vault-plugin/templates/book.md',
      },
      custom_types = {
        {
          name = 'Meeting',
          dir = '~/Documents/Obsidian/obsidian-main/work/Meetingnotes/',
          template = '~/Documents/Obsidian/obsidian-main/work/templates/meeting.md',
          filename = '${date}-${title}',
        },
      },
      environments = {
        {
          key = 'PRIVATE',
          dailies_dir = '~/Documents/Obsidian/obsidian-main/work/Journal/Daily/',
          templates = {
            daily = '~/Documents/Obsidian/test-vault-plugin/templates/private_daily.md',
          },
        },
      },
    },
  },

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
    'epwalsh/obsidian.nvim',
    version = '*', -- recommended, use latest release instead of latest commit
    lazy = true, -- Lazy load Obsidian.nvim
    ft = 'markdown', -- Only load for Markdown files
    cmd = {
      'ObsidianOpen',
      'ObsidianNew',
      'ObsidianQuickSwitch',
      'ObsidianSearch',
      'ObsidianPasteImg',
    },
    keys = {
      { '<leader>op', '<cmd>ObsidianPasteImg<cr>', desc = 'Paste image from clipboard' },
      { '<leader>oo', '<cmd>ObsidianOpen<cr>', desc = 'Open note in Obsidian' },
    },
    dependencies = {
      { 'nvim-lua/plenary.nvim', lazy = true }, -- Lazy load dependencies
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
    },
    completion = {
      nvim_cmp = false,
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

  {
    'josephburgess/nvumi',
    dependencies = { 'folke/snacks.nvim' },
    lazy = true, -- Lazy load
    cmd = { 'Nvumi' },
    opts = {
      virtual_text = 'newline', -- or "inline"
      prefix = ' 🚀 ', -- prefix shown before the output
      date_format = 'iso', -- or: "uk", "us", "long"
      keys = {
        run = '<CR>', -- run/refresh calculations
        reset = 'R', -- reset buffer
        yank = '<leader>y', -- yank output of current line
        yank_all = '<leader>Y', -- yank all outputs
      },
      -- see below for more on custom conversions/functions
      custom_conversions = {},
      custom_functions = {},
    },
  },
}
