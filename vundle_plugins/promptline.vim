" =============================================================================
" Plugin Name: promptline.vim
" Description: generate prompt for shell
" URL:
" =============================================================================

if exists('g:vundle_installing_plugins')
	Plugin 'edkolev/promptline.vim'
	finish
endif

let g:promptline_theme = 'airline'

let g:promptline_preset = {
			\'a' : [ promptline#slices#user() ],
			\'b' : [ promptline#slices#cwd() ],
			\'c' : [ promptline#slices#vcs_branch(), promptline#slices#jobs() ],
			\'warn' : [ promptline#slices#last_exit_code() ]}
