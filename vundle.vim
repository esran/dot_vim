" ----------------------------------------
" Plug
" ----------------------------------------

silent! call plug#begin('~/.vim/bundle')

" Source all the plugins with a global variable set that ensures only the
" Plugin 'name' code will be called.
let g:vundle_installing_plugins = 1
for file in split(glob('$HOME/.vim/vundle_plugins/*.vim'), '\n')
  exe 'source' fnameescape(file)
endfor
for file in split(glob('$HOME/.vim/vundle_plugins/custom/*.vim'), '\n')
  exe 'source' fnameescape(file)
endfor
unlet g:vundle_installing_plugins

call plug#end()
