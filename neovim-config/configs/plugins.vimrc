""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug plugins list
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')
" Theme releated plugins
Plug 'lilydjwg/colorizer'
Plug 'RRethy/vim-illuminate'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'luochen1990/rainbow', {'for': ['php', 'javascript', 'css', 'scss', 'python', 'go', 'elixir']}

" Color schemes
Plug 'lifepillar/vim-solarized8'
Plug 'liuchengxu/space-vim-dark'

" General coding plugins
Plug 'w0rp/ale'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Fuzzy file search plugins
Plug 'skwp/greplace.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mileszs/ack.vim', {'on': 'Ack!'}
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }

" File tree plugins
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'scrooloose/nerdtree', {'on': ['NERDTreeToggle', 'NERDTreeFind']}
Plug 'Xuyuanp/nerdtree-git-plugin', {'on': ['NERDTreeToggle', 'NERDTreeFind']}

" Git releated plugins
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Autocomplete plugin
Plug 'roxma/nvim-yarp'
Plug 'SirVer/ultisnips'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'kristijanhusak/deoplete-phpactor'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" JavaScript plugins
Plug 'carlitux/deoplete-ternjs', {'for': 'javascript', 'do': 'yarn global add tern' }

" Front-end plugins
Plug 'mattn/emmet-vim', {'for': ['html', 'vue', 'blade.php']}
Plug 'alvan/vim-closetag', {'for': ['javascript', 'php', 'html', 'vue']}

" PHP plugins
Plug 'jwalton512/vim-blade', {'for': 'php'}
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}

" Python plugins
Plug 'davidhalter/jedi-vim', {'for': 'python', 'do': 'pip3 install jedi'}

" Go plugins
Plug 'fatih/vim-go', {'for': 'go', 'do': ':GoUpdateBinaries' }

" Markdown plugins
Plug 'iamcco/markdown-preview.nvim', {'for': ['markdown', 'md'], 'do': 'cd app && yarn install'}

" Container related plugins
Plug 'chr4/nginx.vim', {'for': 'conf'}
Plug 'hashivim/vim-terraform', {'for': 'tf'}

" Tracking time plugins
Plug 'wakatime/vim-wakatime'

call plug#end()
