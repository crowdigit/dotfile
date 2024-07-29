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
        -- https://www.arthurkoziel.com/json-schemas-in-neovim/
        ["jsonls"] = function ()
            lspconfig["jsonls"].setup {
                capabilities = capabilities,
                settings = {
                    json = {
                        schemas = require('schemastore').json.schemas {
                            extra = {
                                {
                                    description = "Ad Shield Profile",
                                    fileMatch = { "profile/*.json" },
                                    name = "schema.json",
                                    url = "file:///Users/asdf/project/github.com/ad-shield/adshield/src/shared/encoding/profile/schema.json",
                                },
                            },
                        },
                        validate = { enable = true },
                    },
                },
            }
        end
    }
}
