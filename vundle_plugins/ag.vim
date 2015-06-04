if exists('g:vundle_installing_plugins')
  Plug 'rking/ag.vim'
  finish
endif

nnoremap <silent> <leader>as :AgFromSearch<CR>
nnoremap <leader>ag :Ag<space>
