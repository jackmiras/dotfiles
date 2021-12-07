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
Plug 'lifepillar/vim-solarized8'

" General coding plugins
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
Plug 'w0rp/ale'

" Fuzzy file search plugins
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'skwp/greplace.vim'
Plug 'mileszs/ack.vim', {'on': 'Ack!'}
Plug 'scrooloose/nerdtree', {'on': ['NERDTreeToggle', 'NERDTreeFind']}
Plug 'Xuyuanp/nerdtree-git-plugin', {'on': ['NERDTreeToggle', 'NERDTreeFind']}
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'scrooloose/nerdcommenter'
Plug 'ludovicchabant/vim-gutentags'

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
Plug 'pangloss/vim-javascript', {'for': ['javascript', 'json']}
Plug 'carlitux/deoplete-ternjs', {'for': 'javascript', 'do': 'yarn global add tern' }

" Front-end plugins
Plug 'ap/vim-css-color', {'for': ['html', 'php', 'css', 'scss']}
Plug 'posva/vim-vue', {'for': 'vue'}
Plug 'alvan/vim-closetag'

" PHP plugins
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}
Plug 'StanAngeloff/php.vim', {'for': 'php'}
Plug 'jwalton512/vim-blade', {'for': 'php'}
Plug 'swekaj/php-foldexpr.vim', {'for': 'php'}

" Python plugins
Plug 'davidhalter/jedi-vim', {'for': 'python', 'do': 'pip3 install jedi'}

" Kotlin plugins
Plug 'udalov/kotlin-vim', {'for': 'kotlin'}

" Go plugins
Plug 'fatih/vim-go', {'for': 'go', 'do': ':GoUpdateBinaries' }

" Markdown plugins
Plug 'iamcco/markdown-preview.nvim', {'for': ['markdown', 'md'], 'do': 'cd app && yarn install'}

" Grammar plugins
Plug 'dpelle/vim-LanguageTool', {'for': ['markdown', 'md']}

" Container related plugins
Plug 'ekalinin/Dockerfile.vim', {'for': ['Dockerfile', 'Dockerfile.dev', 'Dockerfile.old', 'Dockerfile.base', 'Dockerfile-dev', 'Dockerfile-old', 'Dockerfile-base']}
Plug 'mrk21/yaml-vim', {'for': ['yaml', 'yml']}
Plug 'chr4/nginx.vim', {'for': 'conf'}
Plug 'hashivim/vim-terraform'

" Tracking time plugins
Plug 'wakatime/vim-wakatime'

call plug#end()
