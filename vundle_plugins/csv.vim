if exists('g:vundle_installing_plugins')
  Plug 'chrisbra/csv.vim'
  finish
endif

" Highlight the current column in csv files by default
let g:csv_highlight_column = 'y'

" Treat .tbl files as csv
augroup filetypedetect
	au! BufRead,BufNewFile *.tbl 	setfiletype csv
augroup END
