" =============================================================================
" Plug Name: indexer
" Description: auto generate tags index
" URL:
" =============================================================================

" disabling as this might be causing crashes :(
finish

if exists('g:vundle_installing_plugins')
	Plug 'DfrankUtil'
	Plug 'vimprj'
	Plug 'indexer.tar.gz'
	finish
endif

let g:indexer_disableCtagsWarning = 1
