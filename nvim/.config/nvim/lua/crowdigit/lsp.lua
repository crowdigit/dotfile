local servers = { "gopls", "rust_analyzer", "tsserver", "clangd", "cmake", "lua_ls", "vimls" }
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local lspconfig = require('lspconfig')

require("mason-lspconfig").setup {
    ensure_installed = servers,
    automatic_installation = true,
    handlers = {
        function (server_name)
            lspconfig[server_name].setup {
                capabilities = capabilities
            }
        end,
    }
}
