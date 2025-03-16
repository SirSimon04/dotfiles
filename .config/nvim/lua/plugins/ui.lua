return {
  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VeryLazy', -- Sets the loading event to 'VimEnter'
    config = function() -- This is the function that runs, AFTER loading
      require('which-key').setup()

      -- Document existing key chains
      require('which-key').add {
        { '<leader>a', group = '[A]I' },
        { '<leader>a_', hidden = true },
        { '<leader>c', group = '[C]ode' },
        { '<leader>c_', hidden = true },
        { '<leader>d', group = '[D]ebug' },
        { '<leader>d_', hidden = true },
        { '<leader>g', group = '[G]it' },
        { '<leader>g_', hidden = true },
        { '<leader>h', group = '[H]arpoon' },
        { '<leader>h_', hidden = true },
        { '<leader>hc', group = '[C]lear' },
        { '<leader>hc_', hidden = true },
        { '<leader>r', group = '[R]ename' },
        { '<leader>r_', hidden = true },
        { '<leader>s', group = '[S]earch' },
        { '<leader>s_', hidden = true },
        { '<leader>t', group = '[T]est' },
        { '<leader>t_', hidden = true },
        { '<leader>w', group = '[W]orkspace' },
        { '<leader>w_', hidden = true },
        { '<leader>ts', group = '[S]ummary' },
        { '<leader>ts_', hidden = true },
        { '<leader>tp', group = 'Output [P]anel' },
        { '<leader>tp_', hidden = true },
        { '<leader>o', group = 'N[o]tes' },
        { '<leader>o_', hidden = true },
        { '<leader>ob', group = '[B]ooks' },
        { '<leader>ob_', hidden = true },
        { '<leader>op', group = '[P]rojects' },
        { '<leader>op_', hidden = true },
        { '<leader>om', group = '[M]eetings' },
        { '<leader>om_', hidden = true },
        { '<leader>u', group = 'Toggle Groups' },
        { '<leader>u_', hidden = true },
        { '<leader>q', group = 'Diagnostics' },
        { '<leader>q_', hidden = true },
      }
    end,
  },
  { 'folke/todo-comments.nvim', event = { 'BufReadPre', 'BufNewFile' }, dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
  { -- You can easily change to a different colorscheme.
    'catppuccin/nvim',
    priority = 1000, -- make sure to load this before all the other start plugins
    init = function()
      vim.cmd.colorscheme 'catppuccin-frappe'
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    lazy = true,
    event = 'VeryLazy',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        options = {
          theme = 'catppuccin',
        },
        sections = {
          lualine_c = {
            {
              'filename',
              file_status = true,
              path = 1,
            },
          },
        },
      }
    end,
  },
  {
    'Aasim-A/scrollEOF.nvim',
    event = { 'CursorMoved', 'WinScrolled' },
    opts = {},
  },
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
      'MunifTanjim/nui.nvim',
      -- OPTIONAL: The next dependency adds the messages from noice
      -- 'rcarriga/nvim-notify',
    },
    opts = {
      lsp = {
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true,
        },
      },
      presets = {
        lsp_doc_border = true,
      },
      notify = {
        enabled = false,
      },
      -- messages = {
      --   enabled = false,
      -- },
      routes = {
        {
          filter = {
            event = 'msg_show',
            kind = '',
          },
        },
      },
    },
  },
  {
    'nvzone/typr',
    dependencies = 'nvzone/volt',
    opts = {},
    cmd = { 'Typr', 'TyprStats' },
  },
}
