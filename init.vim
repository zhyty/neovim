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
Plug 'kien/rainbow_parentheses.vim'
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

call plug#end()

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

" ==================== RAINBOW PARENTHESES

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

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

" autoclose preview window
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" ==================== Trailing Whitespace

" remove trailing whitespaces on save for python
autocmd BufWritePre *.py :FixWhitespace
