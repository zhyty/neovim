" VIM PLUG //////////////////////////////////////////////////

call plug#begin('~/.config/nvim/plugged')

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Syntastic
Plug 'scrooloose/syntastic'
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

call plug#end()

" BASIC CONFIG ////////////////////////////////////////////

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set sc          " display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

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

" SYNTASTIC ///////////////////////////////////////////////

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_compiler_options = ' -std=c++14 -Wall'
let g:syntastic_scss_checkers=['']

let g:syntastic_python_checkers = ['pylint']
" let g:syntastic_python_pylint_args = "--load-plugins pylint_django"

let g:syntastic_ocaml_checkers = ["merlin"]

let g:syntastic_mode_map = {'mode': 'passive'}
nnoremap <F3> :SyntasticCheck<CR>
nnoremap <F4> :SyntasticReset<CR>

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

" CUSTOM CONFIG ///////////////////////////////////////////

" Fixing the goddamn tabs broh
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4

" Showing line numbers
set number

" Setting runpath for plugins
set runtimepath+=$home/.vim

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

" Make j and k move by screen line
nnoremap j gj
nnoremap k gk

" Set up backup directories
set backupdir=~/vimtmp,~/tmp
set directory=~/vimtmp,~/tmp

" Colors
" colorscheme peachpuff
" colorscheme Tomorrow-Night
colorscheme railscasts
" colorscheme mayansmoke
" colorscheme tender

" Additional Commands
command! W write

function RemoveWhitespace()
    %s/\s\+$//e
    noh
endfunction
command RemWhite call RemoveWhitespace()

" misc
set ttyfast
set hidden " doesn't require saving before opening new buffer
nnoremap ; :
map <S-k> <Nop>
