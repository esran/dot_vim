"
" vim-plug
"

call plug#begin('~/.vim/bundle')

Plug 'wincent/ferret'

" TODO - Replace this. I don't like having all the plugin loading
" in separate files. Makes dependency handling tricky for a start.
" I'll probably leave the configuration in the separate files though
" as that does make it easier to find. This change will also remove
" the global variable hack. (SJ)

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

call plug#end()
