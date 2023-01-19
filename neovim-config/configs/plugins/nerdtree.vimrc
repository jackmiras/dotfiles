""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:NERDTreeWinSize=60

let NERDTreeShowHidden=1
let NERDTreeNodeDelimiter="\u263a" " smiley face
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

let NERDTreeIgnore=['__pycache__', '\~$']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree re-mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NERDTree - configurations
map <f1> :NERDTreeFind<cr>
map <f2> :NERDTreeToggle<cr>
