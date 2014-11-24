if exists('g:vundle_installing_plugins')
  Plugin 'benmills/vimux'
  finish
endif

let g:VimuxUseNearestPane = 1
nnoremap <leader>cm :VimuxPromptCommand<CR>
function WriteAndVimuxRunLastCommand()
  :call WriteBufferIfNecessary()
  :call VimuxRunLastCommand()
endfunction
nnoremap <leader>w :call WriteAndVimuxRunLastCommand()<CR>
