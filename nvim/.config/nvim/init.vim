" [found this guide quite good](https://learnvimscriptthehardway.stevelosh.com)

" minpac {{{
packadd minpac

call minpac#init()

call minpac#add('k-takata/minpac', {'type': 'opt'})

" colorschemes
call minpac#add('yuttie/hydrangea-vim')
call minpac#add('dracula/vim', { 'name': 'dracula' })
call minpac#add('embark-theme/vim', { 'name': 'embark' })
call minpac#add('rmehri01/onenord.nvim')

" syntax
call minpac#add('tikhomirov/vim-glsl')
call minpac#add('leafgarland/typescript-vim')
call minpac#add('rust-lang/rust.vim')

" formatter
call minpac#add('sbdchd/neoformat') " needs configure plugins for each language
call minpac#add('godlygeek/tabular')

call minpac#add('itchyny/lightline.vim')
call minpac#add('lukas-reineke/indent-blankline.nvim')
call minpac#add('mattn/emmet-vim')
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-repeat')
call minpac#add('lambdalisue/suda.vim')
call minpac#add('junegunn/fzf')
call minpac#add('junegunn/fzf.vim')
call minpac#add('vim-ctrlspace/vim-ctrlspace')
call minpac#add('chrisbra/Colorizer')
call minpac#add('liuchengxu/graphviz.vim')
call minpac#add('heavenshell/vim-jsdoc', { 'do': 'make install' })

" debugger, need to choose one
call minpac#add('sakhnik/nvim-gdb')
call minpac#add('puremourning/vimspector')

" lsp and treesitter
call minpac#add('neovim/nvim-lspconfig')
call minpac#add('nvim-treesitter/nvim-treesitter')
" go plugins depending on treesitter
call minpac#add('ray-x/go.nvim')
call minpac#add('ray-x/guihua.lua')
" completion depending on treesitter
call minpac#add('hrsh7th/cmp-nvim-lsp')
call minpac#add('hrsh7th/cmp-buffer')
call minpac#add('hrsh7th/cmp-path')
call minpac#add('hrsh7th/cmp-cmdline')
call minpac#add('hrsh7th/nvim-cmp')
call minpac#add('hrsh7th/cmp-vsnip')
call minpac#add('hrsh7th/vim-vsnip')

call minpac#add('windwp/nvim-autopairs')
call minpac#add('ray-x/lsp_signature.nvim')

" }}}

let g:vimspector_enable_mappings = 'HUMAN'
packadd vimspector
python3 import vim

" bunch of sets {{{
set encoding=utf-8
set fileencoding=utf-8
set incsearch
set hlsearch
set tabstop=4       " specifies the width of a tab character
set shiftwidth=4    " determines the amount of whitespaces to insert or remove using the indentation
set softtabstop=4   " when enabled, fine tunes the amount of whitespace to be inserted
set expandtab       " when enabled, causes spaces to be used in place of tab characters
set number
set noshowmode
set wildmenu
set ignorecase
set formatprg=par\ -w60
set cursorline
set showtabline=0
set directory=$HOME/.config/nvim/backup
set backupdir=$HOME/.config/nvim/backup
set list
set listchars=tab:>\ ,eol:$
set signcolumn=yes
set termguicolors
set guicursor+=a:Cursor/Cursor
set hidden
set nocompatible
set updatetime=300
set shortmess+=c
set completeopt=menuone,noselect
" }}}

" bunch of lets {{{
let g:lightline={
            \ 'colorscheme': 'embark',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'readonly', 'filename', 'modified' ] ]
            \ },
            \ }
" vim-ctrlspace/vim-ctrlspace
let g:CtrlSpaceDefaultMappingKey = "<C-space> "
if executable("rg")
    let g:CtrlSpaceGlobCommand = 'rg --color=never --files'
endif
if exists("g:pager_mode")
    let g:CtrlSpaceLoadLastWorkspaceOnStart = 0
else
    let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
endif
let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
let g:CtrlSpaceSaveWorkspaceOnExit = 1
let g:CtrlSpaceFileEngine = 'file_engine_darwin_arm'
let g:run_nostream_default = 1
" rust-lang/rust.vim
let g:rustfmt_autosave = 1
" }}}

syntax on

" autogroups {{{
augroup IndentHighlight
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guifg=#3D3F4A guibg=#50525C
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guifg=#50525C guibg=#3D3F4A
augroup end

augroup Indentation
    autocmd!
    autocmd FileType c          setlocal noexpandtab tabstop=8 shiftwidth=8
    autocmd FileType yaml       setlocal   expandtab tabstop=2 shiftwidth=2 softtabstop=2
    autocmd FileType html       setlocal   expandtab tabstop=2 shiftwidth=2 softtabstop=2
    autocmd FileType haskell    setlocal   expandtab tabstop=2 shiftwidth=2 softtabstop=2
    autocmd FileType markdown   setlocal   expandtab tabstop=2 shiftwidth=2 softtabstop=2
    autocmd FileType go         setlocal noexpandtab tabstop=8 shiftwidth=8
    autocmd FileType proto      setlocal noexpandtab tabstop=8 shiftwidth=8
    autocmd FileType typescript setlocal   expandtab tabstop=2 shiftwidth=2 softtabstop=2
    autocmd FileType javascript setlocal   expandtab tabstop=2 shiftwidth=2 softtabstop=2
    autocmd FileType typescriptreact setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
    autocmd FileType javascriptreact setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
augroup end

augroup TerminalStuff
    autocmd!
    autocmd TermOpen * setlocal nonumber norelativenumber
    autocmd TermOpen * setlocal signcolumn=no
augroup end

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup end

augroup CtrlSpace
    autocmd!
    nnoremap <silent><C-p> :CtrlSpace O<CR>
augroup end

augroup Formatter
    autocmd!
    autocmd BufWritePre *.ts,*.js,*.mjs,*.jsx,*.tsx Neoformat prettierd
augroup end
" }}}

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

colorscheme embark

" key mappings {{{
nnoremap <F1> :ccl<CR>
nnoremap <F2> :noh<CR>
nnoremap <A-q> {v}!par -w60<CR>
nnoremap * #
nnoremap # *
" }}}

nnoremap / /\v
inoremap <Leader>sh ¯\_(ツ)_/¯
nnoremap <Leader>d :GoDoc<CR>

set guifont=Hack:h12

" nvim-lspconfig {{{
lua << EOF
-- Setup language servers.

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
EOF
" }}}

" trivial setup {{{
lua << EOF
require('nvim-autopairs').setup {}
require("ibl").setup { scope = { highlight = { "Folded" } } };
require("lsp_signature").setup {
  hint_prefix = "¯\\_(ツ)_/¯ "
}
EOF
" }}}

" nvim-treesitter {{{
lua <<EOF

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = "all",

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "phpdoc" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- disable = { "c", "rust" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF
" }}}

" nvim-cmp {{{
set completeopt=menu,menuone,noselect
lua <<EOF
  -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
    }, {
      { name = 'buffer' },
    })
  })
  cmp.setup.filetype('ctrlspace', {
      enabled = false
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    enabled = false,
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- If you want insert `(` after select function or method item
  local cmp_autopairs = require('nvim-autopairs.completion.cmp')
  cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
  )

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

  -- Use a loop to conveniently call 'setup' on multiple servers and
  -- map buffer local keybindings when the language server attaches
  local nvim_lsp = require('lspconfig')
  local servers = { "gopls", "rust_analyzer", "hls", "tsserver", "ccls" }
  for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
      -- on_attach = on_attach,
      -- flags = {
        -- debounce_text_changes = 150
      -- },
      capabilities = capabilities
    }
  end
EOF
" }}}
