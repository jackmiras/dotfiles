""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ncm2 settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <esc>

" Use <TAB> to select the popup menu:
inoremap <expr> <tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" Omnifunc does not run in background and may probably block the editor.
" If you don't want to be blocked too often, you could add 180ms delay before the omni wrapper:
" 'on_complete': ['ncm2#on_complete#delay', 180, 'ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
au User Ncm2Plugin call ncm2#register_source({
	\'name' : 'css',
	\'priority': 9, 
	\'subscope_enable': 1,
	\'scope': ['css','scss'],
	\'mark': 'css',
	\'word_pattern': '[\w\-]+',
	\'complete_pattern': ':\s*',
	\'on_complete': ['ncm2#on_complete#delay', 180, 'ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
\})
