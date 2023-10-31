""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug plugins list
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.config/nvim/plugged')
" Theme releated plugins
Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/lightline.vim'

" Color schemes
Plug 'folke/tokyonight.nvim'
Plug 'jackmiras/space-vim-dark'
Plug 'dracula/vim', { 'as': 'dracula' }

" General coding plugins
Plug 'w0rp/ale'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Fuzzy file search plugins
Plug 'skwp/greplace.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'Yggdroot/LeaderF', {'do': ':LeaderfInstallCExtension'}

" File tree plugins
Plug 'preservim/nerdtree', {'on': ['NERDTreeToggle', 'NERDTreeFind']}
Plug 'Xuyuanp/nerdtree-git-plugin', {'on': ['NERDTreeToggle', 'NERDTreeFind']}

" Git releated plugins
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Autocomplete plugins
Plug 'SirVer/ultisnips'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile', 'branch': 'master'}

Plug 'pappasam/coc-jedi', {
		\ 'for': 'python',
		\ 'do': 'yarn install --frozen-lockfile && yarn build',
		\ 'branch': 'main'
	\}

" Front-end plugins
Plug 'mattn/emmet-vim', {'for': ['html', 'vue', 'blade.php']}
Plug 'alvan/vim-closetag', {'for': ['javascript', 'php', 'html', 'vue']}

" PHP plugins
Plug 'jwalton512/vim-blade', {'for': ['php', 'blade.php', 'blade']}

" Go plugins
Plug 'fatih/vim-go', {'for': ['go', 'golang'], 'do': ':GoUpdateBinaries'}

" Markdown plugins
Plug 'iamcco/markdown-preview.nvim', {'for': ['markdown', 'md'], 'do': 'cd app && yarn install'}

" Container related plugins
Plug 'chr4/nginx.vim', {'for': 'conf'}
Plug 'hashivim/vim-terraform', {'for': 'tf'}

call plug#end()
