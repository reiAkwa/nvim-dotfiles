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

-- CodeLLDB 由 mason 管理
local registry_ok, registry = pcall(require, 'mason-registry')
local codelldb_root = vim.fs.joinpath(vim.fn.stdpath('data'), 'mason', 'packages', 'codelldb')

if registry_ok then
  local pkg_ok, pkg = pcall(registry.get_package, 'codelldb')
  if pkg_ok then
    codelldb_root = pkg:get_install_path()
    -- 只在带 UI 时安装，避免 headless 流程顺手下载几十 MB
    if not pkg:is_installed() and #vim.api.nvim_list_uis() > 0 then
      pkg:on('install:success', function() -- 事件在 package 上，不在 install() 的返回值上
        vim.notify('[dap] codelldb 安装完成，重启 Nvim 后可用', vim.log.levels.INFO)
      end)
      pkg:install()
    end
  end
end

local ext = vim.fn.has('win32') == 1 and { bin = '.exe', lib = '.dll' }
  or (vim.fn.has('mac') == 1 and { bin = '', lib = '.dylib' } or { bin = '', lib = '.so' })

local codelldb_path = vim.fs.joinpath(codelldb_root, 'extension', 'adapter', 'codelldb' .. ext.bin)
local liblldb_path = vim.fs.joinpath(codelldb_root, 'extension', 'lldb', 'bin', 'liblldb' .. ext.lib)

dap.adapters.codelldb = {
  type = 'server',
  port = '${port}',
  executable = {
    command = codelldb_path,
    args = { '--liblldb', liblldb_path },
  },
}

local codelldb_config = {
  {
    name = '启动可执行文件（codelldb）',
    type = 'codelldb',
    request = 'launch',
    program = function()
      return vim.fn.input('可执行文件: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
}

dap.configurations.c = codelldb_config
dap.configurations.cpp = codelldb_config
dap.configurations.rust = codelldb_config
dap.configurations.zig = codelldb_config

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
