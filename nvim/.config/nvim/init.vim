" [found this guide quite good](https://learnvimscriptthehardway.stevelosh.com)

" minpac {{{
packadd minpac

call minpac#init()
call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('itchyny/lightline.vim')
call minpac#add('yuttie/hydrangea-vim')
call minpac#add('nathanaelkane/vim-indent-guides')
call minpac#add('mattn/emmet-vim')
call minpac#add('tikhomirov/vim-glsl')
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-surround')
call minpac#add('lambdalisue/vim-fullscreen')
call minpac#add('tomlion/vim-solidity')
call minpac#add('dracula/vim', { 'name': 'dracula' })
call minpac#add('dylanaraps/wal.vim')
call minpac#add('danilo-augusto/vim-afterglow')
call minpac#add('leafgarland/typescript-vim')
call minpac#add('kana/vim-operator-user')
call minpac#add('rhysd/vim-clang-format')
call minpac#add('Shougo/vimproc.vim', { 'do' : 'make' })
call minpac#add('lambdalisue/suda.vim')
call minpac#add('godlygeek/tabular')
call minpac#add('plasticboy/vim-markdown')
call minpac#add('reedes/vim-pencil')
call minpac#add('tpope/vim-repeat')
call minpac#add('puremourning/vimspector')
call minpac#add('junegunn/fzf')
call minpac#add('junegunn/fzf.vim')
call minpac#add('vim-ctrlspace/vim-ctrlspace')
call minpac#add('embark-theme/vim', { 'name': 'embark' })
call minpac#add('ledesmablt/vim-run')
call minpac#add('vimoutliner/vimoutliner')
call minpac#add('sdiehl/vim-ormolu')
call minpac#add('purescript-contrib/purescript-vim')
call minpac#add('rlue/vim-barbaric')
call minpac#add('rust-lang/rust.vim')
call minpac#add('liuchengxu/graphviz.vim')
call minpac#add('chrisbra/Colorizer')
call minpac#add('neovim/nvim-lspconfig')
call minpac#add('hrsh7th/nvim-compe')
call minpac#add('nvim-treesitter/nvim-treesitter')
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
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_exclude_filetypes = ['haskell', 'purescript']
let g:lightline={
            \ 'colorscheme': 'embark',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'readonly', 'filename', 'modified' ] ]
            \ },
            \ }
let g:indent_guides_auto_colors=0
let g:indent_guides_start_level=1
let g:indent_guides_guide_size=1
"plasticboy/vim-markdown
let g:vim_markdown_folding_disabled = 1
" iamcco/markdown-preview.nvim
let g:mkdp_markdown_css = '$HOME/.local/lib/github-markdown-css/github-markdown.css'
let g:mkdp_auto_close = 0
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
let g:CtrlSpaceFileEngine = 'file_engine_linux_amd64'
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
    autocmd FileType purescript setlocal   expandtab tabstop=2 shiftwidth=2
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
    nnoremap <silent><C-p> :CtrlSpace O<CR>
augroup end
" }}}

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

colorscheme embark

" key mappings {{{
nnoremap <leader>ev :tabedit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <F1> :ccl<CR>
nnoremap <F2> :noh<CR>
nnoremap <A-q> {v}!par -w60<CR>
nnoremap <silent> <C-W>, :tabm-1<CR>
nnoremap <silent> <C-W>. :tabm+1<CR>
vnoremap <A-q> !par -w60<CR>
nnoremap * #
nnoremap # *
" }}}

function ToggleReadOnly()
    if &readonly
        set noreadonly
    else
        set readonly
    endif
endfunction

nnoremap / /\v
inoremap <Leader>sh ¯\_(ツ)_/¯
nnoremap <Leader>d :GoDoc<CR>
nnoremap <silent> <Leader>r :call ToggleReadOnly()<CR>

" nvim-compe {{{
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.resolve_timeout = 800
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:false
let g:compe.source.ultisnips = v:true
let g:compe.source.luasnip = v:true
let g:compe.source.emoji = v:true

inoremap <silent><expr> <C-c> compe#complete()
inoremap <silent><expr> <CR>  compe#confirm('<CR>')
inoremap <silent><expr> <C-e> compe#close('<C-e>')
inoremap <silent><expr> <C-f> compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d> compe#scroll({ 'delta': -4 })
" }}}

" nvim-lspconfig {{{
lua << EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "rust_analyzer", "hls", "ccls", "pyright" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

nvim_lsp.tsserver.setup {
    on_attach = on_attach,
    flags = {
        debounce_text_changes = 150,
    },
    handlers = {
        ['textDocument/publishDiagnostics'] = vim.lsp.with(
            vim.lsp.diagnostic.on_publish_diagnostics, {
                virtual_text = false
            }
        )
    }
}

nvim_lsp.gopls.setup {
    cmd = { "gopls", "-remote=auto" },
    on_attach = on_attach,
    flags = {
        debounce_text_changes = 150,
    },
    handlers = {
        ['textDocument/publishDiagnostics'] = vim.lsp.with(
            vim.lsp.diagnostic.on_publish_diagnostics, {
                virtual_text = false
            }
        )
    },
}

EOF
" }}}

" nvim-treesitter {{{
lua << EOF
require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained",
    highlight = {
        enable = true,
    },
}
EOF
" }}}
