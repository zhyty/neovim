" Custom Settings (not plugin related)

" ==================== BASIC CONFIG (vimtutor)

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

" ==================== CUSTOM

" set leader to space
let mapleader = " "

" timeouts
set timeoutlen=1000 ttimeoutlen=10
set noshowmode

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

" Set number
set relativenumber

" Set up backup directories
set backupdir=~/vimtmp,~/tmp
set directory=~/vimtmp,~/tmp

" misc
set ttyfast
set hidden " doesn't require saving before opening new buffer
set nowrap

" disable automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" ==================== COLORS
" colorscheme peachpuff
" colorscheme Tomorrow-Night
" colorscheme railscasts
" colorscheme mayansmoke
colorscheme tendercustom
