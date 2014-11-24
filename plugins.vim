" Source all the plugin files again, this time loading their configuration.
for file in split(glob('~/.vim/vundle_plugins/*.vim'), '\n')
  exe 'source' file
endfor
" And the same for custom plugins
for file in split(glob('$HOME/.vim/vundle_plugins/custom/*.vim'), '\n')
  exe 'source' fnameescape(file)
endfor
