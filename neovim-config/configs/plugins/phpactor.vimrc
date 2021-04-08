""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Phpactor re-mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Include use statement
nmap <leader>u :call phpactor#UseAdd()<cr>

" Expand the class name from unqualified name to fully qualified name.
nmap <leader>ce :call phpactor#ClassExpand()<cr>

" Import all non-resolvable classes in the current class
nmap <leader>imc :call phpactor#ImportMissingClasses()<cr>

nmap <leader>hh :call phpactor#Hover()<cr>

" Invoke the context menu
nmap <leader>mm :call phpactor#ContextMenu()<cr>

" Find references
nmap <leader>fr :call phpactor#FindReferences()<cr>

" Invoke the navigation menu
nmap <leader>nn :call phpactor#Navigate()<cr>

" Goto definition of class or class member under the cursor
nmap <leader>o :call phpactor#GotoDefinitionTab()<cr>

" Goto definition of class but open in a vertical split
nmap <leader>ov :call phpactor#GotoDefinitionVsplit()<cr>

" Goto definition of class but open in a horizontal split
nmap <leader>oh :call phpactor#GotoDefinitionHsplit()<cr>

" Transform the classes in the current file
nmap <leader>tt :call phpactor#Transform()<cr>

" Generate a new class (replacing the current file)
nmap <leader>cc :call phpactor#ClassNew()<cr>

" Extract expression (normal mode)
nmap <silent><leader>ee :call phpactor#ExtractExpression(v:false)<cr>

" Extract expression from selection
vmap <silent><leader>ee :<C-U>call phpactor#ExtractExpression(v:true)<cr>

" Extract method from selection
vmap <silent><leader>em :<C-U>call phpactor#ExtractMethod()<cr>
