" ============================
" Load plugins, using vim-plug
call plug#begin()

" Look and Feel
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Color schemes
if has('nvim')
	Plug 'Samuel-Phillips/nvim-colors-solarized'
else
	Plug 'altercation/vim-colors-solarized'
endif
Plug 'rhysd/vim-color-spring-night'
Plug 'Reewr/vim-monokai-phoenix'
Plug 'nanotech/jellybeans.vim'
Plug 'trevordmiller/nova-vim'

" Completion
Plug 'ervandew/supertab'

" if has('nvim')
" 	Plug 'Shougo/deoplete.nvim'  " , { 'do': ':UpdateRemotePlugins' }
" 	Plug 'tweekmonster/deoplete-clang2'
" endif

Plug 'cazador481/perlomni.vim'
if version >= 704
	Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
endif

" Newish, but doesn't seem to support compilation database
" Plug 'w0rp/ale'

" Finding Stuff
Plug 'junegunn/fzf', { 'dir': '~/stuff/fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Editing Tools
Plug 'mutewinter/vim-autoreadwatch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'majutsushi/tagbar'
Plug 'cohama/lexima.vim'
Plug 'tomtom/tcomment_vim'
Plug 'battlesnake/pgsql.vim'
if !has('nvim') && version > 703
	Plug 'haya14busa/incsearch.vim'
endif

" Coding Tools
Plug 'scrooloose/syntastic'
if has('nvim') || version >= 704
	Plug 'ludovicchabant/vim-gutentags'
endif
Plug 'autoload_cscope.vim'
Plug 'chazy/cscope_maps'
Plug 'tpope/vim-endwise'

" Source Countril
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

call plug#end()
" ============================

" Source files form vim configuration
source ~/.vim/platforms.vim
source ~/.vim/config.vim
source ~/.vim/commands.vim
source ~/.vim/mappings.vim
source ~/.vim/functions.vim
source ~/.vim/autocmds.vim

" Source individual plugin configuration files
source ~/.vim/plugin_config/deoplete.vim
source ~/.vim/plugin_config/fzf.vim
source ~/.vim/plugin_config/nerdtree.vim
source ~/.vim/plugin_config/airline.vim
source ~/.vim/plugin_config/syntastic.vim
source ~/.vim/plugin_config/gutentags.vim
source ~/.vim/plugin_config/tcomment.vim
source ~/.vim/plugin_config/signify.vim
source ~/.vim/plugin_config/ycm.vim
source ~/.vim/plugin_config/incsearch.vim

" Load a host specific file, if present
let s:host_vimrc = $HOME . '/.vim/host/' . hostname() . '/vimrc'
if filereadable(s:host_vimrc)
	execute 'source ' . s:host_vimrc
endif

" ============================
" plpgsql for all sql files
let g:sql_type_default = 'pgsql'

" ============================
" Terminal stuff
if has('nvim')
	set shell=zsh

	" mappings for ctrl-hjlk window swapping, including terminal
	tnoremap <C-h> <C-\><C-n><C-w>h
	tnoremap <C-j> <C-\><C-n><C-w>j
	tnoremap <C-k> <C-\><C-n><C-w>k
	tnoremap <C-l> <C-\><C-n><C-w>l
	nnoremap <C-h> <C-w>h
	nnoremap <C-j> <C-w>j
	nnoremap <C-k> <C-w>k
	nnoremap <C-l> <C-w>l
	" map escape in terminal to vim style escape
	" tnoremap <Esc> <C-\><C-n>
endif
