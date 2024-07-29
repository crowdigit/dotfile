local util = require("formatter.util")

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
        function()
            return {
                exe = "eslint_d",
                args = {
                    "--config",
                    "/home/asdf/.config/nvim/etc/typescript/eslint.config.mjs",
                    "--stdin",
                    "--stdin-filename",
                    util.escape_path(util.get_current_buffer_file_path()),
                    "--fix-to-stdout",
                },
                stdin = true,
                try_node_modules = true,
            }
        end,
    },
    javascript = {
        function()
            return {
                exe = "eslint_d",
                args = {
                    "--config",
                    "/home/asdf/.config/nvim/etc/typescript/eslint.config.mjs",
                    "--stdin",
                    "--stdin-filename",
                    util.escape_path(util.get_current_buffer_file_path()),
                    "--fix-to-stdout",
                },
                stdin = true,
                try_node_modules = true,
            }
        end,
    },
    json = {
        require("formatter.defaults").eslint_d,
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
