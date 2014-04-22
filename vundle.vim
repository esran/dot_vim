" ----------------------------------------
" Vundle
" ----------------------------------------

set nocompatible " be iMproved
filetype off     " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'

" ---------------
" Plugin Bundles
" ---------------

" Navigation
Bundle 'ZoomWin'
Bundle 'kien/ctrlp.vim'
Bundle 'JazzCore/ctrlp-cmatcher'
Bundle 'chazy/cscope_maps'
" UI Additions
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'bling/vim-airline'
Bundle 'scrooloose/nerdtree'
Bundle 'Rykka/colorv.vim'
Bundle 'nanotech/jellybeans.vim'
Bundle 'mhinz/vim-signify'
Bundle 'mhinz/vim-startify'
Bundle 'mbbill/undotree'
Bundle 'jszakmeister/vim-togglecursor'
Bundle 'jewes/Conque-Shell'
Bundle 'edkolev/promptline.vim'
Bundle 'altercation/vim-colors-solarized'
" Commands
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'godlygeek/tabular'
Bundle 'rking/ag.vim'
Bundle 'milkypostman/vim-togglelist'
Bundle 'mutewinter/swap-parameters'
Bundle 'tpope/vim-abolish'
Bundle 'scratch.vim'
Bundle 'mattn/emmet-vim'
Bundle 'mutewinter/GIFL'
Bundle 'AndrewRadev/switch.vim'
Bundle 'tpope/vim-eunuch'
Bundle 'itspriddle/vim-marked'
Bundle 'HelpClose'
Bundle 'mattn/gist-vim'
Bundle 'nelstrom/vim-visual-star-search'
Bundle 'sk1418/Join'
Bundle 'SirVer/ultisnips'
Bundle 'g3orge/vim-voogle'
Bundle 'benmills/vimux'
Bundle 'jgdavey/vim-turbux'
Bundle 'ecomba/vim-ruby-refactoring'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'edkolev/tmuxline.vim'
Bundle 'dsawardekar/portkey'
Bundle 'dsawardekar/ember.vim'
Bundle 'rizzatti/dash.vim'
Bundle 'tpope/vim-dispatch'
Bundle 'keepcase.vim'
Bundle 'Shortcut-functions-for-KeepCase-script-'
" Automatic Helpers
Bundle 'osyo-manga/vim-anzu'
Bundle 'xolox/vim-session'
Bundle 'Raimondi/delimitMate'
Bundle 'scrooloose/syntastic'
Bundle 'Valloric/MatchTagAlways'
" YCM needs a higher vim version
if version >= 704
	Bundle 'Valloric/YouCompleteMe'
endif
Bundle 'mutewinter/vim-autoreadwatch'
" Bundle 'szw/vim-tags'
Bundle 'majutsushi/tagbar'
Bundle 'DfrankUtil'
Bundle 'vimprj'
Bundle 'indexer.tar.gz'
" Language Additions
"   Ruby
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-bundler'
"   JavaScript
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'leshill/vim-json'
"   HTML
Bundle 'nono/vim-handlebars'
Bundle 'othree/html5.vim'
Bundle 'indenthtml.vim'
"   TomDoc
Bundle 'mutewinter/tomdoc.vim'
Bundle 'jc00ke/vim-tomdoc'
"   Other Languages
Bundle 'msanders/cocoa.vim'
Bundle 'mutewinter/taskpaper.vim'
Bundle 'mutewinter/nginx.vim'
Bundle 'timcharper/textile.vim'
Bundle 'mutewinter/vim-css3-syntax'
Bundle 'mutewinter/vim-tmux'
Bundle 'plasticboy/vim-markdown'
Bundle 'groenewege/vim-less'
Bundle 'wavded/vim-stylus'
Bundle 'tpope/vim-cucumber'
Bundle 'chrisbra/csv.vim'
Bundle 'digitaltoad/vim-jade'
" MatchIt
Bundle 'matchit.zip'
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'
" Libraries
Bundle 'L9'
Bundle 'tpope/vim-repeat'
Bundle 'mattn/webapi-vim'
Bundle 'xolox/vim-misc'
Bundle 'rizzatti/funcoo.vim'
