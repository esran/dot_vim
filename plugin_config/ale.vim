" ============================
" ALE configuration

let g:ale_statusline_format = [' %d', ' %d', '']

" let g:ale_perl_perl_options = '-X -c -Mwarnings -Ilib -I$HOME/work/PostgreSQL/V6-5/src/test/JustOne/lib -I$HOME/work/PostgreSQL/V6-5/src/test/JustOne/scripts -I$HOME/work/PostgreSQL/V6-5/src/test/JustOne/scripts/groups/edgistar/scripts'
" let g:ale_perl_perl_executable = 'cd ' . fnameescape(fnamemodify(bufname(a:buffer), ':p:h')) . ' && ' . 'perl'
let g:ale_perl_perl_options = '-X -c -Mwarnings -Ilib <'

" let g:ale_linter_aliases = {
" 			\ 'zsh' : 'sh'
" 			\}

let g:ale_java_javac_classpath =
			\ '/opt/sean/PostgreSQL/lib/postgresql-9.3-1103.jdbc4.jar:./src/bin/jolo'

let g:ale_linters = {
			\ 'zsh': ['shell','shellcheck'],
			\ 'bash': ['shell','shellcheck'],
			\ 'c': ['gcc'],
			\ 'c++': ['g++'],
			\ 'cpp': ['g++'],
			\}

let g:ale_cpp_gcc_options = ''
            \ . ' -DJUSTONE '
            \ . ' -Isrc/include '
            \ . ' -I$JO_INST_JO/include '

let g:ale_c_cppcheck_options = '--enable=style'

" Hacked c_gcc to use compile_commands to don't want any extra options
let g:ale_c_gcc_options = ''
