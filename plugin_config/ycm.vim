" ============================
" YouCompleteMe
if version >= 703
	let g:ycm_complete_in_comments = 1
	let g:ycm_seed_identifiers_with_syntax = 1
	let g:ycm_collect_identifiers_from_comments_and_strings = 1
	let g:ycm_use_ultisnips_completer = 1
	let g:ycm_filetype_specific_completion_to_disable = {
				\ 'ruby' : 1,
				\ 'javascript' : 1,
				\ 'jsx' : 1,
				\}

	let g:ycm_semantic_triggers =  {
				\   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
				\   'ruby' : ['.', '::'],
				\   'gitcommit' : ['#', ':'],
				\ }

	" Overwritten so we can allow markdown completion.
	let g:ycm_filetype_blacklist = {
				\ 'notes': 1,
				\ 'unite': 1,
				\ 'tagbar': 1,
				\ 'pandoc': 1,
				\ 'qf': 1,
				\ 'vimwiki': 1,
				\ 'text': 1,
				\ 'infolog': 1,
				\ 'mail': 1,
				\ 'sql': 1,
				\}

	" Don't want preview window
	let g:ycm_add_preview_to_completeopt = 0
	let g:ycm_show_diagnostics_ui = 1
	let g:ycm_extra_conf_globlist = [ '~/work/*' ]
	let g:ycm_always_populate_location_list = 1
endif

