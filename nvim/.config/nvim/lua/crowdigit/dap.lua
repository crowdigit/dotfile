local dap = require("dap")

dap.adapters["pwa-node"] = {
  type = "server",
  host = "localhost",
  port = "${port}",
  executable = {
    command = "node",
    -- 💀 Make sure to update this path to point to your installation
    args = {"/Users/asdf/script/js-debug-v1.96.0/src/dapDebugServer.js", "${port}"},
  }
}

dap.configurations.typescript = {
  {
    type = 'pwa-node',
    request = 'launch',
    name = "Launch file",
    runtimeExecutable = "tsx",
    runtimeArgs = {
        "--inspect-brk",
    },
    program = "${file}",
    cwd = "${workspaceFolder}",
    attachSimplePort = 9229,
  },
}

dap.configurations.javascript = {
  {
    type = 'pwa-node',
    request = 'launch',
    name = "Launch file",
    runtimeExecutable = "deno",
    runtimeArgs = {
      "run",
      "--inspect-wait",
      "--allow-all"
    },
    program = "${file}",
    cwd = "${workspaceFolder}",
    attachSimplePort = 9229,
  },
}

vim.keymap.set('n', '<Leader>dt', function() require('dapui').toggle() end)
vim.keymap.set('n', '<Leader>dj', function() require('dap').step_over() end)
vim.keymap.set('n', '<Leader>dl', function() require('dap').step_into() end)
vim.keymap.set('n', '<Leader>dk', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>dc', function() require('dap').continue() end)
vim.keymap.set('n', '<Leader>db', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<Leader>dq', function() require('dap').terminate() end)

-- vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
-- vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
-- vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
  require('dap.ui.widgets').hover()
end)
vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
  require('dap.ui.widgets').preview()
end)
vim.keymap.set('n', '<Leader>df', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<Leader>ds', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.scopes)
end)

require("dapui").setup()
