
" Prefer ctags to cscope for default C-] behaviour. Its far easier to keep
" ctags up to date.
set csto=1
set nocscopetag

" Don't load the cscope menus from autoload_cscope, as this overrides
" cscope tags settings
let g:autocscope_menus=0
