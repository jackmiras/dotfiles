""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PHP settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:deoplete#custom#option = {}
let g:deoplete#enable_at_startup = 1
let g:deoplete#custom#option.php = ['phpactor', 'ultisnips', 'buffer']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" JavaScript settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:deoplete#custom#option#ternjs#docs = 1
let g:deoplete#custom#option#ternjs#sort = 1
let g:deoplete#custom#option#ternjs#guess = 0
let g:deoplete#custom#option#ternjs#types = 1
let g:deoplete#custom#option#ternjs#depths = 1
let g:deoplete#custom#option#ternjs#filter = 0
let g:deoplete#custom#option#ternjs#in_literal = 1
let g:deoplete#custom#option#ternjs#case_insensitive = 0
let g:deoplete#custom#option#ternjs#include_keywords = 1
let g:deoplete#custom#option#ternjs#expand_word_forward = 1
let g:deoplete#custom#option#ternjs#omit_object_prototype = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:deoplete#custom#option#jedi#ignore_errors = 0
let g:deoplete#custom#option#jedi#show_docstring = 1
let g:deoplete#custom#option#jedi#enable_typeinfo = 1
let g:deoplete#custom#option#jedi#statement_length = 100
let g:deoplete#custom#option#jedi#ignore_private_members = 0
