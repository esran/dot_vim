" ============================
" Enable Shougo/deoplete
let g:deoplete#enable_at_startup = 1
" Automatic tab completion
inoremap <silent><expr> <Tab>
			\ pumvisible() ? "\<C-n>" : "<Tab>"

