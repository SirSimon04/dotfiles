return {
  {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('oil').setup {
        view_options = {
          show_hidden = true,
        },
      }

      vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
    end,
  },
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require 'harpoon'

      -- REQUIRED
      harpoon:setup()
      -- REQUIRED

      vim.keymap.set('n', '<leader>ha', function()
        harpoon:list():append()
      end, { desc = '[A]ppend' })
      vim.keymap.set('n', '<leader>hp', function()
        harpoon:list():prepend()
      end, { desc = '[P]repend' })
      vim.keymap.set('n', '<leader>hd', function()
        harpoon:list():remove()
      end, { desc = '[D]elete current buffer' })
      vim.keymap.set('n', '<leader>hca', function()
        harpoon:list():clear()
      end, { desc = 'Clear [A]ll buffers' })
      vim.keymap.set('n', '<C-e>', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end)

      vim.keymap.set('n', 'mf', function()
        harpoon:list():select(1)
      end, { desc = 'Harpoon Index 1' })
      vim.keymap.set('n', 'md', function()
        harpoon:list():select(2)
      end, { desc = 'Harpoon Index 2' })
      vim.keymap.set('n', 'ms', function()
        harpoon:list():select(3)
      end, { desc = 'Harpoon Index 3' })
      vim.keymap.set('n', 'ma', function()
        harpoon:list():select(4)
      end, { desc = 'Harpoon Index 4' })

      -- Toggle previous & next buffers stored within Harpoon list
      -- vim.keymap.set('n', '<C-S-P>', function()
      --   harpoon:list():prev()
      -- end)
      -- vim.keymap.set('n', '<C-S-N>', function()
      --   harpoon:list():next()
      -- end)
    end,
  },
}
