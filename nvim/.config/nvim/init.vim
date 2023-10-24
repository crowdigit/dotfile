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
call minpac#add('nvim-lualine/lualine.nvim')
call minpac#add('nvim-tree/nvim-web-devicons')
call minpac#add('ojroques/nvim-osc52')
call minpac#add('stevearc/aerial.nvim')
call minpac#add('petertriho/nvim-scrollbar')
call minpac#add('kevinhwang91/nvim-hlslens')

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
set cursorline
set showtabline=0
set directory=$HOME/.config/nvim/backup
set backupdir=$HOME/.config/nvim/backup
set list
set listchars=tab:>\ ,eol:$,lead:.,trail:-
set signcolumn=yes
set termguicolors
set guicursor+=a:Cursor/Cursor
set hidden
set nocompatible
set updatetime=300
set shortmess+=cS
" set completeopt=menuone,noselect
" }}}

" bunch of lets {{{
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
    autocmd!
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
    nnoremap <silent><C-p> :CtrlSpace o<CR>
    nnoremap <silent><C-l> :CtrlSpace l<CR>
augroup end

augroup Formatter
    autocmd!
    autocmd BufWritePre *.ts,*.js,*.mjs,*.jsx,*.tsx Neoformat prettierd
augroup end

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
" }}}

colorscheme embark

" key mappings {{{
nnoremap <F1> :ccl<CR>
nnoremap <F2> :noh<CR>
nnoremap <A-q> {v}!par -w60<CR>
nnoremap / /\v
inoremap <Leader>sh ¯\_(ツ)_/¯
nnoremap <Leader>d :GoDoc<CR>
" }}}

" separated lua config {{{
lua << EOF
require("crowdigit.nvim-lspconfig")
require("crowdigit.trivial")
require("crowdigit.treesitter")
require("crowdigit.nvim-cmp")
require("crowdigit.lualine")
require("crowdigit.scrollbar")
require("crowdigit.hlslens")
EOF
" }}}

" neovide {{{
if exists("g:neovide")
  set guifont=Hack:h14,Symbols\ Nerd\ Font\ Mono:h14
  let g:neovide_scroll_animation_length = 0.08
  let g:neovide_cursor_animation_length = 0.04
  cd $HOME/project
endif
" }}}
