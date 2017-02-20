" ============================
" Load plugins, using vim-plug
call plug#begin()

" Look and Feel
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Color schemes
if has('nvim')
	Plug 'Samuel-Phillips/nvim-colors-solarized'
else
	Plug 'altercation/vim-colors-solarized'
endif
Plug 'rhysd/vim-color-spring-night'
Plug 'Reewr/vim-monokai-phoenix'

" Completion
if has('nvim')
	Plug 'Shougo/deoplete.nvim'  " , { 'do': ':UpdateRemotePlugins' }
	Plug 'tweekmonster/deoplete-clang2'
	Plug 'c9s/perlomni.vim'
else
	if version >= 704
		Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
	endif
endif

" Finding Stuff
Plug 'junegunn/fzf', { 'dir': '~/stuff/fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Editing Tools
Plug 'mutewinter/vim-autoreadwatch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'majutsushi/tagbar'
Plug 'cohama/lexima.vim'
Plug 'tomtom/tcomment_vim'
Plug 'battlesnake/pgsql.vim'
if !has('nvim') && version > 703
	Plug 'haya14busa/incsearch.vim'
endif

" Coding Tools
Plug 'scrooloose/syntastic'
if has('nvim') || version >= 704
	Plug 'ludovicchabant/vim-gutentags'
endif
Plug 'autoload_cscope.vim'
Plug 'chazy/cscope_maps'
Plug 'tpope/vim-endwise'

" Source Countril
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

call plug#end()
" ============================

" Source files form vim configuration
source ~/.vim/platforms.vim
source ~/.vim/config.vim
source ~/.vim/commands.vim
source ~/.vim/mappings.vim
source ~/.vim/functions.vim
source ~/.vim/autocmds.vim

" Load a host specific file, if present
let s:host_vimrc = $HOME . '/.vim/host/' . hostname() . '/vimrc'
if filereadable(s:host_vimrc)
	execute 'source ' . s:host_vimrc
endif

" ============================
" Enable Shougo/deoplete
let g:deoplete#enable_at_startup = 1
" Automatic tab completion
inoremap <silent><expr> <Tab>
			\ pumvisible() ? "\<C-n>" : "<Tab>"

" ============================
" FZF configuration
" Git project root find
function! s:find_git_root()
	return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction
command! ProjectFiles execute 'Files' s:find_git_root()

nnoremap <leader>t :ProjectFiles<CR>
nnoremap <leader>b :Buffers<CR>

" ============================
" NERDTree configuration
nnoremap <silent><leader>nn :NERDTreeToggle<CR>:wincmd =<CR>
nnoremap <silent><leader>nf :NERDTreeFind<CR>:wincmd =<CR>

let g:NERDTreeShowBookmarks = 1
let g:NERDTreeChDirMode = 1
let g:NERDTreeMinimalUI = 1
" let g:NERDTreeForceMac = 1
" Close Vim if NERDTree is the last buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType")
			\&& b:NERDTreeType == "primary") | q | endif

" Filter some files out
let g:NERDTreeIgnore = [ '\~$', '.o$[[file]]' ]

" https://github.com/ryanoasis/vim-webdevicons
" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
	exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermfg='. a:fg .' guifg='. a:guifg
	exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

" C and H files
call NERDTreeHighlightFile('c', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('cpp', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('h', 'green', 'none', 'green', '#151515')

" ============================
" air-line configuration
"let g:airline_theme = 'jellybeans'
" let g:airline_theme = 'solarized'
let g:airline_powerline_fonts = 1
let g:airline_detect_modified = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#hunks#enabled = 0
let g:airline_mode_map = {
			\ 'n'  : 'N',
			\ 'i'  : 'I',
			\ 'R'  : 'R',
			\ 'v'  : 'V',
			\ 'V'  : 'VL',
			\ 'c'  : 'CMD',
			\ '' : 'VB',
			\ }
" Show the current working directory folder name
let g:airline_section_b = '%{substitute(getcwd(), ".*\/", "", "g")} '
" Just show the file name
let g:airline_section_c = '%{expand("%:p:h:t")}/%t'
let g:airline_section_y = ''
let g:airline_section_z = '%3p%% %#__accent_bold#%4l%#__restore__#:%3'
let g:airline_section_z = '%3p%% %{substitute(line("."), "\\v(\\d)((\\d\\d\\d)+\\d@!)@=", "\\1,", "g")}|%{substitute(line("$"), "\\v(\\d)((\\d\\d\\d)+\\d@!)@=", "\\1,", "g")}'

let g:airline#extensions#default#layout = [
			\ [ 'a', 'b', 'warning', 'c' ],
			\ [ 'x', 'y', 'z' ]
			\ ]

" let g:airline_section_c = '%t'
" " Just show the file name
" " let g:airline_section_d = '%t'
" " let g:airline_section_y = ''
" " let g:airline_section_z = '%3p%% %#__accent_bold#%4l%#__restore__#:%3'
" " let g:airline_section_z = '%3p%% %{col(".")} %{substitute(line("."), "\\v(\\d)((\\d\\d\\d)+\\d@!)@=", "\\1,", "g")}|%{substitute(line("$"), "\\v(\\d)((\\d\\d\\d)+\\d@!)@=", "\\1,", "g")}'
" let g:airline_section_z = '%3p%% %{col(".")} %{line(".")}|%{line("$")}'

" Fix airline whitespace display
" if !exists('g:airline_symbols')
"   let g:airline_symbols = {}
" endif
" let g:airline_symbols.space = "\ua0"
" let g:airline_whitepsace_symbol = '!'

let g:airline#extensions#eclim#enabled = 1
let g:airline#extensions#tmuxline#enabled = 1
let airline#extensions#tmuxline#snapshot_file = "~/.tmux-statusline-colors.conf"

" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" Tabline
" let g:airline#extensions#tabline#show_tab_nr = 1
" let g:airline#extensions#tabline#excludes = [ '\[No Name\]', '__Tagbar__' ]

" specify mixed indent mode so as not to get hassled about C block comments
let g:airline#extensions#whitespace#mixed_indent_algo = 1

" ============================
" Syntastic configuration
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_html_checkers = ['handlebars']
let g:syntastic_javascript_checkers = ['jshint']

" Hat tip http://git.io/SPIBfg
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_full_redraws = 1

let g:syntastic_perl_checkers = [ 'perl', 'perlcritic', 'podchecker' ]
let g:syntastic_enable_perl_checker = 1
let g:syntastic_c_remove_include_errors = 0
" let g:syntastic_c_checkers = [ 'gcc', 'make' ]
let g:syntastic_c_clang_check_post_args = ""
" let g:syntastic_enable_c_checker = 0

function! SetJavaScriptCheckers()
	if findfile('.eslintrc', '.;') != ''
		" Use eslint for projects w/ eslintrc
		let b:syntastic_checkers = ['eslint']
	elseif finddir('ProjectSettings', '.;') != ''
		" Use nothing for Unity projects.
		let b:syntastic_checkers = ['unityscript']
	else
		" Default to jshint
		let b:syntastic_checkers = ['jshint']
	endif
endfunction

autocmd FileType javascript call SetJavaScriptCheckers()

" ============================
" gutentags
let g:gutentags_exclude = [ '*/debian/*', '*/debian-*/*' ]

" ============================
" tcomment_vim
let g:tcommentMapLeader1 = ''
let g:tcommentMapLeader2 = ''
let g:tcommentMapLeaderOp1 = 'tc'
nnoremap <silent><leader>cc :TComment<CR>
vnoremap <silent><leader>cc :TComment<CR>
nnoremap <silent><leader>cb :TCommentBlock<CR>
vnoremap <silent><leader>cb :TCommentBlock<CR>

" ============================
" vim-signify
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)
" Makes switching buffers in large repos have no delay
let g:signify_update_on_bufenter = 0
let g:signify_sign_overwrite = 0

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
				\ 'mail': 1
				\}

	" Don't want preview window
	let g:ycm_add_preview_to_completeopt = 0
	let g:ycm_show_diagnostics_ui = 1
	let g:ycm_extra_conf_globlist = [ '~/work/*', '/home/local/sean/Work/*', '/home/local/sean/work/*' ]
	let g:ycm_always_populate_location_list = 1
endif

" ============================
" plpgsql for all sql files
let g:sql_type_default = 'pgsql'

" ============================
" Terminal stuff
if has('nvim')
	set shell=zsh

	" mappings for ctrl-hjlk window swapping, including terminal
	tnoremap <C-h> <C-\><C-n><C-w>h
	tnoremap <C-j> <C-\><C-n><C-w>j
	tnoremap <C-k> <C-\><C-n><C-w>k
	tnoremap <C-l> <C-\><C-n><C-w>l
	nnoremap <C-h> <C-w>h
	nnoremap <C-j> <C-w>j
	nnoremap <C-k> <C-w>k
	nnoremap <C-l> <C-w>l
	" map escape in terminal to vim style escape
	" tnoremap <Esc> <C-\><C-n>
endif


" ------------------
" incsearch settings
" ------------------
if !has('nvim') && version > 703
	" Use incsearch rather than standard search
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
endif
