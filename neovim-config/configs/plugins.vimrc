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

" General coding plugins
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
Plug 'w0rp/ale'

" Fuzzy file search plugins
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
Plug 'tpope/vim-fugitive'

" Autocomplete plugin
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'kristijanhusak/deoplete-phpactor'
Plug 'SirVer/ultisnips'

" JavaScript plugins
Plug 'pangloss/vim-javascript', {'for': ['javascript', 'json']}

" Front-end plugins
Plug 'ap/vim-css-color', {'for': ['html', 'php', 'css', 'scss']}
Plug 'posva/vim-vue', {'for': 'vue'}

" PHP plugins
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}
Plug 'StanAngeloff/php.vim', {'for': 'php'}
Plug 'jwalton512/vim-blade', {'for': 'blade'}
Plug 'swekaj/php-foldexpr.vim', {'for': 'php'}

" Kotlin plugins
Plug 'udalov/kotlin-vim', {'for': 'kotlin'}

" Go plugins
Plug 'fatih/vim-go', {'for': 'go', 'do': ':GoUpdateBinaries' }

" Container related plugins
Plug 'ekalinin/Dockerfile.vim', {'for': ['Dockerfile', 'Dockerfile.dev', 'Dockerfile.old', 'Dockerfile.base', 'Dockerfile-dev', 'Dockerfile-old', 'Dockerfile-base']}
Plug 'mrk21/yaml-vim', {'for': ['yaml', 'yml']}
Plug 'chr4/nginx.vim', {'for': 'conf'}
Plug 'hashivim/vim-terraform'

call plug#end()
