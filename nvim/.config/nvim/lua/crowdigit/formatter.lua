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
        require("formatter.filetypes.typescript").eslint_d,
    },
    javascript = {
        require("formatter.filetypes.typescript").eslint_d,
    },
    json = {
        require("formatter.filetypes.typescript").eslint_d,
    },
    go = {
        require("formatter.filetypes.go").gofumpt,
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
    callback = function(opts)
        if vim.bo.filetype == "go" then
            vim.cmd('GoImports')
        end
        vim.cmd('Format')
    end,
})
