local js_based_languages = { 'typescript', 'javascript', 'typescriptreact' }

return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'nvim-neotest/nvim-nio',
      -- Creates a beautiful debugger UI
      'rcarriga/nvim-dap-ui',

      -- Installs the debug adapters for you
      'williamboman/mason.nvim',
      'jay-babu/mason-nvim-dap.nvim',

      'nvim-lua/plenary.nvim',

      -- Add your own debuggers here
      -- 'leoluz/nvim-dap-go',
      'mxsdev/nvim-dap-vscode-js',

      {
        'microsoft/vscode-js-debug',
        version = '1.x',
        build = 'npm i && npm run compile vsDebugServerBundle && mv dist out',
      },
      {
        'Joakker/lua-json5',
        build = './install.sh',
      },
    },
    keys = {
      {
        '<leader>du',
        function()
          require('dapui').toggle {}
        end,
        desc = 'Dap UI',
      },
    },
    config = function()
      local dap = require 'dap'
      local dapui = require 'dapui'

      require('mason-nvim-dap').setup {
        -- Makes a best effort to setup the various debuggers with
        -- reasonable debug configurations
        automatic_setup = true,

        -- You can provide additional configuration to the handlers,
        -- see mason-nvim-dap README for more information
        handlers = {},

        -- You'll need to check that you have the required things installed
        -- online, please don't ask me how to install them :)
        ensure_installed = {
          -- Update this to ensure that you have the debuggers for the langs you want
        },
      }

      vim.fn.sign_define('DapBreakpoint', { text = '🔴', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })

      -- Basic debugging keymaps, feel free to change to your liking!
      vim.keymap.set('n', '<leader>dc', function()
        if vim.fn.filereadable '.vscode/launch.json' then
          local dap_vscode = require 'dap.ext.vscode'
          dap_vscode.load_launchjs(nil, {
            ['pwa-node'] = js_based_languages,
            ['chrome'] = js_based_languages,
            ['pwa-chrome'] = js_based_languages,
          })
        end
        require('dap').continue()
      end, { desc = 'Debug: Start/Continue' })
      vim.keymap.set('n', '<leader>di', dap.step_into, { desc = 'Debug: Step Into' })
      vim.keymap.set('n', '<leader>do', dap.step_over, { desc = 'Debug: Step Over' })
      vim.keymap.set('n', '<leader>da', dap.step_out, { desc = 'Debug: Step Out' })
      vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
      vim.keymap.set('n', '<leader>dB', function()
        dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
      end, { desc = 'Debug: Set conditional Breakpoint' })

      -- Dap UI setup
      -- For more information, see |:help nvim-dap-ui|
      dapui.setup {
        -- Set icons to characters that are more likely to work in every terminal.
        --    Feel free to remove or use ones that you like more! :)
        --    Don't feel like these are good choices.
        icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
        controls = {
          icons = {
            pause = '⏸',
            play = '▶',
            step_into = '⏎',
            step_over = '⏭',
            step_out = '⏮',
            step_back = 'b',
            run_last = '▶▶',
            terminate = '⏹',
            disconnect = '⏏',
          },
        },
        layouts = {
          {
            elements = {
              {
                id = 'scopes',
                size = 0.25,
              },
              {
                id = 'breakpoints',
                size = 0.25,
              },
              -- {
              --   id = 'stacks',
              --   size = 0.25,
              -- },
              {
                id = 'watches',
                size = 0.25,
              },
            },
            position = 'left',
            size = 40,
          },
          {
            elements = {
              {
                id = 'repl',
                size = 0.42,
              },
              {
                id = 'console',
                size = 0.58,
              },
            },
            position = 'bottom',
            size = 15,
          },
        },
      }

      -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
      vim.keymap.set('n', '<leader>dr', dapui.toggle, { desc = 'Debug: See last session result.' })

      dap.listeners.after.event_initialized['dapui_config'] = dapui.open
      dap.listeners.before.event_terminated['dapui_config'] = dapui.close
      dap.listeners.before.event_exited['dapui_config'] = dapui.close

      dap.adapters['pwa-node'] = {
        type = 'server',
        host = 'localhost',
        port = '${port}',
        executable = {
          command = 'js-debug-adapter',
          args = {
            '${port}',
          },
        },
      }

      -- require('dap-vscode-js').setup {
      --   -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
      --   debugger_path = vim.fn.stdpath 'data' .. '/lazy/vscode-js-debug', -- Path to vscode-js-debug installation.
      --   -- debugger_cmd = { "extension" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
      --   adapters = { 'chrome', 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost', 'node', 'chrome' }, -- which adapters to register in nvim-dap
      --   -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
      --   -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
      --   -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
      -- }

      for _, language in ipairs(js_based_languages) do
        require('dap').configurations[language] = {
          {
            type = 'pwa-node',
            request = 'launch',
            name = 'Launch file',
            program = '${file}',
            cwd = '${workspaceFolder}',
          },
          {
            type = 'pwa-node',
            request = 'attach',
            name = 'Attach',
            processId = require('dap.utils').pick_process,
            cwd = '${workspaceFolder}',
          },
          {
            type = 'pwa-node',
            request = 'launch',
            name = 'npm run start',
            cwd = '${workspaceFolder}',
            runtimeExecutable = 'npm',
            runtimeArgs = { 'run', 'start' },
            skipFiles = { '<node_internals>/**' },
            console = 'integratedTerminal',
          },
          {
            type = 'pwa-node',
            request = 'launch',
            name = '------------------ Below are loaded from .vscode/launch.json ------------------',
          },
          -- {
          --   type = 'pwa-chrome',
          --   request = 'launch',
          --   name = 'Start Chrome with "localhost"',
          --   url = 'http://localhost:3000',
          --   webRoot = '${workspaceFolder}',
          --   userDataDir = '${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir',
          -- },
        }
      end
    end,
  },
  {
    'theHamsta/nvim-dap-virtual-text',
    opts = {
      virtual_text = {
        prefix = '',
        spacing = 4,
      },
    },
  },
}
