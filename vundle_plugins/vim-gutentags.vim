" Automatically create/update ctags file for the current
" repository.
if exists('g:vundle_installing_plugins')
  Plug 'ludovicchabant/vim-gutentags'
  finish
endif

let g:gutentags_exclude = [ '*/debian/*', '*/debian-*/*' ]
