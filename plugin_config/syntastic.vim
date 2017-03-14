" ============================
" Syntastic configuration
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_html_checkers = ['handlebars']
let g:syntastic_javascript_checkers = ['jshint']

" Hat tip http://git.io/SPIBfg
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_full_redraws = 1

let g:syntastic_perl_checkers = [ 'perl', 'perlcritic', 'podchecker' ]
let g:syntastic_enable_perl_checker = 1
let g:syntastic_c_remove_include_errors = 0
" let g:syntastic_c_checkers = [ 'gcc', 'make' ]
let g:syntastic_c_clang_check_post_args = ""
" let g:syntastic_enable_c_checker = 0

function! SetJavaScriptCheckers()
	if findfile('.eslintrc', '.;') != ''
		" Use eslint for projects w/ eslintrc
		let b:syntastic_checkers = ['eslint']
	elseif finddir('ProjectSettings', '.;') != ''
		" Use nothing for Unity projects.
		let b:syntastic_checkers = ['unityscript']
	else
		" Default to jshint
		let b:syntastic_checkers = ['jshint']
	endif
endfunction

autocmd FileType javascript call SetJavaScriptCheckers()

