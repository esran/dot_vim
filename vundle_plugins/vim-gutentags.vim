" =============================================================================
" Plug Name: vim-gutentags
" Description: automatically create and update tags file for a project
" URL:
" =============================================================================

if version > 703
	if exists('g:vundle_installing_plugins')
	Plug 'ludovicchabant/vim-gutentags'
	finish
	endif

	let g:gutentags_exclude = [ '*/debian/*', '*/debian-*/*' ]
endif
