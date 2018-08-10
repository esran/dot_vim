" ============================
" gutentags
let g:gutentags_ctags_exclude = [
			\ '*/debian/*'
			\ , '*/debian-*/*'
			\ , '*/contrib/edgistar/edgistar_*/edgistar_*--*.sql'
            \ , 'build/*'
			\ ]

" let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" let g:gutentags_ctags_tagfile = '.tags'

let g:gutentags_modules = [ 'gtags_cscope', 'ctags', 'cscope' ]

" let s:vim_tags = expand('~/.cache/tags')
" let g:gutentags_cache_dir = s:vim_tags

let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" if !isdirectory(s:vim_tags)
"    silent! call mkdir(s:vim_tags, 'p')
" endif

" only reference git files in git repos
let g:gutentags_file_list_command = {
            \ 'markers': {
            \ '.git': 'git ls-files',
            \ '.hg': 'hg files',
            \ },
            \ }

set cscopetag
set cscopeprg='gtags-cscope'
set nocscopeverbose
