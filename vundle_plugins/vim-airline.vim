if exists('g:vundle_installing_plugins')
  Plugin 'vim-airline/vim-airline'
  finish
endif

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
