
" --------------------
" Ag (Silver Searcher)
" --------------------
nnoremap <silent> <leader>as :AgFromSearch<CR>
nnoremap <leader>ag :Ag<space>

" ---
" CSV
" ---
" Highlight the current column in csv files by default
let g:csv_highlight_column = 'y'

" Treat .tbl files as csv
augroup filetypedetect
	au! BufRead,BufNewFile *.tbl 	setfiletype csv
augroup END

" ------
" Ctrl-P
" ------
" Ensure Ctrl-P isn't bound by default
let g:ctrlp_map = ''

" Ensure max height isn't too large. (for performance)
let g:ctrlp_max_height = 10
" Fix fix new windows opening in split from startify
let g:ctrlp_reuse_window = 'startify'
let g:ctrlp_mruf_max = 350
let g:ctrlp_mruf_default_order = 0

" Remove aribitrary limit on number of files
let g:ctrlp_max_files = 0

" Search hidden files by default
let g:ctrlp_show_hidden = 1

if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  " HatTip: http://robots.thoughtbot.com/faster-grepping-in-vim and
  " @ethanmuller
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" -----------
" delimitmate
" -----------
let g:delimitMate_expend_cr=1
let g:delimitMate_expand_space=1

" -----
" eclim
" -----
let g:EclimCompletionMethod = 'omnifunc'

" ---------
" incsearch
" ---------
set hlsearch
let g:incsearch#auto_nohlsearch = 1

" Have n/N behave consistently rather than swap
" based on direction of seach
let g:incsearch#consistent_n_direction = 1

" Use very magic search option
let g:incsearch#magic = '\v'

" --------------
" MatchTagAlways
" --------------
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'handlebars' : 1,
    \ 'eruby' : 1,
	\ 'sgml' : 1,
    \}

" --------
" nerdtree
" --------
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

" -------
" Portkey
" -------
let g:portkey_autostart = 1

" ---------
" Syntastic
" ---------
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

" --------
" tcomment
" --------
let g:tcommentMapLeader1 = ''
let g:tcommentMapLeader2 = ''
let g:tcommentMapLeaderOp1 = 'tc'

" ---------
" Ultisnips
" ---------
let g:UltiSnipsSnippetDirectories=['MyUltiSnips']
let g:UltiSnipsExpandTrigger='<C-j>'
let g:UltiSnipsJumpForwardTrigger='<C-j>'
let g:UltiSnipsJumpBackwardTrigger='<C-h>'

" -----
" Unite
" -----
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

" ----------
" Easymotion
" ----------
" Disable default mappings
let g:EasyMotion_do_mapping = 0
" Use uppercase target labels and type as a lower case
let g:EasyMotion_use_upper = 1
 " type `l` and match `l`&`L`
let g:EasyMotion_smartcase = 1
" Smartsign (type `3` and match `3`&`#`)
let g:EasyMotion_use_smartsign_us = 1

" ---------
" Gutentags
" ---------
let g:gutentags_exclude = [ '*/debian/*', '*/debian-*/*' ]

" --------
" hardtime
" --------
let g:hardtime_default_on = 0
let g:hardtime_ignore_buffer_patterns = ["NERD.*", "Help"]
let g:hardtime_allow_different_key = 1
let g:hardtime_ignore_quickfix = 1
" Hard, but not that hard
let g:hardtime_maxcount = 3

let g:list_of_normal_keys = ["h", "j", "k", "l", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_visual_keys = ["h", "j", "k", "l", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_insert_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]

" -------------
" indent-guides
" -------------
" let g:indent_guides_enable_on_vim_startup = 1

" ---
" jsx
" ---
autocmd FileType javascript let g:jsx_ext_required = findfile('.jsx', '.;') != '' ? 0 : 1

" -----------
" vim-session
" -----------
let g:session_autosave = 0
let g:session_autoload = 0

" -----------
" vim-signify
" -----------
" Makes switching buffers in large repos have no delay
let g:signify_update_on_bufenter = 0
let g:signify_sign_overwrite = 0

" ------------
" vim-startify
" ------------
let g:startify_list_order = [
        \ ['   Last modified'],
        \ 'dir',
        \ ['   Recent'],
        \ 'files',
        \ ]
let g:startify_skiplist = [
            \ 'COMMIT_EDITMSG',
            \ $VIMRUNTIME .'/doc',
            \ 'bundle/.*/doc',
            \ ]
let g:startify_files_number = 10
let g:startify_custom_indices = ['a', 'd', 'f', 'g', 'h']
let g:startify_change_to_dir = 0

hi StartifyBracket ctermfg=240
hi StartifyFooter  ctermfg=111
hi StartifyHeader  ctermfg=203
hi StartifyPath    ctermfg=245
hi StartifySlash   ctermfg=240

" Show Startify
autocmd VimEnter *
            \ if !argc() |
            \   Startify |
            \   execute "normal \<c-w>w" |
            \ endif
" Keep NERDTree from opening a split when startify is open
autocmd FileType startify setlocal buftype=

let g:startify_recursive_dir = 1

" ------------
" vim-surround
" ------------
" Use # to get a variable interpolation (inside of a string)}
" ysiw#   Wrap the token under the cursor in #{}
" Thanks to http://git.io/_XqKzQ
let g:surround_35  = "#{\r}"

" ----------------
" vim-togglecursor
" ----------------
let g:togglecursor_leave='line'

" -----
" vimux
" -----
let g:VimuxUseNearestPane = 1

" -------------
" YouCompleteMe
" -------------
let g:ycm_complete_in_comments = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_use_ultisnips_completer = 0
let g:ycm_filetype_specific_completion_to_disable = {
			\ 'ruby' : 1,
			\ 'javascript' : 1,
			\ 'jsx' : 1,
			\}

" Don't want preview window
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 1
let g:ycm_extra_conf_globlist = [ '~/work/*', '/home/local/sean/Work/*' ]

" -------
" neomake
" -------
" autocmd! BufWritePost * Neomake
"
" let g:neomake_list_height = 5
"
" function! SetJavaScriptCheckers()
"   let checkers = []
"
"   if findfile('.eslintrc', '.;') != ''
"     call add(checkers, 'eslint')
"   endif
"
"   if findfile('.jshintrc', '.;') != ''
"     call add(checkers, 'jshint')
"   endif
"
"   if findfile('.jscsrc', '.;') != ''
"     call add(checkers, 'jscs')
"   endif
"
"   if finddir('ProjectSettings', '.;') != ''
"     call add(checkers, 'unityscript')
"   endif
"
"   let g:neomake_javascript_enabled_makers = checkers
" endfunction
"
" autocmd FileType javascript call SetJavaScriptCheckers()

" -----------
" vim-airline
" -----------
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
