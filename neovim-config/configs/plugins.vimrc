""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug plugins list
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')
" Theme releated plugins
Plug 'vim-airline/vim-airline'
Plug 'luochen1990/rainbow'
Plug 'RRethy/vim-illuminate'
Plug 'lilydjwg/colorizer'

" Color schemes
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
Plug 'jwalton512/vim-blade', {'for': 'blade'}

" NGINX Plugin
Plug 'chr4/nginx.vim', {'for': 'conf'}

" Auto complete and file location plugins
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-tmux'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-match-highlight'
Plug 'ncm2/ncm2-tern',  {'for': 'javascript', 'do': 'npm install'}
Plug 'ncm2/ncm2-cssomni', {'for': 'css'}
Plug 'ncm2/ncm2-html-subscope', {'for': 'html'}
Plug 'phpactor/ncm2-phpactor', {'for': 'php'}

" Snippet plugins
Plug 'ncm2/ncm2-ultisnips'
Plug 'SirVer/ultisnips'

" Debug plugins
Plug 'vim-vdebug/vdebug'
call plug#end()
