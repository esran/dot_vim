" ============================
" fix dodgy chars issue
if has('nvim')
	let $VTE_VERSION = '100'
    set guicursor=
endif

" ============================
" Load plugins, using vim-plug
call plug#begin()

" Color schemes
if has('nvim')
    if exists('g:GuiLoaded')
        Plug 'flazz/vim-colorschemes'
    endif
else
    Plug 'flazz/vim-colorschemes'
endif

" Solarized
if has('nvim')
    Plug 'Samuel-Phillips/nvim-colors-solarized'
else
    Plug 'altercation/vim-colors-solarized'
endif

" Completion
if v:version >= 704
    Plug 'Valloric/YouCompleteMe', { 'do': 'CXX=clang ./install.py --clang-completer --system-libclang' }
else
    if has('nvim')
        Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
        Plug 'tweekmonster/deoplete-clang2'
    endif
endif
Plug 'ervandew/supertab'


" Finding Stuff
Plug 'junegunn/fzf', { 'dir': '~/stuff/fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
    " configuration options
    let g:NERDTreeShowBookmarks = 1
    let g:NERDTreeChDirMode = 1
    let g:NERDTreeMinimalUI = 1
    let g:NERDTreeNaturalSort = 1
    " close vim if nerdtree is the last buffer
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType")
                \ && b:NERDTreeType == "primary") | q | endif
    " Filter some files out
    let g:NERDTreeIgnore = [ '\~$', '.o$', '\.pyc$' ]
    " https://github.com/ryanoasis/vim-webdevicons
    " NERDTree File highlighting
    function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
        exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermfg='. a:fg .' guifg='. a:guifg
        exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
    endfunction
    " Set colours
    call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
    call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
    call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
    call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
    call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
    call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
    call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
    " C and H files
    call NERDTreeHighlightFile('c', 'Red', 'none', '#ffa500', '#151515')
    call NERDTreeHighlightFile('cpp', 'Red', 'none', '#ffa500', '#151515')
    call NERDTreeHighlightFile('h', 'green', 'none', 'green', '#151515')
    " Don't show ignored status
    let g:NERDTreeShowIgnoredStatus = 0


" Editing Tools
Plug 'mutewinter/vim-autoreadwatch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'majutsushi/tagbar'
Plug 'cohama/lexima.vim'
Plug 'tomtom/tcomment_vim'
Plug 'battlesnake/pgsql.vim'
if !has('nvim') && v:version > 703
	Plug 'haya14busa/incsearch.vim'
endif

" Coding Tools
" Plug 'scrooloose/syntastic'		" - replaced by ALE
Plug 'w0rp/ale'
if has('nvim') || v:version >= 704
	Plug 'ludovicchabant/vim-gutentags'
endif
Plug 'erig0/cscope_dynamic'
    let g:cscopedb_big_file = 'cscope.db.big'
    let g:cscopedb_small_file = 'cscope.db.small'
    let g:cscopedb_auto_init = 1
    let g:cscopedb_auto_files = 1
    let g:cscopedb_resolve_links = 1
    nmap <F11> <Plug>CscopeDBInit
Plug 'chazy/cscope_maps'
Plug 'tpope/vim-endwise'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/vader.vim'
Plug 'jiangmiao/auto-pairs'

" Source Countrol
Plug 'tpope/vim-fugitive'
Plug 'juneedahamed/vc.vim'
Plug 'airblade/vim-gitgutter'

" Look and Feel
Plug 'ryanoasis/vim-devicons'
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
source ~/.vim/plugin_config/deoplete.vim
source ~/.vim/plugin_config/deoplete-clang2.vim
source ~/.vim/plugin_config/fzf.vim
source ~/.vim/plugin_config/gutentags.vim
source ~/.vim/plugin_config/tcomment.vim
source ~/.vim/plugin_config/ale.vim
source ~/.vim/plugin_config/lightline.vim
source ~/.vim/plugin_config/vim-devicons.vim

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

" ----------
" file types
" ----------
augroup filetypedetect
    au BufRead,BufNewFile *.py_in               setfiletype python
    au BufRead,BufNewFile *.sql_in,*.setup_in   setfiletype sql
augroup END
