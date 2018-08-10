
" NOTE: Using lightline_delphinus
let g:lightline_delphinus_use_powerline_glyphs = 1
let g:lightline_delphinus_colorscheme = 'nord_improved'

if g:lightline_delphinus_use_powerline_glyphs
  let s:separator = {'left': '', 'right': ''}
  let s:subseparator = {'left': '', 'right': ''}
else
  let s:separator = {'left': '', 'right': ''}
  let s:subseparator = {'left': '|', 'right': '|'}
endif

let g:lightline = {
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ], [ 'fugitive' ], [ 'filepath' ], [ 'filename', 'tagbar' ], [ 'gutentags' ] ],
        \   'right': [
        \     [ 'lineinfo' ],
        \     [ 'percent' ],
        \     [ 'ale_error', 'ale_warning', 'ale_ok', 'fileformat', 'fileencoding', 'filetype' ],
        \   ],
        \ },
        \ 'inactive': {
        \   'left': [ [ 'filepath', 'filename' ] ],
        \   'right': [ [ 'lineinfo' ], [ 'percent' ] ],
        \ },
        \ 'component_function': {
        \   'modified':     'lightline#delphinus#components#modified',
        \   'readonly':     'lightline#delphinus#components#readonly',
        \   'fugitive':     'lightline#delphinus#components#fugitive',
        \   'filepath':     'lightline#delphinus#components#filepath',
        \   'filename':     'lightline#delphinus#components#filename',
        \   'fileformat':   'lightline#delphinus#components#fileformat',
        \   'filetype':     'lightline#delphinus#components#filetype',
        \   'fileencoding': 'lightline#delphinus#components#fileencoding',
        \   'mode':         'lightline#delphinus#components#mode',
        \   'char_code':    'lightline#delphinus#components#charcode',
        \ },
        \ 'component_function_visible_condition': {
        \   'mode': 1,
        \ },
        \ 'component_expand': {
        \   'ale_error':   'lightline#delphinus#components#ale_error',
        \   'ale_warning': 'lightline#delphinus#components#ale_warning',
        \   'ale_ok':      'lightline#delphinus#components#ale_ok',
        \ },
        \ 'component_type': {
        \   'ale_error':   'error',
        \   'ale_warning': 'warning',
        \   'ale_ok':      'ok',
        \ },
        \ 'component': {
        \   'tagbar': '%{tagbar#currenttag("[%s]", "", "f")}',
        \   'gutentags': '%{gutentags#statusline("[Generating...]")}',
        \ },
        \ 'separator': s:separator,
        \ 'subseparator': s:subseparator,
        \ }


" let g:lightline = {
"             \ 'active': {
"             \   'left': [['mode'], ['readonly', 'filename', 'modified'], ['tagbar', 'gutentags']],
"             \   'right': [['ale'], ['lineinfo'], ['filetype']]
"             \ },
"             \ 'inactive': {
"             \   'left': [['absolutepath']],
"             \   'right': [['lineinfo'], ['filetype']]
"             \ },
"             \ 'component_type': {
"             \   'ale_error':   'error',
"             \   'ale_warning': 'warning',
"             \   'ale_ok':      'ok',
"             \ },
"             \ 'component_expand': {
"             \   'ale': 'LightLineAle'
"             \ },
"             \ }

" function! LightLineAle()
"   return winwidth(0) > 90 && &ft !~? s:except_ft && exists("*ALEGetStatusLine") ?
"     \ ale#statusline#Status() : ''
"   endif
" endfunction
"
" augroup UpdateAleLightLine
"   autocmd!
"   autocmd User ALELint call lightline#update()
" augroup END
