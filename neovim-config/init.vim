""""""""""""""""""""""""""Plug plugins""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
" Theme releated plugins
Plug 'vim-airline/vim-airline'
Plug 'liuchengxu/space-vim-dark'

" General coding plugins
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
Plug 'w0rp/ale'

" Fuzzy search plugins
Plug 'ctrlpvim/ctrlp.vim'
Plug 'skwp/greplace.vim'
Plug 'mileszs/ack.vim', {'on': 'Ack!'}
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'Xuyuanp/nerdtree-git-plugin', {'on': 'NERDTreeToggle'}
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'scrooloose/nerdcommenter'
Plug 'ludovicchabant/vim-gutentags'

" Git releated plugins
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" JavaScript plugins
Plug 'pangloss/vim-javascript', {'for': ['javascript', 'json']}
Plug 'posva/vim-vue', {'for': 'vue'}

" CSS plugins
Plug 'ap/vim-css-color', {'for': ['html', 'php', 'css', 'scss']}

" PHP plugins
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}
Plug 'StanAngeloff/php.vim', {'for': 'php'}
Plug 'stephpy/vim-php-cs-fixer', {'for': 'php'}
Plug 'jwalton512/vim-blade', {'for': 'blade'}

" Auto complete and file location plugins
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-tmux'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-match-highlight'
Plug 'ncm2/ncm2-tern',  {'for': 'javascript', 'do': 'npm install'}
Plug 'ncm2/ncm2-cssomni', {'for': 'css'}
Plug 'ncm2/ncm2-html-subscope', {'for': 'html'}
Plug 'phpactor/ncm2-phpactor', {'for': 'php'}
Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}

" Snippet plugins
Plug 'ncm2/ncm2-ultisnips'
Plug 'SirVer/ultisnips'
call plug#end()

""""""""""""""""""""""""""General configurations""""""""""""""""""""""""""""""""

filetype plugin indent on

" Changing leader key
let mapleader=','

" Automatically sourcing vim and neovim config files
augroup auto_sourcing
	autocmd!
	autocmd BufWritePost ~/.config/nvim/init.vim source %
	autocmd BufWritePost ~/.vimrc source %
augroup END

""""""""""""""""""""""""""Remapping keyboard keys"""""""""""""""""""""""""""""""

" Deactivating arrow keys
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

" Split Management
nnoremap <tab> <c-w><c-w>
nnoremap <s-tab> <c-w><c-h>

" Opening Neovim and Vim configuration file
nmap <leader>nvim :tabedit ~/.config/nvim/init.vim<cr>
nmap <leader>vim :tabedit ~/.vimrc<cr>
nmap <leader>ulti :tabedit ~/Projects/dotfiles/neovim-config/UltiSnips<cr>

" Opening Laravel .env files
nmap <leader>env :tabedit ./.env<cr>
nmap <leader>enve :tabedit ./.env.example<cr>

" Add simple highlight removal
nmap <leader><space> :noh<cr>

" Search files by ctags tags
nmap <leader>f :tag<space>

" Exit terminal mode
:tnoremap <Esc> <C-\><C-n>

" Spliting windows
nmap <leader>vsp :vsplit<cr>
nmap <leader>sp :split<cr>

" Open terminal mode into the left side of screen
nmap <leader>tm :vsplit<cr> <tab> :terminal<cr> i

" Tabs Vim navigation
nnoremap th  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap td  :tabclose<CR>

" Forcing me to use new keys to navigate tabs [REMOVE THIS SOON AS POSSIBLE]
nmap gt :echo "Press 'tk' you idiot!!!"<cr>
nmap gT :echo "Press 'tj' you idiot!!!"<cr>

" Changing copy and paste from clipboard
vmap <leader>y "+y
vmap <leader>y "+y
nmap <leader>p "+p
nmap <leader>p "+p

" NERDTree - configurations
map <F1> :NERDTreeFind<cr> 
map <F2> :NERDTreeToggle<cr> 

" ctrlp - configurations
nmap <c-r> :CtrlPBufTag<cr>

" PHP Code Sniffer fix command
nmap <silent><leader>pcd :call PhpCsFixerFixDirectory()<CR>
nmap <silent><leader>pcf :call PhpCsFixerFixFile()<CR>

" Sort PHP use statements
vmap <leader>su ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<cr>'" }'"

"""""""""""""""""""""""""Plugins configurations""""""""""""""""""""""""""""""""

" DevIcons - configurations
set encoding=utf8
let g:WebDevIconsOS = 'Darwin'
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:DevIconsEnableFolderExtensionPatternMatching = 1

" NERDTree - configurations
let NERDTreeShowHidden=1
let g:NERDTreeIndicatorMapCustom = {
	\ "Modified"  : "✹",
	\ "Staged"    : "✚",
	\ "Untracked" : "✭",
	\ "Renamed"   : "➜",
	\ "Unmerged"  : "═",
	\ "Deleted"   : "✖",
	\ "Dirty"     : "✗",
	\ "Clean"     : "✔︎",
	\ 'Ignored'   : '☒',
	\ "Unknown"   : "?"
\ }
let NERDTreeNodeDelimiter = "\u263a" " smiley face

" let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

let g:ctrlp_prompt_mappings = {
		\ 'AcceptSelection("e")': ['<2-LeftMouse>'],
		\ 'AcceptSelection("t")': ['<cr>'],
    \ }

" NERDCommenter - configurations
let g:NERDSpaceDelims=1
let g:NERDCompactSexyComs=1
let g:NERDDefaultAlign='left'
let g:NERDCommentEmptyLines=1
let g:NERDTrimTrailingWhitespace=1

" Gutentags - configurations
let g:gutentags_ctags_exclude_wildignore=0
let g:gutentags_ctags_exclude=[
		\ '.git',
		\ '_ide_helper.php',
		\ 'storage/*',
		\ 'compiled.php',
		\ 'log',
		\ '.build',
		\ '.project',
		\ '.idea/*',
		\ '.settings/*'
	\ ]

" A.L.E - configurations
let g:ale_linters = {'php': ['phpcs', 'phpmd'] }
let g:ale_fixers = {'php': ['php-cs-fixer']}
let g:ale_php_phpcs_standard='./phpcs-rules.xml'
let g:ale_php_phpmd_ruleset='./phpmd-rules.xml'
let g:ale_php_cs_fixer_use_global=1
let g:ale_linters_explicit = 1
let g:ale_completion_enabled=1
let g:ale_sign_column_always=1
let g:ale_sign_offset = 1000
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
let g:airline#extensions#ale#enabled=1

" vim-gitgutter - configurations
set updatetime=3 " Time to gitgutter plugin respond to a change in the file
let g:gitgutter_max_signs=1000  " Default value

" vim-airline - configurations
set laststatus=2 " Configuring the plugin to appear all the time
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline_theme='violet'

" indentLine - configurations
let g:indentLine_setColors=1
let g:indentLine_char='¦'
let g:indentLine_setConceal=1
let g:indentLine_concealcursor='inc'
let g:indentLine_conceallevel=2

" ncm2 - configurations

" Enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANTE: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Omnifunc does not run in background and may probably block the editor.
" If you don't want to be blocked too often, you could add 180ms delay before the omni wrapper:
" 'on_complete': ['ncm2#on_complete#delay', 180, 'ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
au User Ncm2Plugin call ncm2#register_source({
		\ 'name' : 'css',
		\ 'priority': 9, 
		\ 'subscope_enable': 1,
		\ 'scope': ['css','scss'],
		\ 'mark': 'css',
		\ 'word_pattern': '[\w\-]+',
		\ 'complete_pattern': ':\s*',
		\ 'on_complete': ['ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
		\ })

" UltiSnips - configurations
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'

" Ack - configurations

" I don't want to jump to the first result automatically
cnoreabbrev Ack Ack!

" Ack - PHP Find Implementations
function! PhpImplementations(word)
    exe 'Ack "implements.*' . a:word . ' *($|{)"'
endfunction

" Ack - PHP Find Subclasses
function! PhpSubclasses(word)
    exe 'Ack "extends.*' . a:word . ' *($|{)"'
endfunction

noremap <Leader>fi :call PhpImplementations('<cword>')<CR>
noremap <Leader>fe :call PhpSubclasses('<cword>')<CR>

" Ack - PHP Find Usage
function! PhpUsage(word)
    exe 'Ack "::' . a:word . '\(|>' . a:word . '\("'
endfunction

noremap <Leader>fu :call PhpUsage('<cword>')<CR>
if executable('ag') 
  let g:ackprg = 'ag --vimgrep' " Setting up Ack to use Ag (The Silver Searcher)
endif

" greplace - configurations
set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'

" Phpactor - configurations

" Include use statement
nmap <Leader>u :call phpactor#UseAdd()<CR>

" Invoke the context menu
nmap <Leader>mm :call phpactor#ContextMenu()<CR>

" Invoke the navigation menu
nmap <Leader>nn :call phpactor#Navigate()<CR>

" Goto definition of class or class member under the cursor
nmap <Leader>o :call phpactor#GotoDefinition()<CR>

" Transform the classes in the current file
nmap <Leader>tt :call phpactor#Transform()<CR>

" Generate a new class (replacing the current file)
nmap <Leader>cc :call phpactor#ClassNew()<CR>

" Extract expression (normal mode)
nmap <silent><Leader>ee :call phpactor#ExtractExpression(v:false)<CR>

" Extract expression from selection
vmap <silent><Leader>ee :<C-U>call phpactor#ExtractExpression(v:true)<CR>

" Extract method from selection
vmap <silent><Leader>em :<C-U>call phpactor#ExtractMethod()<CR>

" vim-php-cs-fixer - configurations
let g:php_cs_fixer_level = "psr2"
let g:php_cs_fixer_config = "default"
let g:php_cs_fixer_rules = "@PSR1,@PSR2"

augroup auto-php-cs-fix-on-save
	autocmd!
	autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()
augroup END

"""""""""""""""Adding tab configs for some programming languages""""""""""""""""

" Tab control
set noexpandtab " Insert tabs rather than spaces for <Tab>
set smarttab " Tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4 " The visible width of tabs
set softtabstop=4 " Edit as if the tabs are 4 characters wide
set shiftwidth=4 " Number of spaces to use for indent and unindent
set shiftround " Round indent to a multiple of 'shiftwidth'

augroup auto_language_selection
	autocmd!
	autocmd Filetype xml setlocal ts=2 sw=2 expandtab
	autocmd Filetype html setlocal ts=2 sw=2 expandtab
	autocmd Filetype blade setlocal ts=2 sw=2 expandtab
	autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
	autocmd Filetype python setlocal ts=2 sw=2 expandtab
	autocmd Filetype javascript setlocal ts=2 sw=2 expandtab
	autocmd Filetype vue setlocal ts=2 sw=2 expandtab
	autocmd FileType json setlocal ts=2 sw=2 expandtab
	autocmd Filetype scss setlocal ts=2 sw=2 expandtab
	autocmd Filetype php setlocal ts=4 sw=4 expandtab
	autocmd Filetype sh setlocal ts=2 sw=2 expandtab
	autocmd Filetype sql setlocal ts=2 sw=2 expandtab
	autocmd Filetype java setlocal ts=4 sw=4 expandtab
	autocmd Filetype java setlocal colorcolumn=121
augroup END

""""""""""""""""""""""""""File indentation functions""""""""""""""""""""""""""""

" Function to format the content of a json file
augroup auto_format_json
	autocmd FileType json autocmd BufWritePre <buffer> %!python -m json.tool
augroup END

""""""""""""""""""""""""""Native Vim configs""""""""""""""""""""""""""""""""""""

" General
syntax on " Enabling the automatic detection of the code syntax
set magic " Set magic on, for regex
set autoread " Refresh files changes automatically
set history=1000 " Change history to 1000
set textwidth=120 " Automatic word wrapping
set backspace=indent,eol,start " make backspace behave in a sane manner
set autowriteall "Automatically write the file when switching buffers

" Appearance
set number " Show line numbers
set autoindent " Automatically set indent of new line
set smartindent " Automatically inserts one extra level of indentation in some cases
set ttyfast " Faster redrawing
set scrolloff=8 " Keep the cursor 8 lines from the top and the bottom
set wildmenu " Enhanced command line completion
set showmatch " Show matching braces
set mat=2 " How many tenths of a second to blink
set t_CO=256

" Searching
set ignorecase " case insensitive searching
set smartcase " case-sensitive if expresson contains a capital letter
set hlsearch " highlight search results
set incsearch " set incremental search, like modern browsers
set nolazyredraw " don't redraw while executing macros

" Error bells.
set noerrorbells
set visualbell
set t_vb=
set tm=500

" Prevents inserting two spaces after punctuation on a join (J)
set nojoinspaces

" Code folding settings
set foldmethod=syntax " fold based on indent
set foldlevelstart=99 " fold start level
set foldnestmax=10 " deepest fold is 10 levels
set nofoldenable " don't fold by default
set foldlevel=1

" Easy folding.
nnoremap zr zR
nnoremap zm zM

" Toggle invisible characters
set list
set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set showbreak=↪

" Setting up the color scheme
colorscheme space-vim-dark
let g:space_vim_dark_background = 234
hi Normal     ctermbg=NONE guibg=NONE
hi LineNr     ctermbg=NONE guibg=NONE
hi SignColumn ctermbg=NONE guibg=NONE

" Adding vertical line to delimit the number of columns allowed in the file
highlight ColorColumn ctermbg=white guibg=#A3A3A3
set termguicolors
set colorcolumn=81

" Notes and Tips
" - Press 'zz' to instantly center the line where the cursor is located
" - Press 'm' to create a mark and type a LOWERCASE letter to create a file mark
" - Press 'm' to create a mark and type a UPERCASE letter to create a cross files mark
