return {
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      {
        'antoinemadec/FixCursorHold.nvim',
        lazy = true, -- Only load when required
      },
      {
        'nvim-treesitter/nvim-treesitter',
        lazy = true, -- Treesitter should not load immediately
      },
      {
        'nvim-neotest/neotest-jest',
        lazy = true, -- Load when needed
      },
    },
    cmd = { 'Neotest', 'Neotest run', 'Neotest summary' }, -- Lazy load on test commands

    config = function()
      require('neotest').setup {
        adapters = {
          require 'neotest-jest' {
            jestCommand = 'npm test --',
            jestConfigFile = 'custom.jest.config.ts',
            env = { CI = true },
            cwd = function(path)
              return vim.fn.getcwd()
            end,
          },
        },
      }
    end,
  },
}
