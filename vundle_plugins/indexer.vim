" =============================================================================
" Plugin Name: indexer
" Description: auto generate tags index
" URL:
" =============================================================================

if exists('g:vundle_installing_plugins')
	Plugin 'DfrankUtil'
	Plugin 'vimprj'
	Plugin 'indexer.tar.gz'
	finish
endif

let g:indexer_disableCtagsWarning = 1
