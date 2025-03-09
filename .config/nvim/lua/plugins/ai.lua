return {
  {
    'David-Kunz/gen.nvim',

    config = function()
      require('gen').setup {
        model = 'llama3.1', -- The default model to use.
        quit_map = 'q', -- set keymap to close the response window
        display_mode = 'split',
        show_prompt = true, -- Shows the prompt submitted to Ollama.
        show_model = true, -- Displays which model you are using at the beginning of your chat session.
      }

      require('gen').prompts['Generate_test'] = {
        prompt = 'Write a funtion that makes the following test pass. It should be in $filetype. /n$text',
        model = 'codellama',
      }
    end,
  },
  {
    'github/copilot.vim',
    config = function()
      vim.keymap.set('i', '<C-x>', 'copilot#Accept("\\<CR>")', {
        expr = true,
        replace_keycodes = false,
      })
      vim.g.copilot_no_tab_map = true
    end,
  },
  {
    {
      'CopilotC-Nvim/CopilotChat.nvim',
      dependencies = {
        { 'github/copilot.vim' }, -- or zbirenbaum/copilot.lua
        { 'nvim-lua/plenary.nvim', branch = 'master' }, -- for curl, log and async functions
      },
      build = 'make tiktoken', -- Only on MacOS or Linux
      opts = {},
      -- See Commands section for default commands if you want to lazy load on them
    },
  },
}
