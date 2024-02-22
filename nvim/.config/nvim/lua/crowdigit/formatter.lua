-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup {
  -- Enable or disable logging
  logging = true,
  -- Set the log level
  log_level = vim.log.levels.WARN,
  -- All formatter configurations are opt-in
  filetype = {
    -- Formatter configurations for filetype "lua" go here
    -- and will be executed in order
    typescript = {
        require("formatter.filetypes.typescript").denofmt,
    },
    javascript = {
        require("formatter.filetypes.typescript").denofmt,
    },
    go = {
        require("formatter.filetypes.go").golines,
    },
    -- Use the special "*" filetype for defining formatter configurations on
    -- any filetype
    ["*"] = {
      -- "formatter.filetypes.any" defines default configurations for any
      -- filetype
      require("formatter.filetypes.any").remove_trailing_whitespace
    }
  }
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    pattern = { "*.go" },
    callback = function()
        vim.cmd('GoImport')
        vim.cmd('Format')
    end,
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    pattern = { "!*.go" },
    callback = function()
        vim.cmd('Format')
    end,
})
