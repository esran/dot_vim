" ============================
" FZF configuration
" Git project root find
function! s:find_git_root()
	return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction
command! ProjectFiles execute 'Files' s:find_git_root()

nnoremap <leader>f :ProjectFiles<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>t :Tags<CR>

" edit vim files
if has('nvim')
	nnoremap <leader>c :Files ~/.config/nvim/<CR>
	nnoremap <leader>v :Files ~/.vim/<CR>
	nnoremap <leader>p :Files ~/.vim/plugin_config/<CR>
else
	nnoremap <leader>v :Files ~/.vim/<CR>
	nnoremap <leader>p :Files ~/.vim/plugin_config/<CR>
endif

" ripgrep search on files
command! -bang -nargs=* Find
			\ call fzf#vim#grep(
			\ 'rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '
			\ .shellescape(<q-args>),
			\ 1,
			\ <bang>0)
command! -bang -nargs=* ProjectFind
			\ call fzf#vim#grep(
			\ 'rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '
			\ .shellescape(<q-args>).' '.s:find_git_root(),
			\ 1,
			\ <bang>0)
