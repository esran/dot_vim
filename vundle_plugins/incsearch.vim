if exists('g:vundle_installing_plugins')
  Plugin 'haya14busa/incsearch.vim'
  finish
endif

" Use incsearch rather than standard search
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" Highlight search but automatically disable
" highlight after search commands finished
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" Have n/N behave consistently rather than swap
" based on direction of seach
let g:incsearch#consistent_n_direction = 1

" Use very magic search option
let g:incsearch#magic = '\v'
