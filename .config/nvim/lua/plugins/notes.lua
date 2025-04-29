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
      { '<leader>obo', '<cmd>NotesOpenBooks<CR>', desc = 'Open Book' },
      { '<leader>oba', '<cmd>NotesAddNoteToBooks<CR>', desc = 'Add Note to Book' },
      { '<leader>obc', '<cmd>NotesCreateBooks<CR>', desc = 'Create Book' },
      { '<leader>opo', '<cmd>NotesOpenProjects<CR>', desc = 'Open Project' },
      { '<leader>opa', '<cmd>NotesAddNoteToProjects<CR>', desc = 'Add Note to Project' },
      { '<leader>opc', '<cmd>NotesCreateProjects<CR>', desc = 'Create Project' },
      { '<leader>omo', '<cmd>NotesOpenMeeting<CR>', desc = 'Open Meeting Note' },
      { '<leader>omc', '<cmd>NotesCreateMeeting<CR>', desc = 'Create Meeting Note' },
      { '<leader>ovo', '<cmd>NotesOpenVorlesungen<CR>', desc = 'Open Vorlesung' },
      { '<leader>ova', '<cmd>NotesAddNoteToVorlesungen<CR>', desc = 'Add Note to Vorlesung' },
      { '<leader>ovc', '<cmd>NotesCreateVorlesungen<CR>', desc = 'Create Vorlesung' },
    },
    opts = {
      dailies_dir = '~/Documents/Obsidian/obsidian-main/work/Journal/Daily/',
      templates = {
        daily = '~/Documents/Obsidian/obsidian-main/work/templates/daily.md',
      },
      custom_types = {
        {
          name = 'Meeting',
          dir = '~/Documents/Obsidian/obsidian-main/work/Meetingnotes/',
          template = '~/Documents/Obsidian/obsidian-main/work/templates/meeting.md',
          filename = '${date}-${title}',
        },
        {
          name = 'Books',
          dir = '~/Documents/Obsidian/obsidian-main/learning/Books/',
          -- template = '~/Documents/Notes/Templates/project.md',
          filename = '${name}-${title}',
          folder_based = true,
          numbered = true,
        },
        {
          name = 'Projects',
          dir = '~/Documents/Obsidian/obsidian-main/learning/Projekte/',
          -- template = '~/Documents/Notes/Templates/project.md',
          filename = '${name}-${title}',
          folder_based = true,
        },
        {
          name = 'Vorlesungen',
          dir = '~/Documents/Obsidian/obsidian-main/learning/DHBW/6.Semester/',
          -- template = '~/Documents/Notes/Templates/project.md',
          filename = '${name}-${title}',
          folder_based = true,
          numbered = true,
        },
      },
      environments = {
        {
          key = 'PRIVATE',
          dailies_dir = '~/Documents/obsidian-main/private/Journal/Daily/',
          books_dir = '~/Documents/obsidian-main/learning/Books/',
          templates = {
            daily = '~/Documents/obsidian-main/private/Templates/Daily Note Template.md',
          },
        },
      },
    },
  },

  {
    'MeanderingProgrammer/render-markdown.nvim',
    lazy = true,
    ft = 'markdown',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    opts = {
      completions = { lsp = { enabled = true } },
      heading = {
        width = 'block',
        right_pad = 1,
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

  {
    'dfendr/clipboard-image.nvim',
    lazy = true,
    keys = {
      { '<leader>oi', '<cmd>PasteImg<CR>', desc = 'Paste [I]mage from clipboard' },
    },
    opts = {
      default = {
        img_dir = function()
          local file_path = vim.fn.expand '%:p'
          if file_path:match 'learning' then
            return 'learning/dateien'
          elseif file_path:match 'work' then
            return 'work/dateien'
          else
            return 'attachments'
          end
        end,
        img_dir_txt = function()
          local file_path = vim.fn.expand '%:p'
          if file_path:match 'learning' then
            return 'learning/dateien'
          elseif file_path:match 'work' then
            return 'work/dateien'
          else
            return 'attachments'
          end
        end,
      },
    },
  },
}
