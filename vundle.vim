" ----------------------------------------
" Vundle
" ----------------------------------------

set nocompatible " be iMproved
filetype off     " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

" -------
" Plugins
" -------

" Navigation
Plugin 'ZoomWin'
Plugin 'kien/ctrlp.vim'
Plugin 'chazy/cscope_maps'
Plugin 'hari-rangarajan/CCTree'
" UI Additions
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'Rykka/colorv.vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'mhinz/vim-signify'
Plugin 'mhinz/vim-startify'
Plugin 'mbbill/undotree'
Plugin 'jszakmeister/vim-togglecursor'
Plugin 'jewes/Conque-Shell'
Plugin 'edkolev/promptline.vim'
Plugin 'altercation/vim-colors-solarized'
" Commands
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'godlygeek/tabular'
Plugin 'rking/ag.vim'
Plugin 'milkypostman/vim-togglelist'
Plugin 'mutewinter/swap-parameters'
Plugin 'tpope/vim-abolish'
Plugin 'scratch.vim'
Plugin 'mattn/emmet-vim'
Plugin 'mutewinter/GIFL'
Plugin 'AndrewRadev/switch.vim'
Plugin 'tpope/vim-eunuch'
Plugin 'itspriddle/vim-marked'
Plugin 'HelpClose'
Plugin 'mattn/gist-vim'
Plugin 'nelstrom/vim-visual-star-search'
Plugin 'sk1418/Join'
Plugin 'SirVer/ultisnips'
Plugin 'papanikge/vim-voogle'
Plugin 'benmills/vimux'
Plugin 'jgdavey/vim-turbux'
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'edkolev/tmuxline.vim'
Plugin 'dsawardekar/portkey'
Plugin 'dsawardekar/ember.vim'
Plugin 'rizzatti/dash.vim'
Plugin 'tpope/vim-dispatch'
Plugin 'keepcase.vim'
Plugin 'Shortcut-functions-for-KeepCase-script-'
" Automatic Helpers
Plugin 'osyo-manga/vim-anzu'
Plugin 'xolox/vim-session'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/syntastic'
" Plugin 'ervandew/supertab'
Plugin 'Valloric/MatchTagAlways'
" YCM needs a higher vim version
if version >= 704
	Plugin 'Valloric/YouCompleteMe'
endif
Plugin 'mutewinter/vim-autoreadwatch'
Plugin 'yssl/QFEnter'
" Plugin 'szw/vim-tags'
Plugin 'majutsushi/tagbar'
Plugin 'DfrankUtil'
Plugin 'vimprj'
Plugin 'indexer.tar.gz'
" Language Additions
"   Ruby
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-bundler'
"   JavaScript
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'leshill/vim-json'
"   HTML
Plugin 'nono/vim-handlebars'
Plugin 'othree/html5.vim'
Plugin 'indenthtml.vim'
"   TomDoc
Plugin 'mutewinter/tomdoc.vim'
Plugin 'jc00ke/vim-tomdoc'
"   Other Languages
Plugin 'msanders/cocoa.vim'
Plugin 'mutewinter/taskpaper.vim'
Plugin 'mutewinter/nginx.vim'
Plugin 'timcharper/textile.vim'
Plugin 'mutewinter/vim-css3-syntax'
Plugin 'mutewinter/vim-tmux'
Plugin 'plasticboy/vim-markdown'
Plugin 'groenewege/vim-less'
Plugin 'wavded/vim-stylus'
Plugin 'tpope/vim-cucumber'
Plugin 'chrisbra/csv.vim'
Plugin 'digitaltoad/vim-jade'
" Plugin 'gilligan/vim-lldb'
" MatchIt
Plugin 'matchit.zip'
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'
" Libraries
Plugin 'L9'
Plugin 'tpope/vim-repeat'
Plugin 'mattn/webapi-vim'
Plugin 'xolox/vim-misc'
Plugin 'rizzatti/funcoo.vim'
