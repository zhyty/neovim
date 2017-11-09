" required for work in virtualenvs
" keep at top
let g:python_host_prog='/usr/bin/python'
let g:python3_host_prog='/usr/bin/python3'

" ==================== " VIM PLUG

call plug#begin('~/.config/nvim/plugged')

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Rainbow Parentheses
Plug 'junegunn/rainbow_parentheses.vim'
" Surround
Plug 'tpope/vim-surround'
" Tabular
Plug 'godlygeek/tabular'
" CTRL P
Plug 'ctrlpvim/ctrlp.vim'
" Bufkill (for BD)
Plug 'qpkorr/vim-bufkill'
" NERDTree
Plug 'scrooloose/nerdtree'
" Latex
Plug 'lervag/vimtex'
" Python folding
Plug 'tmhedberg/SimpylFold'
" Tender Theme
Plug 'jacoborus/tender.vim'
" deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" neomake linting
Plug 'neomake/neomake'
" neomake jedi for realsies
Plug 'zchee/deoplete-jedi'
" pep8 indents
Plug 'Vimjas/vim-python-pep8-indent'
" fix trailing whitespace
Plug 'bronson/vim-trailing-whitespace'
" git commands
Plug 'tpope/vim-fugitive'

call plug#end()

" ==================== Rainbow Parens

autocmd FileType * RainbowParentheses

" ==================== AIRLINE

" Fixing Airline
set laststatus=2

" AirLine Configuration
let g:airline_powerline_fonts = 1
let g:bufferline_echo = 0
set noshowmode
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1 " show buffer number
set timeoutlen=1000 ttimeoutlen=10

" ==================== NERDTREE

nnoremap <F5> :NERDTreeToggle<CR>

" ==================== OCAML

let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
" ocp-indent
execute "set rtp+=" . g:opamshare . "/ocp-indent/vim/indent"
" merlin
execute "set rtp+=" . g:opamshare . "/merlin/vim"

" ==================== DEOPLETE

let g:deoplete#enable_at_startup = 1

function! s:custom_unset_neomake()
    set signcolumn=no
endfunction

function! s:custom_set_neomake()
    set signcolumn=yes
    Neomake
endfunction

noremap <F3> :call <SID>custom_set_neomake()<CR>
noremap <F4> :call <SID>custom_unset_neomake()<CR>

" autoclose preview window
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" ==================== Trailing Whitespace

" remove trailing whitespaces on save
autocmd BufWritePre * :FixWhitespace
