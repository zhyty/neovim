" CONTAINS MY MAPPINGS

" Don't use Ex mode, use Q for formatting
map Q gq

nnoremap j gj
nnoremap k gk
nnoremap ; :
noremap <S-k> <Nop>
noremap <Leader>p :set paste!<CR>
noremap <Leader>r :call RemoveWhitespace()<CR>
noremap <F3> :Neomake<CR>

command! W write

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>
