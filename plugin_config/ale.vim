" ============================
" ALE configuration

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
			\ 'c': ['cppcheck','gcc'],
			\ 'c++': ['cppcheck','g++'],
			\ 'cpp': ['cppcheck','g++'],
			\}

let g:ale_c_gcc_options =
			\ '-Wall -Wextra -Werror -Wno-long-long -Wno-variadic-macros -fexceptions '
			\ . ' -I .'
			\ . ' -D JUSTONE'
			\ . ' -D JO_STATIC=static'
			\ . ' -I src/include'
			\ . ' -I src/test/cmocka'
			\ . ' -I ' . $JO_INST_JO . '/include'

let g:ale_cpp_gcc_options =
			\ '-Wall -Wextra -Werror -Wno-long-long -Wno-variadic-macros -fexceptions '
			\ . ' -I .'
			\ . ' -D JUSTONE'
			\ . ' -D JO_STATIC=static'
			\ . ' -I src/include'
			\ . ' -I src/test/cmocka'
			\ . ' -I ' . $JO_INST_JO . '/include'
