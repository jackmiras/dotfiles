""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Lightline settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:lightline = {
	  \ 'active': {
	  \   'left': [
	  \     ['mode', 'paste'],
	  \     ['unique_tail_improved', 'tabline'],
	  \   ],
	  \   'right': [
	  \     ['lineinfo'],
	  \     ['percent'],
	  \     ['filetype', 'fileformat', 'fileencoding'],
	  \   ],
	  \ },
	  \ 'inactive': {
	  \   'left': [
	  \     ['unique_tail_improved', 'tabline'],
	  \   ],
	  \   'right': [
	  \     ['lineinfo'],
	  \     ['percent'],
	  \     ['filetype', 'fileformat', 'fileencoding'],
	  \   ],
	  \ },
	  \ 'tabline': {
	  \   'left': [],
	  \   'right': [],
	  \ },
	  \ 'tab': {
	  \   'active': 'tab_active',
	  \   'inactive': 'tab_inactive',
	  \ },
	  \ 'component_function': {
	  \   'unique_tail_improved': 'LightlineUniqueTailImproved',
	  \ },
	  \ 'component_expand': {
	  \   'unique_tail_improved': 'lightline#unique_tail_improved#unique_tail',
	  \ },
	  \ 'component_type': {
	  \   'unique_tail_improved': 'right',
	  \ },
	  \ 'separator': { 'left': '', 'right': '' },
	  \ 'subseparator': { 'left': '', 'right': '' },
\ }

" Enable Lightline
let g:lightline.enable = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Lightline theme - space-vim-dark
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" let g:lightline = {'colorscheme': 'violet'}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Lightline theme - tokyonight
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:lightline = {'colorscheme': 'tokyonight'}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Lightline theme - dracula
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" let g:lightline = {'colorscheme': 'dracula'}
