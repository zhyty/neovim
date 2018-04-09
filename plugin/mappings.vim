" CONTAINS MY MAPPINGS

" ==================== command

command! W write
command! Reload source $MYVIMRC

" CTRL S functionality
" If the current buffer has never been saved, it will have no name,
" call the file browser to save it, otherwise just save it.
command -nargs=0 -bar Update if &modified
                           \|    if empty(bufname('%'))
                           \|        browse confirm write
                           \|    else
                           \|        confirm write
                           \|    endif
                           \|endif
nnoremap <silent> <C-S> :<C-u>Update<CR>
inoremap <silent> <C-S> <c-o>:Update<CR>

" ==================== non-insert

nnoremap j gj
nnoremap k gk
nnoremap ; :
noremap <S-k> <Nop>
noremap <Leader>p :set paste!<CR>
noremap <Leader>l :ls<CR>
noremap <Leader>m :marks<CR>
noremap <Leader>n :noh<CR>

" ==================== insert

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>
inoremap <C-A> <Home>
inoremap <C-E> <End>

" ==================== abbrev

abbr 20= ====================
