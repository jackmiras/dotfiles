""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug plugins list
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')
" Theme releated plugins
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'

" Color schemes
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
Plug 'Yggdroot/LeaderF', {'do': ':LeaderfInstallCExtension'}

" File tree plugins
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'scrooloose/nerdtree', {'on': ['NERDTreeToggle', 'NERDTreeFind']}
Plug 'Xuyuanp/nerdtree-git-plugin', {'on': ['NERDTreeToggle', 'NERDTreeFind']}

" Git releated plugins
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Autocomplete plugin
Plug 'SirVer/ultisnips'
Plug 'neoclide/coc.nvim', {
		\ 'do': 'yarn install --frozen-lockfile' .
			\ ' && yarn global add intelephense' .
			\ ' && yarn global add bash-language-server' .
			\ ' && brew install hashicorp/tap/terraform-ls' .
			\ ' && yarn global add dockerfile-language-server-nodejs' ,
		\ 'branch': 'master',
	\}

Plug 'pappasam/coc-jedi', {
		\ 'for': 'python',
		\ 'do': 'yarn install --frozen-lockfile && yarn build',
		\ 'branch': 'main'
	\}

" Front-end plugins
Plug 'mattn/emmet-vim', {'for': ['html', 'vue', 'blade.php']}
Plug 'alvan/vim-closetag', {'for': ['javascript', 'php', 'html', 'vue']}

" PHP plugins
Plug 'jwalton512/vim-blade', {'for': 'php'}

" Go plugins
Plug 'fatih/vim-go', {'for': ['go', 'golang'], 'do': ':GoUpdateBinaries'}

" Markdown plugins
Plug 'iamcco/markdown-preview.nvim', {'for': ['markdown', 'md'], 'do': 'cd app && yarn install'}

" Container related plugins
Plug 'chr4/nginx.vim', {'for': 'conf'}
Plug 'hashivim/vim-terraform', {'for': 'tf'}

call plug#end()
