""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug plugins list
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')
" Theme releated plugins
Plug 'vim-airline/vim-airline'
Plug 'luochen1990/rainbow', {'for': ['php', 'javascript', 'css', 'scss', 'python', 'go', 'elixir']}
Plug 'RRethy/vim-illuminate'
Plug 'lilydjwg/colorizer'
Plug 'ryanoasis/vim-devicons'

" Color schemes
Plug 'liuchengxu/space-vim-dark'
Plug 'lifepillar/vim-solarized8'

" General coding plugins
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
Plug 'w0rp/ale'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'scrooloose/nerdcommenter'

" Fuzzy file search plugins
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'skwp/greplace.vim'
Plug 'mileszs/ack.vim', {'on': 'Ack!'}
Plug 'ludovicchabant/vim-gutentags'

" File tree plugins
Plug 'scrooloose/nerdtree', {'on': ['NERDTreeToggle', 'NERDTreeFind']}
Plug 'Xuyuanp/nerdtree-git-plugin', {'on': ['NERDTreeToggle', 'NERDTreeFind']}
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Git releated plugins
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Autocomplete plugin
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'kristijanhusak/deoplete-phpactor'
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'SirVer/ultisnips'

" JavaScript plugins
Plug 'carlitux/deoplete-ternjs', {'for': 'javascript', 'do': 'yarn global add tern' }

" Front-end plugins
Plug 'alvan/vim-closetag', {'for': ['javascript', 'php', 'html', 'vue']}
Plug 'mattn/emmet-vim', {'for': ['html', 'vue', 'blade.php']}

" PHP plugins
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}
Plug 'jwalton512/vim-blade', {'for': 'php'}

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
