"
" vim-plug
"

call plug#begin('~/.vim/bundle')

" Plugin Helpers!
  Plug 'tpope/vim-dispatch'
  Plug 'Shougo/vimproc.vim'

" Search
  Plug 'rking/ag.vim'
  Plug 'haya14busa/incsearch.vim'

" Cscope / Tags
  Plug 'autoload_cscope.vim'
  Plug 'chazy/cscope_maps'
  Plug 'majutsushi/tagbar'
  Plug 'ludovicchabant/vim-gutentags'
  " Plug 'lyuts/vim-rtags'

" Formatting
  Plug 'chrisbra/csv.vim'
  Plug 'tomtom/tcomment_vim'

" Tools
  Plug 'kien/ctrlp.vim'
  Plug 'sjl/gundo.vim'
  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'ervandew/supertab'
  Plug 'scrooloose/syntastic'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'Valloric/YouCompleteMe'

" Unite
  Plug 'Shougo/unite.vim'
  Plug 'Shougo/unite-outline'

" Visuals
  Plug 'bling/vim-airline'
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
  Plug 'SirVer/ultisnips'
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

call plug#end()
