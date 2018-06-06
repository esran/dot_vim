" ------------------
" incsearch settings
" ------------------
	map /  <Plug>(incsearch-forward)
	map ?  <Plug>(incsearch-backward)
	map g/ <Plug>(incsearch-stay)

	" Highlight search but automatically disable
	" highlight after search commands finished
	set hlsearch
	let g:incsearch#auto_nohlsearch = 1

	map n  <Plug>(incsearch-nohl-n)
	map N  <Plug>(incsearch-nohl-N)
	map *  <Plug>(incsearch-nohl-*)
	map #  <Plug>(incsearch-nohl-#)
	map g* <Plug>(incsearch-nohl-g*)
	map g# <Plug>(incsearch-nohl-g#)

	" Have n/N behave consistently rather than swap
	" based on direction of seach
	let g:incsearch#consistent_n_direction = 1

	" Use very magic search option
	let g:incsearch#magic = '\v'


    function! s:config_easyfuzzymotion(...) abort
        return extend(copy({
                    \   'converters': [incsearch#config#fuzzyword#converter()],
                    \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
                    \   'keymap': {"\<CR>": '<Over>(easymotion)'},
                    \   'is_expr': 0,
                    \   'is_stay': 1
                    \ }), get(a:, 1, {}))
    endfunction

    noremap <silent><expr> <Leader>/ incsearch#go(<SID>config_easyfuzzymotion())
