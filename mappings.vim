" ----------------------------------------
" Mappings
" ----------------------------------------

" Set leader to ,
" Note: This line MUST come before any <leader> mappings
let mapleader=','
let maplocalleader = ' '

" -----------------------
" Unmapped While Learning
" -----------------------

" " No-op ^ and $ while learning H and L
" noremap ^ <nop>
" noremap $ <nop>
nnoremap <leader>sc <nop>

" ---------------
" Regular Mappings
" ---------------

" Use ; for : in normal and visual mode, less keystrokes
" nnoremap ; :
" vnoremap ; :

" Yank entire buffer with gy
nnoremap gy :0,$ y<cr>

" Select entire buffer
nnoremap vy ggVG

" Make Y behave like other capital commands.
" Hat-tip http://vimbits.com/bits/11
nnoremap Y y$

" Just to beginning and end of lines easier. From http://vimbits.com/bits/16
noremap H ^
noremap L $

" Create newlines without entering insert mode
nnoremap go o<Esc>k
nnoremap gO O<Esc>j

" remap U to <C-r> for easier redo
" from http://vimbits.com/bits/356
nnoremap U <C-r>

" Swap implementations of ` and ' jump to markers
" By default, ' jumps to the marked line, ` jumps to the marked line and
" column, so swap them
nnoremap ' `
nnoremap ` '

" Don't move on *
nnoremap <silent> * :let stay_star_view = winsaveview()<cr>*:call winrestview(stay_star_view)<cr>

" ---------------
" Window Movement
" ---------------
nnoremap <silent> gh :wincmd h<CR>
" nnoremap <silent> <M-h> :wincmd h<CR>
nnoremap <silent> gj :wincmd j<CR>
nnoremap <silent> gk :wincmd k<CR>
" nnoremap <silent> <M-k> :wincmd k<CR>
nnoremap <silent> gl :wincmd l<CR>
" nnoremap <silent> <M-l> :wincmd l<CR>

"   4 Window Splits
"
"   -----------------
"   g1 | g2 | g3 | g4
"   -----------------
nnoremap <silent> g1 :wincmd t<CR>
nnoremap <silent> g2 :wincmd t<bar>:wincmd l<CR>
nnoremap <silent> g3 :wincmd t<bar>:wincmd l<bar>
      \:wincmd l<CR>
nnoremap <silent> g4 :wincmd b<CR>

if version > 702
	" Equal Size Windows
	nnoremap <silent> g= :wincmd =<CR>
	" Swap Windows
	nnoremap <silent> gx :wincmd x<CR>
endif

" ---------------
" Modifer Mappings
" ---------------

" Make line completion easier.
inoremap <C-l> <C-x><C-l>

" Scroll larger amounts with C-j / C-k
nnoremap gj 15gjzz
nnoremap gk 15gkzz
vnoremap gj 15gjzz
vnoremap gk 15gkzz

" ---------------
" Insert Mode Mappings
" ---------------

" Let's make escape better, together.
inoremap jk <Esc>
inoremap JK <Esc>
inoremap Jk <Esc>
inoremap jK <Esc>

" ---------------
" Leader Mappings
" ---------------

" Clear search
noremap <silent><leader>/ :nohls<CR>:call clearmatches()<cr>

" Highlight search word under cursor without jumping to next
nnoremap <leader>h *<C-O>

" Toggle spelling mode
nnoremap <silent> <leader>sp :set spell!<CR>

" Quickly switch to last buffer
nnoremap <leader>, :e#<CR>

" Underline the current line with '-'
nnoremap <silent> <leader>ul :t.\|s/./-/\|:nohls<cr>

" Underline the current line with '='
nnoremap <silent> <leader>uul :t.\|s/./=/\|:nohls<cr>

" Surround the commented line with lines.
"
" Example:
"          # Test 123
"          becomes
"          # --------
"          # Test 123
"          # --------
nnoremap <silent> <leader>cul :normal "lyy"lpwvLr-^"lyyk"lP<cr>

" Format the entire file
nnoremap <leader>fef mx=ggG='x

" Format a json file with Underscore CLI
" Inspirited by https://github.com/spf13/spf13-vim/blob/3.0/.vimrc#L390
nnoremap <leader>fj <Esc>:%!underscore print<CR><Esc>:set filetype=json<CR>

" Split window vertically or horizontally *and* switch to the new split!
nnoremap <silent> <leader>hs :split<Bar>:wincmd j<CR>:wincmd =<CR>
nnoremap <silent> <leader>vs :vsplit<Bar>:wincmd l<CR>:wincmd =<CR>

" Close the current window
nnoremap <silent> <m-w> :close<CR>

" ---------------
" Typo Fixes
" ---------------

noremap <F1> <Esc>
inoremap <F1> <Esc>
cnoremap w' w<CR>

" Disable the ever-annoying Ex mode shortcut key. Type visual my ass. Instead,
" make Q repeat the last macro instead. *hat tip* http://vimbits.com/bits/263
nnoremap Q @@

" Removes doc lookup mapping because it's easy to fat finger and never useful.
" nnoremap K k
" vnoremap K k

" Toggle paste mode with F6
" nnoremap <silent> <F6> :set paste!<CR>

" Paste and select pasted
nnoremap <expr> gpp '`[' . strpart(getregtype(), 0, 1) . '`]'

" Insert date
iabbrev ddate <C-R>=strftime("%Y-%m-%d")<CR>

" Map f5 to change current buffers working directory to
" match the file being edited
nnoremap <F5> :lcd %:p:h<CR>:pwd<CR>

" Merging, accept remote
nnoremap <F8> :diffget RE<CR>n

" Jump to next error
nnoremap <F9> :cnext<CR>

"--------------------
" Function: Open tag under cursor in new tab
" Source:   http://stackoverflow.com/questions/563616/vimctags-tips-and-tricks
"--------------------
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" copy current file name (relative/absolute) to system clipboard
" from http://stackoverflow.com/a/17096082/22423
if has('mac') || has('gui_macvim') || has('gui_mac')
  " relative path  (src/foo.txt)
  nnoremap <silent> <leader>yp :let @*=expand("%")<CR>

  " absolute path  (/something/src/foo.txt)
  nnoremap <silent> <leader>yP :let @*=expand("%:p")<CR>

  " filename       (foo.txt)
  nnoremap <silent> <leader>yf :let @*=expand("%:t")<CR>

  " directory name (/something/src)
  nnoremap <silent> <leader>yd :let @*=expand("%:p:h")<CR>
endif

" --------------
" Highlight Word
" --------------
"
" This mini-plugin provides a few mappings for highlighting words temporarily.
"
" Sometimes you're looking at a hairy piece of code and would like a certain
" word or two to stand out temporarily.  You can search for it, but that only
" gives you one color of highlighting.  Now you can use <leader>N where N is
" a number from 1-6 to highlight the current word in a specific color.

function! HiInterestingWord(n)
    " Save our location.
    normal! mz

    " Yank the current word into the z register.
    normal! "zyiw

    " Calculate an arbitrary match ID.  Hopefully nothing else is using it.
    let mid = 86750 + a:n

    " Clear existing matches, but don't worry if they don't exist.
    silent! call matchdelete(mid)

    " Construct a literal pattern that has to match at boundaries.
    let pat = '\V\<' . escape(@z, '\') . '\>'

    " Actually match the words.
    call matchadd("InterestingWord" . a:n, pat, 1, mid)

    " Move back to our original location.
    normal! `z
endfunction

function! UnHiWords()
	silent! call matchdelete(86751)
	silent! call matchdelete(86752)
	silent! call matchdelete(86753)
	silent! call matchdelete(86754)
	silent! call matchdelete(86755)
	silent! call matchdelete(86756)
endfunction

" Mappings

nnoremap <silent> <leader>1 :call HiInterestingWord(1)<cr>
nnoremap <silent> <leader>2 :call HiInterestingWord(2)<cr>
nnoremap <silent> <leader>3 :call HiInterestingWord(3)<cr>
nnoremap <silent> <leader>4 :call HiInterestingWord(4)<cr>
nnoremap <silent> <leader>5 :call HiInterestingWord(5)<cr>
nnoremap <silent> <leader>6 :call HiInterestingWord(6)<cr>

" remove all word highlights
nnoremap <silent> <leader>0 :call UnHiWords()<cr>

" Default Highlights

hi def InterestingWord1 guifg=#000000 ctermfg=16 guibg=#6c71c4 ctermbg=214
hi def InterestingWord2 guifg=#000000 ctermfg=16 guibg=#268bd2 ctermbg=154
hi def InterestingWord3 guifg=#000000 ctermfg=16 guibg=#2aa198 ctermbg=121
hi def InterestingWord4 guifg=#000000 ctermfg=16 guibg=#859900 ctermbg=137
hi def InterestingWord5 guifg=#000000 ctermfg=16 guibg=#cb4b16 ctermbg=211
hi def InterestingWord6 guifg=#000000 ctermfg=16 guibg=#dc322f ctermbg=195

" mappings for opening/closing nerdtree
nnoremap <silent><leader>nn :NERDTreeToggle<CR>:wincmd =<CR>
nnoremap <silent><leader>nf :NERDTreeFind<CR>:wincmd =<CR>
