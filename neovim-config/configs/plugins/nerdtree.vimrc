""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:NERDTreeWinSize=60

let g:NERDTreeShowHidden=1
let g:NERDTreeNodeDelimiter="\u263a" " smiley face
let g:NERDTreeIndicatorSymbol = '->'
let g:NERDTreeGitStatusIndicatorMapCustom={
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

let g:NERDTreeIgnore=['__pycache__', '\~$']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree re-mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NERDTree - configurations
map <f1> :NERDTreeFind<cr>
map <f2> :NERDTreeToggle<cr>
