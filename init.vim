" required for work in virtualenvs
" keep at top
let g:python_host_prog='/usr/bin/python'
let g:python3_host_prog='/usr/bin/python3'

" VIM PLUG //////////////////////////////////////////////////

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

call plug#end()

" BASIC CONFIG ////////////////////////////////////////////

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		    " show the cursor position all the time
set sc              " display incomplete commands
set incsearch		" do incremental searching

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" AIRLINE /////////////////////////////////////////////////

" Fixing Airline
set laststatus=2

" AirLine Configuration
let g:airline_powerline_fonts = 1
let g:bufferline_echo = 0
set noshowmode
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1 " show buffer number
set timeoutlen=1000 ttimeoutlen=10

" RAINBOW PARENTHESES /////////////////////////////////////

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

" NERDTREE ////////////////////////////////////////////////

nnoremap <F5> :NERDTreeToggle<CR>

" OCAML //////////////////////////////////////////////////

let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
" ocp-indent
execute "set rtp+=" . g:opamshare . "/ocp-indent/vim/indent"
" merlin
execute "set rtp+=" . g:opamshare . "/merlin/vim"

" DEOPLETE ////////////////////////////////////////////////

let g:deoplete#enable_at_startup = 1

" autoclose preview window
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" CUSTOM CONFIG ///////////////////////////////////////////

" Fixing the goddamn tabs broh
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4

" Additional Search Settings
set ignorecase " case insensitive search
set smartcase " uppercase letters proc case-sensitive search
set incsearch " live incremental searching
set showmatch " live match highlighting
set scrolloff=3 " minimum number of lines above/below the screen

" Changing Splits
set splitbelow
set splitright

" Set Relative Number
set relativenumber

" Set up backup directories
set backupdir=~/vimtmp,~/tmp
set directory=~/vimtmp,~/tmp

" Colors
" colorscheme peachpuff
" colorscheme Tomorrow-Night
" colorscheme railscasts
" colorscheme mayansmoke
colorscheme tender
hi Normal ctermbg=237
hi LineNr ctermfg=241

function! RemoveWhitespace()
    try | %s/\s\+$//e | catch | | endtry
    noh
endfunction

" misc
set ttyfast 
set hidden " doesn't require saving before opening new buffer
set nowrap

" disable automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
