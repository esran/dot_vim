"
" vim-plug
"

call plug#begin('~/.vim/bundle')

" Source all the plugins with a global variable set that ensures only the
" Plugin 'name' code will be called.
let g:vundle_installing_plugins = 1

" Standard (in git repo) plugins
for file in split(glob('$HOME/.vim/vundle_plugins/*.vim'), '\n')
	exe 'source' fnameescape(file)
endfor

" Custom (local) plugins
for file in split(glob('$HOME/.vim/vundle_plugins/custom/*.vim'), '\n')
	exe 'source' fnameescape(file)
endfor

unlet g:vundle_installing_plugins

" Plugins loaded explicitly. Much easier then scanning a sub folder
Plug 'wincent/ferret'
Plug 'ludovicchabant/vim-gutentags'
Plug 'lyuts/vim-rtags'

call plug#end()
