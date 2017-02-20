" ---------------------------------------------
" Regular Vim Configuration (No Plugins Needed)
" ---------------------------------------------

" ------------------------
" GUI specific stuff
" ------------------------
if has('gui_running')
	set lines=60 columns=180
	set guioptions=egmrt
	winpos 200 100
endif

" ---------------
" Color
" ---------------
set t_Co=256
colorscheme monokai-phoenix

" Search highlighting. Overriding solarized
" autocmd ColorScheme * hi Search gui=underline guifg=#f0a0c0
" autocmd ColorScheme * hi Search cterm=underline ctermfg=5
" autocmd ColorScheme * hi Search term=none

" -----------------------------
" File Locations
" -----------------------------
" Create directories if they don't already exist
if !isdirectory($HOME."/tmp/vim/backup")
	call mkdir($HOME."/tmp/vim/backup", "p")
endif
if !isdirectory($HOME."/tmp/vim/tmp")
	call mkdir($HOME."/tmp/vim/tmp", "p")
endif

set backupdir=~/tmp/vim/backup// " Double // causes backups to use full file path
set directory=~/tmp/vim/tmp//

set spellfile=~/.vim/spell/custom.en.utf-8.add
" Persistent Undo
if has('persistent_undo')
	set undofile
	set undodir=~/.vim/.undo
endif

" ---------------
" UI
" ---------------
set noruler        " Ruler off
set nowrap         " Line wrapping off
set laststatus=2   " Always show the statusline
set cmdheight=2    " Make the command area two lines high
set cursorline     " Highlight current line
set encoding=utf-8
set noshowmode     " Don't show the mode since Powerline shows it
set title          " Set the title of the window in the terminal to the file
if exists('+colorcolumn')
	set colorcolumn=80 " Color the 80th column differently as a wrapping guide.
endif
" Disable tooltips for hovering keywords in Vim
" if exists('+ballooneval')
" 	" This doesn't seem to stop tooltips for Ruby files
" 	set noballooneval
" 	" 100 second delay seems to be the only way to disable the tooltips
" 	set balloondelay=100000
" endif
set number			" Line numbers
" Relative line numbers if possible
if exists('+relativenumber')
	set relativenumber
endif

" ---------------
" Behaviors
" ---------------
syntax enable
" set backup             " Turn on backups
set autoread           " Automatically reload changes if detected
set wildmenu           " Turn on WiLd menu
" longest common part, then all.
set wildmode=longest:full,full
set hidden             " Change buffer - without saving
set history=768        " Number of things to remember in history.
set confirm            " Enable error files & error jumping.
" set clipboard+=unnamed " Yanks go on clipboard instead.
set autowrite          " Writes on make/shell commands
set timeoutlen=400     " Time to wait for a command (after leader for example).
" set ttimeout
set ttimeoutlen=10     " Time to wait for key codes
" set nofoldenable       " Don't disable folding entirely.
" set foldlevelstart=99  " I quite like folds.
set formatoptions=crql
" set iskeyword+=\$      " Add extra characters that are valid parts of variables
set nostartofline      " Don't go to the start of the line after some commands
set scrolloff=3        " Keep three lines below the last line when scrolling
" set gdefault           " this makes search/replace global by default
set switchbuf=useopen  " Switch to an existing buffer if one exists
set modeline

" ---------
" Clipboard
" ---------
" set clipboard+=autoselect " Yanks go on clipboard instead.
set guioptions+=a

" ---------------
" Text Format
" ---------------
set tabstop=4
set backspace=indent,eol,start " Delete everything with backspace
set shiftwidth=4 " Tabs under smart indent
set shiftround
set cindent
set autoindent
set smarttab
set noexpandtab

" ---------------
" Searching
" ---------------
set ignorecase " Case insensitive search
set smartcase  " Non-case sensitive search
set incsearch  " Incremental search
set hlsearch   " Highlight search results
set wildignore+=*.o,*.obj,*.exe,*.so,*.dll,*.pyc,.svn,.hg,.bzr,.git,
	\.sass-cache,*.class,*.scssc,*.cssc,*.lessc,*/node_modules/*,
	\rake-pipeline-*

" ---------------
" Visual
" ---------------
set showmatch   " Show matching brackets.
set matchtime=2 " How many tenths of a second to blink
" Show invisible characters
set nolist

" Show trailing spaces as dots and carrots for extended lines.
" From Janus, http://git.io/PLbAlw

" Reset the listchars
set listchars=""
" make tabs visible
set listchars=tab:▸.
" show trailing spaces as dots
set listchars+=trail:•
" The character to show in the last column when wrap is off and the line
" continues beyond the right of the screen
set listchars+=extends:>
" The character to show in the last column when wrap is off and the line
" continues beyond the right of the screen
set listchars+=precedes:<

" ---------------
" Sounds
" ---------------
set noerrorbells
set novisualbell
set t_vb=

" ---------------
" Mouse
" ---------------
set mousehide  " Hide mouse after chars typed
set mouse=a    " Mouse in all modes

" Better complete options to speed it up
set complete=.,w,b,u,U
set completeopt-=preview

" ------------
" Cursor stuff
" https://github.com/blaenk/dots/blob/9843177fa6155e843eb9e84225f458cd0205c969/vim/vimrc.ln#L49-L64
" http://www.blaenkdenum.com/posts/a-simpler-vim-statusline/
" ------------
set gcr=a:block

" mode aware cursors
set gcr+=o:hor50-Cursor
set gcr+=n:Cursor
set gcr+=i-ci-sm:InsertCursor
set gcr+=r-cr:ReplaceCursor-hor20
set gcr+=c:CommandCursor
set gcr+=v-ve:VisualCursor

set gcr+=a:blinkon0

hi InsertCursor  ctermfg=15 guifg=#fdf6e3 ctermbg=37  guibg=#2aa198
hi VisualCursor  ctermfg=15 guifg=#fdf6e3 ctermbg=125 guibg=#d33682
hi ReplaceCursor ctermfg=15 guifg=#fdf6e3 ctermbg=65  guibg=#dc322f
hi CommandCursor ctermfg=15 guifg=#fdf6e3 ctermbg=166 guibg=#cb4b16

" ---------
" Man pages
" ---------
if has('nvim')
else
	runtime! ftplugin/man.vim
endif

" ---------------------------
" File type formatting issues
" ---------------------------
autocmd Filetype haml setlocal expandtab ts=2 sw=2 ai
autocmd Filetype rb setlocal noexpandtab ts=4 sw=4 ai
autocmd Filetype sql setlocal expandtab ts=2 sw=2 ai
