
" ---------
" incsearch
" ---------
" Use incsearch rather than standard search
if version > 703
	map /  <Plug>(incsearch-forward)
	map ?  <Plug>(incsearch-backward)
	map g/ <Plug>(incsearch-stay)

	map n  <Plug>(incsearch-nohl-n)
	map N  <Plug>(incsearch-nohl-N)
	map *  <Plug>(incsearch-nohl-*)
	map #  <Plug>(incsearch-nohl-#)
	map g* <Plug>(incsearch-nohl-g*)
	map g# <Plug>(incsearch-nohl-g#)
endif

" ---------
" nerdtree
" ---------
nnoremap <silent><leader>nn :NERDTreeToggle<CR>:wincmd =<CR>
nnoremap <silent><leader>nf :NERDTreeFind<CR>:wincmd =<CR>

" ------------
" open-browser
" ------------
nmap <leader>o <Plug>(openbrowser-smart-search)
vmap <leader>o <Plug>(openbrowser-smart-search)

" --------
" tcomment
" --------
nnoremap <silent><leader>cc :TComment<CR>
vnoremap <silent><leader>cc :TComment<CR>
nnoremap <silent><leader>cb :TCommentBlock<CR>
vnoremap <silent><leader>cb :TCommentBlock<CR>

" ------
" Ctrl-P
" ------
" Leader Commands
nnoremap <leader>t :CtrlPRoot<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
" nnoremap <leader>u :CtrlPCurFile<CR>
" nnoremap <leader>m :CtrlPMRUFiles<CR>

" -----
" Unite
" -----
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

" -------
" Airline
" -------
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
let g:airline_section_c = '%t'
let g:airline_section_y = ''
let g:airline_section_z = '%3p%% %#__accent_bold#%4l%#__restore__#:%3'
let g:airline_section_z = '%3p%% %{substitute(line("."), "\\v(\\d)((\\d\\d\\d)+\\d@!)@=", "\\1,", "g")}|%{substitute(line("$"), "\\v(\\d)((\\d\\d\\d)+\\d@!)@=", "\\1,", "g")}'

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

" ----------
" Easymotion
" ----------
" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-s)
vmap s <Plug>(easymotion-s)

map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" --------
" fugitive
" --------
nnoremap <Leader>gc :Gcommit -v<CR>
nnoremap <Leader>gca :Gcommit -a -v<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gp :Git push<CR>
 " Mnemonic, gu = Git Update
nnoremap <Leader>gu :Git pull<CR>
nnoremap <Leader>gd :Gvdiff<CR>
" Exit a diff by closing the diff window
nnoremap <Leader>gx :wincmd h<CR>:q<CR>
" Start git command
nnoremap <leader>gi :Git<space>
" Undo the last commit
command! Gcundo :Git reset HEAD~1

" -----------
" vim-session
" -----------
nnoremap <leader>os :OpenSession<CR>

" -----------
" vim-signigy
" -----------
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)

" ------------
" vim-surround
" ------------
" Shortcuts for common surrounds
map <leader>y# ysi"#
