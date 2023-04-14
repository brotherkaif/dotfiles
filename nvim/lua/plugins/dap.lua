return {
  -- nvim-dap - Debug Adapter Protocol client implementation for Neovim
  'mfussenegger/nvim-dap',

  dependencies = {
    'rcarriga/nvim-dap-ui',
  },

  init = function()
    -- set keymaps
    local opts = { noremap = true, silent = true }
    vim.keymap.set('n', '<F5>', '<Cmd>lua require("dap").continue()<CR>', { desc = 'DEBUG: Continue' })
    vim.keymap.set('n', '<S-F5>', '<Cmd>lua require("dap").stop()<CR>', { desc = 'DEBUG: Stop' })
    vim.keymap.set('n', '<F9>', '<Cmd>lua require("dap").toggle_breakpoint()<CR>', { desc = 'DEBUG: Toggle Breakpoint' })
    vim.keymap.set('n', '<F10>', '<Cmd>lua require("dap").step_over()<CR>', { desc = 'DEBUG: Step Over' })
    vim.keymap.set('n', '<F11>', '<Cmd>lua require("dap").step_into()<CR>', { desc = 'DEBUG: Step Into' })
    vim.keymap.set('n', '<S-F11>', '<Cmd>lua require("dap").step_out()<CR>', { desc = 'DEBUG: Step Out' })
  end,

  config = function()
    local dap, dapui = require('dap'), require('dapui')

    -- packages are installed via mason, so we need to construct the path 
    local install_root_dir = vim.fn.stdpath('data') .. '/mason/packages'

    -- mason package: node-debug2-adapter
    dap.adapters.node2 = {
            type = 'executable',
            command = 'node',
            args = { install_root_dir .. '/node-debug2-adapter/out/src/nodeDebug.js' },
    }

    local node2_configurations = {
      {
        name = 'Node: Launch Program',
        type = 'node2',
        request = 'launch',
        program = '${file}',
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = 'inspector',
        console = 'integratedTerminal',
      },
      {
        -- For this to work you need to make sure the node process is started with the `--inspect` flag.
        name = 'Node: Attach to Process',
        type = 'node2',
        request = 'attach',
        processId = require 'dap.utils'.pick_process,
      },
      {
        name = 'CC: Jest Test',
        type = 'node2',
        request = 'launch',
        program = '${workspaceFolder}/node_modules/jest/bin/jest.js',
        env = {
          LOG_LEVEL = 'silent'
        },
        args = {
          '${file}',
          '-c',
          '${workspaceFolder}/jest.config.js',
          '--verbose',
          '-i',
          '--no-cache'
        },
        console = 'integratedTerminal',
        sourceMaps = true,
        internalConsoleOptions = 'neverOpen'
      }
    }

    dap.configurations.javascript = node2_configurations
    dap.configurations.typescript = node2_configurations

    -- dapui configuration
    dapui.setup()

    dap.listeners.after.event_initialized['dapui_config'] = function()
      dapui.open({})
    end
    dap.listeners.before.event_terminated['dapui_config'] = function()
      dapui.close({})
    end
    dap.listeners.before.event_exited['dapui_config'] = function()
      dapui.close({})
    end
  end
}
