"
" vim-plug
"

silent! call plug#begin('~/.vim/bundle')

" Plugin Helpers!
  Plug 'tpope/vim-dispatch'

" Search
  Plug 'rking/ag.vim'
if version > 703
  Plug 'haya14busa/incsearch.vim'
endif

" Cscope / Tags
  Plug 'autoload_cscope.vim'
  Plug 'chazy/cscope_maps'
  Plug 'majutsushi/tagbar'
if version > 703
  Plug 'ludovicchabant/vim-gutentags'
endif
  " Plug 'lyuts/vim-rtags'

" Formatting
  Plug 'chrisbra/csv.vim'
  Plug 'tomtom/tcomment_vim'

" Tools
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'sjl/gundo.vim'
  Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'ervandew/supertab'
  Plug 'scrooloose/syntastic'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
if version > 703
  Plug 'Valloric/YouCompleteMe'
endif
  Plug 'AndrewRadev/splitjoin.vim'

" Unite
if version > 703
  Plug 'Shougo/vimproc.vim' | Plug 'Shougo/unite.vim'
  Plug 'Shougo/unite-outline'
endif

" Visuals
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'edkolev/tmuxline.vim'
  Plug 'altercation/vim-colors-solarized'
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'elzr/vim-json'
  Plug 'mhinz/vim-signify'
  Plug 'mhinz/vim-startify'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'mutewinter/vim-tmux'

" ????
  Plug 'Raimondi/delimitMate'
  Plug 'L9'
  Plug 'matchit.zip'
  Plug 'Valloric/MatchTagAlways'
  Plug 'tyru/open-browser.vim'
  Plug 'dsawardekar/portkey'
if version > 703
  Plug 'SirVer/ultisnips'
endif
  Plug 'tpope/vim-abolish'
  Plug 'mutewinter/vim-autoreadwatch'
  Plug 'easymotion/vim-easymotion'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-eunuch'
  Plug 'fatih/vim-go'
  Plug 'takac/vim-hardtime'
  Plug 'mxw/vim-jsx'
  Plug 'gabrielelana/vim-markdown'
  Plug 'xolox/vim-misc'
  Plug 'xolox/vim-session'
  Plug 'justinmk/vim-syntax-extra'
  Plug 'jszakmeister/vim-togglecursor'
  Plug 'tpope/vim-unimpaired'
  Plug 'nelstrom/vim-visual-star-search'
  Plug 'benmills/vimux'
  Plug 'mattn/webapi-vim'
  Plug 'jeffkreeftmeijer/vim-numbertoggle'

call plug#end()
