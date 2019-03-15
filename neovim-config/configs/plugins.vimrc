""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug plugins list
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')
" Theme releated plugins
Plug 'vim-airline/vim-airline'
Plug 'luochen1990/rainbow'
Plug 'RRethy/vim-illuminate'
Plug 'lilydjwg/colorizer'
Plug 'luochen1990/rainbow'

" Color schemes
Plug 'liuchengxu/space-vim-dark'
Plug 'liuchengxu/space-vim-theme'
" Plug 'morhetz/gruvbox'

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
Plug 'airblade/vim-gitgutter'

" JavaScript plugins
Plug 'pangloss/vim-javascript', {'for': ['javascript', 'json']}
Plug 'posva/vim-vue', {'for': 'vue'}

" CSS plugins
Plug 'ap/vim-css-color', {'for': ['html', 'php', 'css', 'scss']}

" PHP plugins
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}
Plug 'StanAngeloff/php.vim', {'for': 'php'}
Plug 'jwalton512/vim-blade', {'for': 'blade'}
Plug 'vim-scripts/phpfolding.vim', {'for': 'php'}

" NGINX Plugin
Plug 'chr4/nginx.vim', {'for': 'conf'}

" Kotlin plugins
Plug 'udalov/kotlin-vim', {'for': 'kotlin'}

" Autocomplete plugin
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'phpactor/phpactor' ,  {'do': 'composer install', 'for': 'php'}
Plug 'kristijanhusak/deoplete-phpactor'

" Auto complete and file location plugins
Plug 'SirVer/ultisnips'

call plug#end()
