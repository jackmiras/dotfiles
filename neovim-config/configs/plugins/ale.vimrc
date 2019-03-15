""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" A.L.E settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ale_linters={'php': ['phpcs', 'phpmd', 'phpstan']}
let g:ale_fixers={'*': ['remove_trailing_lines', 'trim_whitespace'], 'php': ['phpcbf']}

let g:ale_lint_on_text_changed = 'never'
let g:ale_fix_on_save=1

let g:ale_php_phpcs_executable='./vendor/bin/phpcs'
let g:ale_php_phpcs_standard='./phpcs-rules.xml'

let g:ale_php_phpmd_executable='./vendor/bin/phpmd'
let g:ale_php_phpmd_ruleset='./phpmd-rules.xml'

let g:ale_php_phpstan_executable='./vendor/bin/phpstan'
let g:ale_php_phpstan_configuration='./phpstan.neon'
let g:ale_php_phpstan_level=7

let g:ale_php_phpcbf_executable='./vendor/bin/phpcbf'
let g:ale_php_phpcbf_standard='PSR1,PSR2'

let g:ale_sign_column_always=1
let g:ale_sign_offset=1000
let g:ale_sign_error='✖'
let g:ale_sign_warning='⚠'
let g:airline#extensions#ale#enabled=1
