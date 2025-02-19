return {
  {
    -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    lazy = true,
    event = 'BufReadPre',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },
  {
    'f-person/git-blame.nvim',
    lazy = true,
    event = 'BufReadPre',
    config = function()
      require('gitblame').setup {
        enabled = true,
        date_format = '%r',
      }
      vim.keymap.set('n', '<leader>go', '<cmd>:GitBlameOpenCommitURL<cr>', { desc = '[O]pen commit in GitHub' })
      vim.keymap.set('n', '<leader>gc', '<cmd>:GitBlameCopySHA<cr>', { desc = '[C]opy SHA of commit under cursor' })
      vim.keymap.set('n', '<leader>gf', '<cmd>:GitBlameOpenFileURL<cr>', { desc = 'Open current [F]ile in GitHub' })
      vim.keymap.set('n', '<leader>gu', '<cmd>:GitBlameCopyFileURL<cr>', { desc = 'Copy current file [U]RL' })
    end,
  },
  {
    'kdheepak/lazygit.nvim',
    lazy = true,
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    -- optional for floating window border decoration
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
  },
}
