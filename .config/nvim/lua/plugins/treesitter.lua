return { -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  lazy = true,
  event = 'BufRead',
  build = ':TSUpdate',
  dependencies = {
    -- 'nvim-treesitter/nvim-treesitter-context',
  },
  config = function()
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

    require('nvim-treesitter.configs').setup {
      ensure_installed = { 'bash', 'c', 'html', 'lua', 'markdown', 'vim', 'vimdoc', 'dart', 'javascript', 'latex' },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
      playground = { enable = true },
    }

    local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
    parser_config.cds = {
      install_info = {
        -- local path or git repo
        -- url = '/path/to/tree-sitter-cds',
        url = 'https://github.com/cap-js-community/tree-sitter-cds.git',
        files = { 'src/parser.c', 'src/scanner.c' },
        branch = 'main',
        generate_requires_npm = false,
        requires_generate_from_grammar = false,
      },
      filetype = 'cds',
      -- additional filetypes that use this parser
      used_by = { 'cdl', 'hdbcds' },
    }
    -- There are additional nvim-treesitter modules that you can use to interact
    -- with nvim-treesitter. You should go explore a few and see what interests you:
    --
    --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  end,
}
