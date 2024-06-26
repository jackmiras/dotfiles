""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" A.L.E - Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ale_linters={
	\ 'go': ['gopls'],
	\ 'yml': ['yamllint'],
	\ 'yaml': ['yamllint'],
	\ 'sh': ['shellcheck'],
	\ 'javascript': ['eslint'],
	\ 'python': ['bandit', 'flake8'],
	\ 'terraform': ['fmt', 'tflint'],
	\ 'php': ['phpcs', 'phpmd', 'phpstan']
\}

let g:ale_fixers={
	\ 'yml': ['prettier'],
	\ 'yaml': ['prettier'],
	\ 'php': ['php_cs_fixer'],
	\ 'javascript': ['prettier'],
	\ 'python': ['black', 'isort'],
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
let g:ale_php_phpstan_level=9

let g:ale_php_psalm_executable='./vendor/bin/psalm'

let g:ale_php_cs_fixer_executable='./vendor/bin/php-cs-fixer'
let g:ale_php_cs_fixer_options='--config=./.php-cs-fixer.php --using-cache=no'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" A.L.E JavaScript - Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ale_javascript_eslint_options='./.eslintrc.js'
let g:ale_javascript_prettier_options='./.prettierrc.js'
let g:ale_javascript_eslint_executable='./node_modules/eslint/bin/eslint.js'
let g:ale_javascript_prettier_standard_executable='./node_modules/prettier/bin-prettier.js'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" A.L.E YAML - Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ale_yaml_yamllint_executable='/usr/local/bin/yamllint'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" A.L.E Python - Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ale_python_bandit_options=''
let g:ale_python_bandit_use_config=1
let g:ale_python_bandit_use_global=0
let g:ale_python_bandit_auto_pipenv=0
let g:ale_python_bandit_executable=$HOME.'/.asdf/shims/bandit'

let g:ale_python_black_options=''
let g:ale_python_black_use_global=0
let g:ale_python_black_auto_pipenv=0
let g:ale_python_black_change_directory=1
let g:ale_python_black_executable=$HOME.'/.asdf/shims/black'

let g:ale_python_flake8_options=''
let g:ale_python_flake8_use_global=0
let g:ale_python_flake8_auto_pipenv=0
let g:ale_python_flake8_change_directory=1
let g:ale_python_flake8_executable=$HOME.'/.asdf/shims/flake8'

let g:ale_python_isort_options=''
let g:ale_python_isort_use_global=0
let g:ale_python_isort_executable=$HOME.'/.asdf/shims/isort'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Terraform - Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_terraform_fmt_options=''
let g:ale_terraform_fmt_executable='terraform'
let g:ale_terraform_tflint_options='--module -f json'
let g:ale_terraform_tflint_executable="/home/jackmiras/.local/bin/tflint"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" sh - Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Disable rule SC2034 to .env files
autocmd BufEnter *.env* let b:ale_sh_shellcheck_exclusions = 'SC1037,SC2034,SC2154,SC2209'
