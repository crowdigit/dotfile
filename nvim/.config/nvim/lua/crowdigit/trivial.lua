require('go').setup()
require('nvim-autopairs').setup {}
require('ibl').setup {
    scope = { highlight = { 'Folded' } },
    indent = {
        char = "│",
        tab_char = "┆",
    },
};
require('lsp_signature').setup { hint_prefix = '¯\\_(ツ)_/¯ ' }
require('aerial').setup {
  -- optionally use on_attach to set keymaps when aerial has attached to a buffer
  on_attach = function(bufnr)
  -- Jump forwards/backwards
  vim.keymap.set("n", "<leader>[", "<cmd>AerialPrev<CR>", { buffer = bufnr })
  vim.keymap.set("n", "<leader>]", "<cmd>AerialNext<CR>", { buffer = bufnr })
  end,
}
-- You probably also want to set a keymap to toggle aerial
vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")

vim.keymap.set('v', '<leader>c', require('osc52').copy_visual)
require('gitsigns').setup()
