" =============================================================================
" Who: Jeremy Mack (@mutewinter)
" Description: The Vim Configuration of Champions
" Version: 3.0 - Now each plugin is included and managed in its own file!
" =============================================================================
" Modified: Sean Johnston (@esran)
" Updates: Replaced Vundle with Vim-Plug
" =============================================================================

" All of the plugins are installed with Vundle from this file.
source ~/.vim/vundle.vim

" Automatically detect file types. (must turn on after Vundle)
" filetype plugin indent on

" Platform (Windows, Mac, etc.) configuration.
source ~/.vim/platforms.vim

" All of the Vim configuration.
source ~/.vim/config.vim

" New commands
source ~/.vim/commands.vim

" All hotkeys, not dependant on plugins, are mapped here.
source ~/.vim/mappings.vim

" Load plugin-specific configuration
source ~/.vim/plugins.vim

" Small custom functions.
source ~/.vim/functions.vim

" Auto commands.
source ~/.vim/autocmds.vim

" Load a host specific file, if present
let s:host_vimrc = $HOME . '/.vim/host/' . hostname() . '/vimrc'
if filereadable(s:host_vimrc)
	execute 'source ' . s:host_vimrc
endif
