if version > 703
	if exists('g:vundle_installing_plugins')
		Plug 'Shougo/vimproc.vim' | Plug 'Shougo/unite.vim'
		Plug 'Shougo/unite-outline'
		finish
	endif

	let g:unite_source_history_yank_enable = 1
	call unite#filters#matcher_default#use(['matcher_fuzzy'])

	" For ag or ack.
	if executable('ag')
		" let g:unite_source_rec_async_command = 'ag --nocolor --nogroup --hidden -g ""'
		let g:unite_source_grep_command = 'ag'
		let g:unite_source_grep_default_opts = '--nocolor -t --noheading -S -i'
		let g:unite_source_grep_recursive_opt = ''
	elseif executable('ack-grep')
		let g:unite_source_grep_command = 'ack-grep'
		let g:unite_source_grep_default_opts = '--no-heading --no-color -a -H -i'
		let g:unite_source_grep_recursive_opt = '-r'
	endif

	" nnoremap <leader>u :<C-u>Unite -buffer-name=Parent -vertical file_rec/async:!<cr>
	" nnoremap <leader>n :<C-u>Unite -buffer-name=Files -vertical file<cr>
	" nnoremap <leader>y :<C-u>Unite -buffer-name=Yanks -vertical history/yank<cr>
	" nnoremap <leader>b :<C-u>Unite -buffer-name=Buffers -vertical buffer<cr>
	" nnoremap <leader>g :<C-u>Unite grep:.<cr>
	" nnoremap <leader>a :<C-u>Unite -buffer-name=Word grep:.::<c-r><c-w><cr>
	nnoremap <leader>f :<C-u>Unite -buffer-name=Tags -vertical -winwidth=50 outline<cr>

	" Detect if in a source controlled directory.  If not, then fall back to the
	" file_rec/async
	" if !empty(glob(".git"))
	"     map <leader>f :Unite -start-insert -no-split -buffer-name=files file_rec/git<cr>
	" else
	"     map <leader>f :Unite -start-insert -no-split -buffer-name=files file_rec/async<cr>
	" endif
	" map <leader>b :Unite -auto-preview -start-insert -buffer-name=buffers -no-split buffer<cr>
	" map <leader>s :Unite -auto-preview -no-split -buffer-name=search grep:.<cr>
	map <leader>o :Unite -start-insert -vertical -buffer-name=outline outline<cr>
	" map <leader>l :Unite -start-insert -buffer-name=lines line<cr>
	" map <leader>r :Unite -start-insert -buffer-name=registers register<cr>
	" map <leader>y :Unite -no-split -buffer-name=yank history/yank<cr>
	" map <leader>vf :VimFiler<cr>
	" map <leader>gc :Unite git-conflict<cr>
	" map <leader>hc :Unite -no-split -buffer-name=command history/command<cr>
	" map <leader>hs :Unite -no-split -buffer-name=search history/search<cr>
	" map <leader>n :UniteNext<cr>
	" map <leader>p :UnitePrevious<cr>

endif
