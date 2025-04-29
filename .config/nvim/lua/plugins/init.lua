return {
  { import = 'plugins.ui' },
  { import = 'plugins.lsp' },
  { import = 'plugins.treesitter' },
  -- { import = 'plugins.telescope' },
  { import = 'plugins.git' },
  { import = 'plugins.editing' },
  { import = 'plugins.mini' },
  { import = 'plugins.debug' },
  { import = 'plugins.ai' },
  { import = 'plugins.languages' },
  { import = 'plugins.test' },
  { import = 'plugins.navigation' },
  { import = 'plugins.notes' },
  {
    'jsongerber/thanks.nvim',
    lazy = true,
    cmd = { 'ThanksAll' },
    config = function()
      require('thanks').setup {
        plugin_manager = 'lazy',
      }
    end,
  },
  ui = {
    -- If you have a Nerd Font, set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
}
