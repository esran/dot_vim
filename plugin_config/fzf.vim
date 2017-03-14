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
