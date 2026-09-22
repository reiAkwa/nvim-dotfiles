vim.pack.add({
  { src = 'https://github.com/mfussenegger/nvim-dap' },
  { src = 'https://github.com/rcarriga/nvim-dap-ui' },
  { src = 'https://github.com/nvim-neotest/nvim-nio' },
})

local dap = require('dap')
local dapui = require('dapui')

dapui.setup()

dap.listeners.after.event_initialized['dapui_config'] = dapui.open
dap.listeners.before.event_terminated['dapui_config'] = dapui.close
dap.listeners.before.event_exited['dapui_config'] = dapui.close

local map = vim.keymap.set

map('n', '<leader>db', dap.toggle_breakpoint, { desc = 'DAP 切换断点' })
map('n', '<leader>dB', function()
  dap.set_breakpoint(vim.fn.input('断点条件: '))
end, { desc = 'DAP 条件断点' })
map('n', '<leader>dc', dap.continue, { desc = 'DAP 继续/启动' })
map('n', '<leader>di', dap.step_into, { desc = 'DAP 步入' })
map('n', '<leader>do', dap.step_over, { desc = 'DAP 步过' })
map('n', '<leader>dO', dap.step_out, { desc = 'DAP 步出' })
map('n', '<leader>dr', dap.repl.toggle, { desc = 'DAP 切换 REPL' })
map('n', '<leader>dl', dap.run_last, { desc = 'DAP 重复上次调试' })
map('n', '<leader>dt', dap.terminate, { desc = 'DAP 终止调试' })
map('n', '<leader>du', dapui.toggle, { desc = 'DAP 切换调试面板' })
map('n', '<leader>de', dapui.eval, { desc = 'DAP 求值' })
