" ============================
" ALE configuration

let g:ale_statusline_format = [' %d', ' %d', '']

" directories to look for compile_commands.json in
let g:ale_c_build_dir_names = [ '.', 'build', 'ninja' ]

" Hacked c_gcc to use compile_commands to don't want any extra options
let g:ale_c_gcc_options = ''

" Ignore long line warnings
" Ignore imports after sys.path.append()
let g:ale_python_flake8_options = '--ignore=E501,E402'

" Which linters to use (overriding defaults)
let g:ale_linters = {
			\ 'zsh': ['shell','shellcheck'],
			\ 'bash': ['shell','shellcheck'],
			\ 'c': ['gcc'],
			\ 'c++': ['g++'],
			\ 'cpp': ['g++'],
            \ 'perl': ['perl', 'perlcritic'],
			\}

" perlcritic defaults
let g:ale_perl_perlcritic_showrules = 1
let g:ale_type_map = {
            \ 'perlcritic': {'ES': 'WS', 'E': 'W'}
            \}

" Some default options for cpp
let g:ale_cpp_gcc_options = ''
            \ . ' -Isrc/include '
            \ . ' -I$JO_INST_JO/include '

function! ALEPerlConfig()
    let b:ale_perl_perl_options = '-X -c -Mwarnings'
    let l:path = expand('%:p:h')

    " anything under src/test/JustOne includes src/test/JustOne/lib
    let l:match = matchstr(l:path, '.*/src/test/JustOne')
    if l:match != ''
        let b:ale_perl_perl_options .= ' -I' . l:match . '/lib'
    endif

    " anything in the scripts directory includes the scripts directory
    let l:match = matchstr(l:path, '.*/src/test/JustOne/scripts')
    if l:match != ''
        let b:ale_perl_perl_options .= ' -I' . l:match
    endif

    " anything in a scripts group includes that group's scripts directory
    let l:match = matchstr(l:path, '.*/src/test/JustOne/scripts/groups/[^/]*')
    if l:match != ''
        let b:ale_perl_perl_options .= ' -I' . l:match . '/scripts'
    endif

    " include script's directory
    let b:ale_perl_perl_options .= ' -I' . l:path
endfunction

function! ALECFindCompileArgs(buffer) abort
    let l:compile_args = {}

    let l:compile_commands_path = ale#path#FindNearestFile(a:buffer, 'compile_commands.json')

    if !empty(l:compile_commands_path) && filereadable(l:compile_commands_path)
        for l:elem in json_decode(readfile(l:compile_commands_path))
            if ale#path#IsBufferPath(a:buffer, l:elem.file)
                let l:compile_args.directory = l:elem.directory
                " skip unwanted stuff
                "   first arg (compiler)
                "   last arg (filename)
                "    -o objectfile
                "    -c
                let l:skip = 0
                let l:args = []
                for l:arg in l:elem.arguments[2:-2]
                    if l:skip == 1
                        let l:skip = 0
                    elseif l:arg ==# '-o'
                        " skip next 1 arg as well
                        let l:skip = 1
                    elseif l:arg ==# '-c'
                        " simply omit
                    else
                        let l:args += [l:arg]
                    endif
                endfor

                let l:compile_args.args = join(l:args, ' ')

                break
            endif
        endfor
    endif

    return l:compile_args
endfunction

function! ALECConfig()
    " attempt to get args from compilation database
    let l:args = ALECFindCompileArgs(bufnr(''))

    " if we've found compile args then use those
    if has_key(l:args, 'args') && has_key(l:args, 'directory')
        let b:ale_command_wrapper = 'cd ' . l:args.directory . ' && '
        let b:ale_c_gcc_options = l:args.args
        return
    endif

    let b:ale_c_gcc_options = ' -DJO_STATIC=static '
    let l:path = expand('%:p:h')

    let l:match = matchstr(l:path, '.*/work/PostgreSQL/[^/]*')
    if l:match != ''
        let b:ale_c_gcc_options .= ' -I' . l:match . '/src/include'
    endif

    let l:match = matchstr(l:path, '.*/src/test/cmocka')
    if l:match != ''
        let b:ale_c_gcc_options .= ' -I' . l:match
        let b:ale_c_gcc_options .= ' -DJO_CMOCKA -UJO_STATIC -DJO_STATIC= '
    endif
endfunction

function! ALECPPConfig()
    " attempt to get args from compilation database
    let l:args = ALECFindCompileArgs(bufnr(''))

    " if we've found compile args then use those
    if has_key(l:args, 'args') && has_key(l:args, 'directory')
        let b:ale_command_wrapper = 'cd ' . l:args.directory . ' && '
        let b:ale_cpp_gcc_options = l:args.args
        return
    endif

    let b:ale_cpp_gcc_options = ''
    let l:path = expand('%:p:h')

    " PostgreSQL default includes
    let l:match = matchstr(l:path, '.*/work/PostgreSQL/[^/]*')
    if l:match != ''
        let b:ale_cpp_gcc_options .= ' -DJO_STATIC=static '
        let b:ale_cpp_gcc_options .= ' -I' . l:match . '/src/include'
    endif

    " PostgreSQL cmocka includes and definitions
    let l:match = matchstr(l:path, '.*/src/test/cmocka')
    if l:match != ''
        let b:ale_cpp_gcc_options .= ' -I' . l:match
        let b:ale_cpp_gcc_options .= ' -DJO_CMOCKA -UJO_STATIC -DJO_STATIC= '
    endif

    " JustOne default includes
    let l:match = matchstr(l:path, '.*/work/JustOne/[^/]*')
    if l:match != ''
        let b:ale_cpp_gcc_options .= ' -I' . l:match . '/src'
        let b:ale_cpp_gcc_options .= ' -I' . l:match . '/src/include'
    endif
endfunction

augroup MyALEConfig
    autocmd!
    autocmd FileType perl call ALEPerlConfig()
    autocmd FileType c call ALECConfig()
    autocmd FileType cpp call ALECPPConfig()
augroup END

" Default options for cppcheck
let g:ale_c_cppcheck_options = '--enable=style'

" let g:ale_perl_perl_options = '-X -c -Mwarnings -Ilib -I$HOME/work/PostgreSQL/V6-5/src/test/JustOne/lib -I$HOME/work/PostgreSQL/V6-5/src/test/JustOne/scripts -I$HOME/work/PostgreSQL/V6-5/src/test/JustOne/scripts/groups/edgistar/scripts'
" let g:ale_perl_perl_executable = 'cd ' . fnameescape(fnamemodify(bufname(a:buffer), ':p:h')) . ' && ' . 'perl'
" let g:ale_perl_perl_options = '-X -c -Mwarnings -Ilib <'

" let g:ale_linter_aliases = {
" 			\ 'zsh' : 'sh'
" 			\}

" let g:ale_java_javac_classpath =
" 			\ '/opt/sean/PostgreSQL/lib/postgresql-9.3-1103.jdbc4.jar:./src/bin/jolo'

