""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PHP settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:deoplete#sources = {}
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources.php = ['phpactor', 'ultisnips', 'buffer']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" JavaScript settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:deoplete#sources#ternjs#docs = 1
let g:deoplete#sources#ternjs#sort = 1
let g:deoplete#sources#ternjs#guess = 0
let g:deoplete#sources#ternjs#types = 1
let g:deoplete#sources#ternjs#depths = 1
let g:deoplete#sources#ternjs#filter = 0
let g:deoplete#sources#ternjs#in_literal = 1
let g:deoplete#sources#ternjs#case_insensitive = 0
let g:deoplete#sources#ternjs#include_keywords = 1
let g:deoplete#sources#ternjs#expand_word_forward = 1
let g:deoplete#sources#ternjs#omit_object_prototype = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:deoplete#sources#jedi#ignore_errors = 0
let g:deoplete#sources#jedi#show_docstring = 1
let g:deoplete#sources#jedi#enable_typeinfo = 1
let g:deoplete#sources#jedi#statement_length = 100
let g:deoplete#sources#jedi#ignore_private_members = 0
