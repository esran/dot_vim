if exists('g:vundle_installing_plugins')
  Plug 'dsawardekar/portkey'
  finish
endif

let g:portkey_autostart = 1
nnoremap <LocalLeader>a :Alternate<CR>
