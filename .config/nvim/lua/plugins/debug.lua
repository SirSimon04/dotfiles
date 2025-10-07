local js_based_languages = { 'typescript', 'javascript', 'typescriptreact' }

return {
  {
    name = 'nvim-dap',
    'mfussenegger/nvim-dap',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'rcarriga/nvim-dap-ui', lazy = true },
      'nvim-neotest/nvim-nio',
      { 'williamboman/mason.nvim', lazy = true },
      { 'jay-babu/mason-nvim-dap.nvim', lazy = true },
      { 'mxsdev/nvim-dap-vscode-js', lazy = true },
      {
        'microsoft/vscode-js-debug',
        version = '1.x',
        build = 'npm install && npm run compile vsDebugServerBundle && mv dist out',
        lazy = true,
      },
      { 'Joakker/lua-json5', build = './install.sh', lazy = true },
      {
        'theHamsta/nvim-dap-virtual-text',
        lazy = true,
        opts = { virtual_text = { prefix = '', spacing = 4 } },
      },
    },

    -- also lazy‐load on the built-in dap commands:
    -- cmd = {
    --   'DapContinue',
    --   'DapToggleBreakpoint',
    --   'DapStepOver',
    --   'DapStepInto',
    --   'DapStepOut',
    --   'DapTerminate',
    -- },

    -- and on these <leader>d* keys:
    keys = {
      {
        '<leader>db',
        function()
          require('lazy').load { plugins = { 'nvim-dap' } }
          vim.schedule(function()
            require('dap').toggle_breakpoint()
          end)
        end,
        desc = 'Debug: Toggle Breakpoint',
      },
      {
        '<leader>du',
        function()
          require('lazy').load { plugins = { 'nvim-dap' } }
          vim.schedule(function()
            require('dapui').toggle()
          end)
        end,
        desc = 'Debug: Toggle DAP UI',
      },
      {
        '<leader>dr',
        function()
          require('lazy').load { plugins = { 'nvim-dap' } }
          vim.schedule(function()
            require('dapui').toggle()
          end)
        end,
        desc = 'Debug: See last session result',
      },
      {
        '<leader>dc',
        function()
          require('lazy').load { plugins = { 'nvim-dap' } }
          vim.schedule(function()
            require('dap').continue()
          end)
        end,
        desc = 'Debug: Start/Continue',
      },
      {
        '<leader>di',
        function()
          require('lazy').load { plugins = { 'nvim-dap' } }
          vim.schedule(function()
            require('dap').step_into()
          end)
        end,
        desc = 'Debug: Step Into',
      },
      {
        '<leader>do',
        function()
          require('lazy').load { plugins = { 'nvim-dap' } }
          vim.schedule(function()
            require('dap').step_over()
          end)
        end,
        desc = 'Debug: Step Over',
      },
      {
        '<leader>da',
        function()
          require('lazy').load { plugins = { 'nvim-dap' } }
          vim.schedule(function()
            require('dap').step_out()
          end)
        end,
        desc = 'Debug: Step Out',
      },
      {
        '<leader>dB',
        function()
          require('lazy').load { plugins = { 'nvim-dap' } }
          vim.schedule(function()
            require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
          end)
        end,
        desc = 'Debug: Set conditional Breakpoint',
      },
    },

    config = function()
      local dap = require 'dap'
      local dapui = require 'dapui'

      -- this leads to duplicate loading of configs
      -- if it doesn't work anymore, put it back in
      -- === patch `continue()` so it first loads your .vscode/launch.json ===
      -- do
      --   local orig = dap.continue
      --   dap.continue = function(...)
      --     if vim.fn.filereadable '.vscode/launch.json' == 1 then
      --       require('dap.ext.vscode').load_launchjs(nil, {
      --         ['pwa-node'] = js_based_languages,
      --         ['chrome'] = js_based_languages,
      --         ['pwa-chrome'] = js_based_languages,
      --       })
      --     end
      --     return orig(...)
      --   end
      -- end

      -- mason-nvim-dap
      require('mason-nvim-dap').setup {
        automatic_setup = true,
        ensure_installed = {
          'chrome-debug-adapter',
          'js-debug-adapter',
          'node-debug2-adapter',
        },
        handlers = {},
      }

      -- signs
      vim.fn.sign_define('DapBreakpoint', {
        text = '🔴',
        texthl = 'DapBreakpoint',
        linehl = 'DapBreakpoint',
        numhl = 'DapBreakpoint',
      })

      -- adapter
      dap.adapters['pwa-node'] = {
        type = 'server',
        host = 'localhost',
        port = '${port}',
        executable = {
          command = 'js-debug-adapter',
          args = { '${port}' },
        },
      }

      dap.configurations.java = {
        {
          type = 'java',
          name = 'Debug',
          request = 'launch',
          program = '${file}',
        },
      }

      for _, lang in ipairs(js_based_languages) do
        dap.configurations[lang] = {
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
            name = 'Attach to process',
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
        }
      end

      dapui.setup {
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
              { id = 'repl', size = 0.42 },
              { id = 'console', size = 0.58 },
            },
            position = 'bottom',
            size = 15,
          },
        },
      }

      require('nvim-dap-virtual-text').setup()

      dap.listeners.after.event_initialized['dapui'] = function()
        vim.schedule(dapui.open)
      end
      dap.listeners.before.event_terminated['dapui'] = function()
        vim.schedule(dapui.close)
      end
      dap.listeners.before.event_exited['dapui'] = function()
        vim.schedule(dapui.close)
      end
    end,
  },
}
