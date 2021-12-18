""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python host
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:python_host_prog=$HOME.'/.asdf/shims/python2'
let g:python3_host_prog=$HOME.'/.asdf/shims/python3'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable automatic syntax highlight to Neovim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Automatically sourcing vim and neovim settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup auto_sourcing
    autocmd!
    autocmd BufWritePost ~/.config/nvim/init.vim source %
    autocmd BufWritePost ~/.vimrc source %
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on " Enabling the automatic detection of the code syntax
set magic " Set magic on, for regex
set autoread " Refresh files changes automatically
set history=1000 " Change history to 1000
set textwidth=120 " Automatic word wrapping
set backspace=indent,eol,start " make backspace behave in a sane manner
set autowriteall "Automatically write the file when switching buffers

" Toggle invisible characters
set encoding=utf-8
set list
set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set showbreak=↪

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Appearance settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number " Show line numbers
set autoindent " Automatically set indent of new line
set smartindent " Automatically inserts one extra level of indentation in some cases
set ttyfast " Faster redrawing
set scrolloff=8 " Keep the cursor 8 lines from the top and the bottom
set wildmenu " Enhanced command line completion
set showmatch " Show matching braces
" highlight conflicts
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
set mat=2 " How many tenths of a second to blink
set t_CO=256

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Searching settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ignorecase " case insensitive searching
set smartcase " case-sensitive if expresson contains a capital letter
set hlsearch " highlight search results
set incsearch " set incremental search, like modern browsers
set lazyredraw " don't redraw while executing macros

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Errors settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set noerrorbells
set visualbell
set t_vb=
set tm=500

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Join settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nojoinspaces

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldmethod=syntax " fold based on indent
set foldlevelstart=99 " fold start level
set foldnestmax=10 " deepest fold is 10 levels
set nofoldenable " don't fold by default
set foldlevel=1

au FileType sh let g:sh_fold_enabled=5
au FileType sh let g:is_bash=1

syntax enable

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tab settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set noexpandtab " Insert tabs rather than spaces for <Tab>
set smarttab " Tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4 " The visible width of tabs
set softtabstop=4 " Edit as if the tabs are 4 characters wide
set shiftwidth=4 " Number of spaces to use for indent and unindent
set shiftround " Round indent to a multiple of 'shiftwidth'

augroup auto_language_selection
    autocmd!
    autocmd Filetype xml setlocal ts=2 sw=2 expandtab colorcolumn=81 textwidth=80
    autocmd Filetype html setlocal ts=2 sw=2 expandtab colorcolumn=81 textwidth=80
    autocmd Filetype ruby setlocal ts=2 sw=2 expandtab colorcolumn=81 textwidth=80
    autocmd Filetype python setlocal ts=4 sw=4 expandtab colorcolumn=80 textwidth=79 completeopt-=preview
    autocmd Filetype javascript setlocal ts=2 sw=2 expandtab colorcolumn=81 textwidth=80
    autocmd Filetype vue setlocal ts=2 sw=2 expandtab colorcolumn=81 textwidth=80
    autocmd FileType json setlocal ts=2 sw=2 expandtab colorcolumn=81 textwidth=80
    autocmd Filetype scss setlocal ts=2 sw=2 expandtab colorcolumn=81 textwidth=80
    autocmd Filetype php setlocal ts=4 sw=4 expandtab colorcolumn=81 textwidth=80 foldmethod=indent
    autocmd Filetype sh setlocal ts=2 sw=2 expandtab colorcolumn=81 textwidth=80
    autocmd Filetype sql setlocal ts=2 sw=2 expandtab colorcolumn=80 textwidth=80
    autocmd Filetype java setlocal ts=4 sw=4 expandtab colorcolumn=121 textwidth=120
    autocmd Filetype groovy setlocal ts=4 sw=4 expandtab colorcolumn=121 textwidth=120
    autocmd Filetype yaml setlocal ts=2 sw=2 expandtab colorcolumn=81 textwidth=80 foldmethod=indent
    autocmd Filetype yml setlocal ts=2 sw=2 expandtab colorcolumn=81 textwidth=80 foldmethod=indent
    au BufNewFile,BufRead *.neon setf yaml
    au BufNewFile,BufRead Jenkinsfile setf groovy
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autosave settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Triggered only when there is something to save. Always saving makes build watchers crazy
function! SaveIfUnsaved()
    if &modified
        :silent! w
    endif
endfunction

au FocusLost,BufLeave * :call SaveIfUnsaved()

" Read the file on focus/buffer enter
au FocusGained,BufEnter * :silent! !
