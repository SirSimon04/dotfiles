return {
  'f-person/git-blame.nvim',
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
}
