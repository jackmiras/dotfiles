""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Automatically sourcing vim and neovim settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup auto_sourcing
	autocmd!
	autocmd BufWritePost ~/.config/nvim/init.vim source %
	autocmd BufWritePost ~/.vimrc source %
augroup END
