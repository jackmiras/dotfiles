""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader key remapping
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=','

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Easy copy and paste remapping
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <leader>y "+y
noremap <leader>p "+p
noremap <leader>d "+d

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabs remapping
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap th  :tabfirst<cr>
nnoremap tk  :tabnext<cr>
nnoremap tj  :tabprev<cr>
nnoremap tl  :tablast<cr>
nnoremap tt  :tabedit<space>
nnoremap td  :tabclose<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Easy folding remapping
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap zr zR
nnoremap zm zM

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Esc remapping
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap jj <esc>
inoremap jj <esc>
snoremap jj <esc>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Window management remapping
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Toggling between windows
nnoremap <tab> <c-w><c-w>
nnoremap <s-tab> <c-w><c-h>

" Spliting windows
nmap <leader>vsp :vsplit<cr>
nmap <leader>sp :split<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Opening files remapping
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Opening Neovim and Vim configuration file
nmap <leader>nvim :tabedit ~/.config/nvim/init.vim<cr>
nmap <leader>vim :tabedit ~/.vimrc<cr>
nmap <leader>ulti :tabedit ~/Projects/dotfiles/neovim-config/UltiSnips<cr>

" Opening Laravel .env files
nmap <leader>env :tabedit ./.env<cr>
nmap <leader>enve :tabedit ./.env.example<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlight remapping
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Add simple highlight removal
nmap <leader><space> :noh<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Modes remapping
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Exit terminal mode
:tnoremap <esc> <c-\><c-n>

" Sort PHP use statements
vmap <leader>su ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<cr>'" }'"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Deactivated keys
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Deactivating arrow keys
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Deactivating h,j,k,l keys
noremap h <nop>
noremap j <nop>
noremap k <nop>
noremap l <nop>

" Deactivating esc key
inoremap <esc> <esc> i
nnoremap <esc> <nop>
