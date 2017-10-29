" CONTAINS MY MAPPINGS

" ==================== command

command! W write
command! Reload source $MYVIMRC

" ==================== non-insert

nnoremap j gj
nnoremap k gk
nnoremap ; :
noremap <S-k> <Nop>
noremap <Leader>p :set paste!<CR>
noremap <Leader>r :call RemoveWhitespace()<CR>
noremap <Leader>l :ls<CR>
noremap <Leader>m :marks<CR>

noremap <F2> :noh<CR>
noremap <F3> :Neomake<CR>

" ==================== insert

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>
inoremap <C-A> <Home>
inoremap <C-E> <End>

" ==================== abbrev

abbr 20= ====================
