local servers = { "gopls", "rust_analyzer", "ts_ls", "clangd", "cmake", "lua_ls", "vimls", "pylsp" }
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
        end,
        ["pylsp"] = function ()
            lspconfig["pylsp"].setup {
                capabilities = capabilities,
                settings = {
                    formatCommand = {"black"},
                    pylsp = {
                        plugins = {
                            pycodestyle = {
                                enable = false,
                                ignore = {'E501', 'W503'},
                                maxLineLength=200,
                            },
                        }
                    }
                }
            }
        end
    }
}
