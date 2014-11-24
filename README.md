# The Vim Configuration of Champions

Forked from [mutewinter](http://github.com/mutewinter/dot_vim.git).

Various personal tweaks.

* Trimmed the list of plugins, mostly removing a lot of ruby stuff
* Default indent 4, not 2. And use tabs for that (I know, terrible!).
* Add a couple of tags plugins.
* Provide a hook for host specific configuration. (hosts/vimrc_{HOSTNAME}).
* Function/mappings for moving buffers between tabs.
* Tweak GUI parameters and have them work on non-Mac too.
* Removed mapping for <enter> in normal mode, as I often use it to step lines

Version 3! Now each plugin is included and managed in its
[own file](vundle_plugins)!

[![iTerm][ss]][ss]

[ss]: https://github.com/mutewinter/dot_vim/raw/master/screenshots/iTerm.png

## Installation

1. `git clone http://github.com/esran/dot_vim.git ~/.vim`.
1. `cd ~/.vim`.

Now you have a choice. The automated script or the manual process.

1. Run `scripts/setup`.

**or**

1. `rake vim:link` to make the .vimrc symbolic link.
2. Install [Vundle](https://github.com/gmarik/vundle) with `git clone
   http://github.com/gmarik/vundle.git bundle/vundle`
3. `vim +PluginInstall +qall`

Enjoy enhanced productivity, increased levitation, reduced watermelon-related
accidents, and startling sex appeal.

## Vim Requirements

* [MacVim](https://github.com/b4winckler/macvim) - I'm currently using
[snapshot 73](https://github.com/b4winckler/macvim/releases) on Mavericks.

## Plugin Requirements

Here's a list of plugins that require further installation or have
dependencies.

* [Fugitive](https://github.com/tpope/vim-fugitive) Requires Git to be
  installed.
* [syntastic](https://github.com/scrooloose/syntastic) Requires many different
  binaries installed depending on what filetypes you want it to check. See the
  [FAQ](https://github.com/scrooloose/syntastic#faq) for more information.
* [Ag.vim](https://github.com/rking/ag.vim) Requires
  [The Silver Searcher](https://github.com/ggreer/the_silver_searcher) to be
  installed.
* [Source Code for Powerline](http://git.io/H3fYBg) The custom font I'm using
  for vim-airline.
* [CtrlP C Matching Extension](https://github.com/JazzCore/ctrlp-cmatcher)
  requires compilation. See the steps [in its
  readme](https://github.com/JazzCore/ctrlp-cmatcher).
* [underscore-cli](https://github.com/ddopson/underscore-cli) for sweet JSON
  formatting.

## Mappings

* Typing `jk` insert mode is equivalent to `Escape`.

And many more. See [`mappings.vim`](mappings.vim) and
[`vundle_plugins`](vundle_plugins) for more.

## Installing Custom Plugins

Create a new `.vim` file with the same name as the plugin you'd like to install
in [`vundle_plugins/custom`](vundle_plugins/custom). Then add the installation
block. For example:

`vundle_plugins/custom/vim-move.vim`

```viml
if exists('g:vundle_installing_plugins')
  Plugin 'matze/vim-move.vim'
  finish
endif

let g:move_key_modifier = 'C'
```

This example installs [`vim-move`](https://github.com/matze/vim-move).

## Plugin List

| Stars___ | **Plugin** | **Description** |
| -------: | :--------- | :-------------- |
| 4,873 :star: |[vim-fugitive](https://github.com/tpope/vim-fugitive) [:page_facing_up:](vundle_plugins/vim-fugitive.vim)|fugitive.vim: a Git wrapper so awesome, it should be illegal |
| 4,171 :star: |[vim-airline](https://github.com/bling/vim-airline) [:page_facing_up:](vundle_plugins/vim-airline.vim)|lean & mean status/tabline for vim that's light as air |
| 4,104 :star: |[syntastic](https://github.com/scrooloose/syntastic) [:page_facing_up:](vundle_plugins/syntastic.vim)|Syntax checking hacks for vim |
| 3,970 :star: |[nerdtree](https://github.com/scrooloose/nerdtree) [:page_facing_up:](vundle_plugins/nerdtree.vim)|A tree explorer plugin for vim. |
| 3,780 :star: |[ctrlp.vim](https://github.com/kien/ctrlp.vim) [:page_facing_up:](vundle_plugins/ctrlp.vim)|Fuzzy file, buffer, mru, tag, etc finder. |
| 2,698 :star: |[vim-colors-solarized](https://github.com/altercation/vim-colors-solarized) [:page_facing_up:](vundle_plugins/vim-colors-solarized.vim)|precision colorscheme for the vim text editor |
| 2,342 :star: |[vim-surround](https://github.com/tpope/vim-surround) [:page_facing_up:](vundle_plugins/vim-surround.vim)|surround.vim: quoting/parenthesizing made simple |
| 2,159 :star: |[emmet-vim](https://github.com/mattn/emmet-vim)|emmet for vim: http://emmet.io/ |
| 1,477 :star: |[tagbar](https://github.com/majutsushi/tagbar) [:page_facing_up:](vundle_plugins/tagbar.vim)|Vim plugin that displays tags in a window, ordered by scope |
| 1,232 :star: |[ultisnips](https://github.com/SirVer/ultisnips) [:page_facing_up:](vundle_plugins/ultisnips.vim)|UltiSnips - The ultimate snippet solution for Vim. Send pull requests to SirVer/ultisnips! |
| 1,231 :star: |[supertab](https://github.com/ervandew/supertab)|Perform all your vim insert mode completions with Tab |
| 1,133 :star: |[vim-ruby](https://github.com/vim-ruby/vim-ruby)|Vim/Ruby Configuration Files |
| 954 :star: |[vim-javascript](https://github.com/pangloss/vim-javascript)|Vastly improved Javascript indentation and syntax support in Vim. |
| 952 :star: |[vim-indent-guides](https://github.com/nathanaelkane/vim-indent-guides) [:page_facing_up:](vundle_plugins/vim-indent-guides.vim)|A Vim plugin for visually displaying indent levels in code |
| 917 :star: |[vim-dispatch](https://github.com/tpope/vim-dispatch) [:page_facing_up:](vundle_plugins/vim-dispatch.vim)|dispatch.vim: asynchronous build and test dispatcher |
| 904 :star: |[tabular](https://github.com/godlygeek/tabular) [:page_facing_up:](vundle_plugins/tabular.vim)|Vim script for text filtering and alignment |
| 839 :star: |[vimux](https://github.com/benmills/vimux) [:page_facing_up:](vundle_plugins/vimux.vim)|vim plugin to interact with tmux |
| 733 :star: |[vim-unimpaired](https://github.com/tpope/vim-unimpaired)|unimpaired.vim: pairs of handy bracket mappings |
| 690 :star: |[delimitMate](https://github.com/Raimondi/delimitMate)|Vim plugin, provides insert mode auto-completion for quotes, parens, brackets, etc. |
| 641 :star: |[vim-startify](https://github.com/mhinz/vim-startify) [:page_facing_up:](vundle_plugins/vim-startify.vim)|A fancy start screen for Vim. |
| 594 :star: |[vim-signify](https://github.com/mhinz/vim-signify) [:page_facing_up:](vundle_plugins/vim-signify.vim)|Show a VCS diff using Vim's sign column. |
| 512 :star: |[vim-repeat](https://github.com/tpope/vim-repeat)|repeat.vim: enable repeating supported plugin maps with "." |
| 490 :star: |[ag.vim](https://github.com/rking/ag.vim) [:page_facing_up:](vundle_plugins/ag.vim)|Vim plugin for the_silver_searcher, 'ag', a replacement for the Perl module / CLI script 'ack' |
| 480 :star: |[html5.vim](https://github.com/othree/html5.vim)|HTML5 omnicomplete and syntax |
| 462 :star: |[vim-abolish](https://github.com/tpope/vim-abolish)|abolish.vim: easily search for, substitute, and abbreviate multiple variants of a word |
| 436 :star: |[vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator) [:page_facing_up:](vundle_plugins/vim-tmux-navigator.vim)|Seamless navigation between tmux panes and vim splits |
| 429 :star: |[tcomment_vim](https://github.com/tomtom/tcomment_vim) [:page_facing_up:](vundle_plugins/tcomment_vim.vim)|An extensible & universal comment vim-plugin that also handles embedded filetypes |
| 376 :star: |[vim-session](https://github.com/xolox/vim-session) [:page_facing_up:](vundle_plugins/vim-session.vim)|Extended session management for Vim (:mksession on steroids) |
| 341 :star: |[vim-endwise](https://github.com/tpope/vim-endwise)|endwise.vim: wisely add "end" in ruby, endfunction/endif/more in vim script, etc |
| 314 :star: |[tmuxline.vim](https://github.com/edkolev/tmuxline.vim) [:page_facing_up:](vundle_plugins/tmuxline.vim)|Simple tmux statusline generator with support for powerline symbols and statusline / airline / lightline integration |
| 295 :star: |[vim-json](https://github.com/elzr/vim-json)|A better JSON for Vim: distinct highlighting of keywords vs values, JSON-specific (non-JS) warnings, quote concealing. Pathogen-friendly. |
| 280 :star: |[vim-eunuch](https://github.com/tpope/vim-eunuch)|eunuch.vim: helpers for UNIX |
| 264 :star: |[vim-css3-syntax](https://github.com/hail2u/vim-css3-syntax)|Add CSS3 syntax support to vim's built-in `syntax/css.vim`. |
| 234 :star: |[undotree](https://github.com/mbbill/undotree)|Display your undo history in a graph. |
| 231 :star: |[webapi-vim](https://github.com/mattn/webapi-vim)|vim interface to Web API |
| 171 :star: |[promptline.vim](https://github.com/edkolev/promptline.vim) [:page_facing_up:](vundle_plugins/promptline.vim)|Generate a fast shell prompt with powerline symbols and airline colors |
| 164 :star: |[switch.vim](https://github.com/AndrewRadev/switch.vim) [:page_facing_up:](vundle_plugins/switch.vim)|A simple Vim plugin to switch segments of text with predefined replacements |
| 155 :star: |[csv.vim](https://github.com/chrisbra/csv.vim) [:page_facing_up:](vundle_plugins/csv.vim)|A Filetype plugin for csv files |
| 153 :star: |[MatchTagAlways](https://github.com/Valloric/MatchTagAlways) [:page_facing_up:](vundle_plugins/MatchTagAlways.vim)|A Vim plugin that always highlights the enclosing html/xml tags |
| 97 :star: |[vim-markdown](https://github.com/gabrielelana/vim-markdown)|Markdown for Vim: a complete environment to create Markdown files with a syntax highlight that don't sucks! |
| 87 :star: |[matchit.zip](https://github.com/vim-scripts/matchit.zip)|extended % matching for HTML, LaTeX, and many other languages |
| 85 :star: |[vim-misc](https://github.com/xolox/vim-misc)|Miscellaneous auto-load Vim scripts |
| 79 :star: |[vim-visual-star-search](https://github.com/nelstrom/vim-visual-star-search)|Start a * or # search from a visual block |
| 77 :star: |[colorv.vim](https://github.com/Rykka/colorv.vim) [:page_facing_up:](vundle_plugins/colorv.vim)|A powerful color tool in vim |
| 47 :star: |[L9](https://github.com/vim-scripts/L9)|Vim-script library |
| 41 :star: |[portkey](https://github.com/dsawardekar/portkey) [:page_facing_up:](vundle_plugins/portkey.vim)|Navigate files at the speed of Vim. |
| 36 :star: |[vim-togglelist](https://github.com/milkypostman/vim-togglelist)|Functions to toggle the [Location List] and the [Quickfix List] windows. |
| 35 :star: |[Join](https://github.com/sk1418/Join)|a better (hopefully) :Join command in vim |
| 25 :star: |[nerdtree-git-plugin](https://github.com/Xuyuanp/nerdtree-git-plugin) [:page_facing_up:](vundle_plugins/nerdtree-git-plugin.vim)|A plugin of NERDTree showing git status |
| 25 :star: |[vim-togglecursor](https://github.com/jszakmeister/vim-togglecursor) [:page_facing_up:](vundle_plugins/vim-togglecursor.vim)|Toggle the cursor shape in the terminal for Vim. |
| 19 :star: |[QFEnter](https://github.com/yssl/QFEnter)|Open a Quickfix item in a window you choose. (Vim plugin) |
| 14 :star: |[funcoo.vim](https://github.com/rizzatti/funcoo.vim) [:page_facing_up:](vundle_plugins/funcoo.vim)|Functional Object Oriented VimL |
| 11 :star: |[cscope_maps](https://github.com/chazy/cscope_maps) [:page_facing_up:](vundle_plugins/cscope_maps.vim)|cscope keyboard mappings for VIM |
| 11 :star: |[greper.vim](https://github.com/rizzatti/greper.vim) [:page_facing_up:](vundle_plugins/greper.vim)|Search, the way it should be. |
| 10 :star: |[vimprj](https://github.com/vim-scripts/vimprj) [:page_facing_up:](vundle_plugins/vimprj.vim)|Plugin for managing options for different projects |
| 10 :star: |[indexer.tar.gz](https://github.com/vim-scripts/indexer.tar.gz) [:page_facing_up:](vundle_plugins/indexer.tar.gz.vim)|indexing all files in project with ctags (can work as add-on for project.tar.gz) |
| 10 :star: |[vim-voogle](https://github.com/papanikge/vim-voogle) [:page_facing_up:](vundle_plugins/vim-voogle.vim)|google for the word under the cursor to a browser because 2013 |
| 6 :star: |[indenthtml.vim](https://github.com/vim-scripts/indenthtml.vim) [:page_facing_up:](vundle_plugins/indenthtml.vim)|alternative html indent script |
| 3 :star: |[DfrankUtil](https://github.com/vim-scripts/DfrankUtil) [:page_facing_up:](vundle_plugins/DfrankUtil.vim)|Just a library for some scripts. |
| 3 :star: |[swap-parameters](https://github.com/mutewinter/swap-parameters)|Swap parameters of a function or a comma separated list with a single command. |
| 2 :star: |[keepcase.vim](https://github.com/vim-scripts/keepcase.vim) [:page_facing_up:](vundle_plugins/keepcase.vim)|Functions for doing case-persistant substitutions |
| 2 :star: |[YouCompleteMe](https://github.com/blueyed/YouCompleteMe) [:page_facing_up:](vundle_plugins/YouCompleteMe.vim)|A slightly modified fork of YCM: A code-completion engine for Vim |
| 1 :star: |[Shortcut-functions-for-KeepCase-script-](https://github.com/vim-scripts/Shortcut-functions-for-KeepCase-script-) [:page_facing_up:](vundle_plugins/Shortcut-functions-for-KeepCase-script-.vim)|Makes substitutions using Michael Geddes' KeepCase functions easier |
| 1 :star: |[HelpClose](https://github.com/vim-scripts/HelpClose)|Close all help windows |
| 1 :star: |[Conque-Shell](https://github.com/jewes/Conque-Shell) [:page_facing_up:](vundle_plugins/Conque-Shell.vim)|Run interactive commands inside a Vim buffer - https://code.google.com/p/conque/ |
| 0 :star: |[vim-autoreadwatch](https://github.com/mutewinter/vim-autoreadwatch)|A forked script for vim auto reloading of buffers when changed on disk. |
| 0 :star: |[vim-tmux](https://github.com/mutewinter/vim-tmux)|http://tmux.svn.sourceforge.net/viewvc/tmux/trunk/examples/tmux.vim?view=log |


_That's 67 plugins, holy crap._

_Generated by `rake update_readme` on 2014/11/24._

