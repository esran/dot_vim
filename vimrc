" ============================
" fix dodgy chars issue
if has('nvim')
	let $VTE_VERSION = '100'
endif

" ============================
" Load plugins, using vim-plug
call plug#begin()

" Color schemes
Plug 'flazz/vim-colorschemes'

" Solarized
if has('nvim')
    Plug 'Samuel-Phillips/nvim-colors-solarized'
else
    Plug 'altercation/vim-colors-solarized'
endif

" Language client
" if has('nvim')
" 	Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
" endif

" Completion
if has('nvim')
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	Plug 'tweekmonster/deoplete-clang2'
    " Plug 'roxma/nvim-completion-manager'
    " Plug 'Valloric/YouCompleteMe', { 'do': 'CXX=clang ./install.py --clang-completer --system-libclang' }
elseif v:version >= 704
    Plug 'Valloric/YouCompleteMe', { 'do': 'CXX=clang ./install.py --clang-completer --system-libclang' }
endif
Plug 'ervandew/supertab'
" Plug 'cazador481/perlomni.vim'
Plug 'vim-scripts/dbext.vim'

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
" Plug 'scrooloose/nerdcommenter'
Plug 'battlesnake/pgsql.vim'
if !has('nvim') && v:version > 703
	Plug 'haya14busa/incsearch.vim'
endif

" Coding Tools
" Plug 'scrooloose/syntastic'		" - replaced by ALE
Plug 'esran/ale'
if has('nvim') || v:version >= 704
	Plug 'ludovicchabant/vim-gutentags'
endif
Plug 'erig0/cscope_dynamic'
" Plug 'autoload_cscope.vim'
Plug 'chazy/cscope_maps'
Plug 'tpope/vim-endwise'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/vader.vim'
Plug 'jiangmiao/auto-pairs'

" Source Countrol
Plug 'tpope/vim-fugitive'
Plug 'juneedahamed/vc.vim'
"Plug 'mhinz/vim-signify'			" - removed to avoid clashes with ALE
Plug 'airblade/vim-gitgutter'

" Look and Feel
Plug 'ryanoasis/vim-devicons'
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'itchyny/lightline.vim'
Plug 'delphinus/lightline-delphinus'
Plug 'christoomey/vim-tmux-navigator'

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
" source ~/.vim/plugin_config/LanguageClient.vim
source ~/.vim/plugin_config/deoplete.vim
source ~/.vim/plugin_config/deoplete-clang2.vim
" source ~/.vim/plugin_config/nvim-completion-manager.vim
source ~/.vim/plugin_config/fzf.vim
source ~/.vim/plugin_config/nerdtree.vim
source ~/.vim/plugin_config/lightline.vim
source ~/.vim/plugin_config/gutentags.vim
source ~/.vim/plugin_config/tcomment.vim
" source ~/.vim/plugin_config/signify.vim
if has('nvim') || v:version >= 704
	" source ~/.vim/plugin_config/ycm.vim
endif
" source ~/.vim/plugin_config/incsearch.vim
source ~/.vim/plugin_config/ale.vim

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

" ======
" gonvim
" ======
let g:gonvim_draw_statusline = 0
let g:gonvim_draw_lint = 0
