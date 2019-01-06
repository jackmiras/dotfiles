""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let NERDTreeShowHidden=1
let NERDTreeNodeDelimiter="\u263a" " smiley face
let g:NERDTreeIndicatorMapCustom={
	\'Modified'  : '✹',
	\'Staged'    : '✚',
	\'Untracked' : '✭',
	\'Renamed'   : '➜',
	\'Unmerged'  : '═',
	\'Deleted'   : '✖',
	\'Dirty'     : '✗',
	\'Clean'     : '✔︎',
	\'Ignored'   : '☒',
	\'Unknown'   : '?'
\}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree re-mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NERDTree - configurations
map <f1> :NERDTreeFind<cr>
map <f2> :NERDTreeToggle<cr>
