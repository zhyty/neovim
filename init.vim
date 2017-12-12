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
" ale linter
Plug 'w0rp/ale'
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
" neomake jedi for realsies
Plug 'zchee/deoplete-jedi'
" pep8 indents
Plug 'Vimjas/vim-python-pep8-indent'
" fix trailing whitespace
Plug 'bronson/vim-trailing-whitespace'
" git commands
Plug 'tpope/vim-fugitive'
" elm stuff
Plug 'elmcast/elm-vim'

call plug#end()

" ==================== ALE

let g:ale_linters = {
\   'python': ['pylint']
\}

let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1

" ==================== Rainbow Parens

autocmd FileType * RainbowParentheses

" ==================== AIRLINE

" Fixing Airline
set laststatus=2

" AirLine Configuration
let g:airline_powerline_fonts = 1
let g:bufferline_echo = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1 " show buffer number

" depends on both ale and airline
let g:airline#extensions#ale#enabled = 1

" ==================== OCAML

let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
" ocp-indent
execute "set rtp+=" . g:opamshare . "/ocp-indent/vim/indent"
" merlin
execute "set rtp+=" . g:opamshare . "/merlin/vim"

" ==================== DEOPLETE

let g:deoplete#enable_at_startup = 1

" ==================== Trailing Whitespace

" remove trailing whitespaces on save
autocmd BufWritePre * :FixWhitespace

" ==================== Elm

" Disable format on save
" let g:elm_format_autosave = 0

" ==================== Plugin Shortcuts

noremap ,p :CtrlPBuffer<CR>
nmap <F2> <Plug>(ale_detail)
noremap <F5> :NERDTreeToggle<CR>
