""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-blade settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:blade_custom_directives = ['datetime', 'javascript']

let g:blade_custom_directives_pairs = {
      \   'if': 'endif',
      \   'cache': 'endcache',
      \   'error': 'enderror',
	  \   'forelse': 'endforelse',
      \   'foreach': 'endforeach',
      \   'section': 'endsection',
      \   'markdown': 'endmarkdown',
      \ }
