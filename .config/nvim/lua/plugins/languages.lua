return {
  {
    'heavenshell/vim-jsdoc',
    ft = { 'javascript', 'javascript.jsx', 'typescript' },
    run = 'make install',
  },
  {
    'kaarmu/typst.vim',
    ft = 'typst',
    lazy = false,
  },
  {
    'christoomey/vim-tmux-navigator',
  },
  {
    'jkeresman01/tmux-switch.nvim',
    -- 'SirSimon04/tmux-switch.nvim2',
    -- dir = '~/Documents/Programmieren/temp/tmux-switch.nvim2/',
    lazy = true,
    keys = {
      {
        '<leader>st',
        '<cmd>TmuxSwitch<cr>',
        { desc = 'Search [t]mux session' },
      },
    },
    dependencies = {
      'MunifTanjim/nui.nvim',
    },
    opts = {
      not_use_telescope = true,
      sort_by_recent_use = true,
    },
  },
}
