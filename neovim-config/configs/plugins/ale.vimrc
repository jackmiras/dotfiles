""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" A.L.E - Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ale_linters={
	\ 'yml': ['yamllint'],
	\ 'python': ['pylint'],
	\ 'yaml': ['yamllint'],
	\ 'javascript': ['eslint'],
	\ 'php': ['phpcs', 'phpmd', 'phpstan']
\}

let g:ale_fixers={
	\ 'php': ['phpcbf'],
	\ 'yml': ['prettier'],
	\ 'yaml': ['prettier'],
	\ 'python': ['autopep8', 'yapf'],
	\ 'javascript': ['prettier'],
	\ '*': ['remove_trailing_lines', 'trim_whitespace']
\}

let g:ale_lint_on_text_changed = 'never'
let g:ale_fix_on_save=1

let g:ale_sign_column_always=1
let g:ale_sign_offset=1000
let g:ale_sign_error='✖'
let g:ale_sign_warning='⚠'
let g:airline#extensions#ale#enabled=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" A.L.E PHP - Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ale_php_phpcs_executable='./vendor/bin/phpcs'
let g:ale_php_phpcs_standard='./phpcs-rules.xml'

let g:ale_php_phpmd_executable='./vendor/bin/phpmd'
let g:ale_php_phpmd_ruleset='./phpmd-rules.xml'

let g:ale_php_phpstan_executable='./vendor/bin/phpstan'
let g:ale_php_phpstan_configuration='./phpstan.neon'
let g:ale_php_phpstan_level=7

let g:ale_php_phpcbf_executable='./vendor/bin/phpcbf'
let g:ale_php_phpcbf_standard='PSR1,PSR2'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" A.L.E JavaScript - Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ale_javascript_eslint_executable='./node_modules/eslint/bin/eslint.js'
let g:ale_javascript_prettier_standard_executable='./node_modules/prettier/bin-prettier.js'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" A.L.E YAML - Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ale_yaml_yamllint_executable='/usr/local/bin/yamllint'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" A.L.E Python - Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ale_python_pylint_change_directory = 1
let g:ale_python_pylint_executable = '~/.local/bin/pylint'
let g:ale_python_pylint_options = './pylintrc'
let g:ale_python_pylint_use_global = 0
