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
			\ 'c': [],
			\ 'c++': [],
			\ 'cpp': [],
			\}

let g:ale_c_gcc_options =
			\ '-Wall -Wmissing-prototypes -Wpointer-arith -Wdeclaration-after-statement -Wendif-labels -Wmissing-format-attribute -Wformat-security -fno-strict-aliasing -fwrapv -fexcess-precision=standard '
			\ . ' -I .'
			\ . ' -D JUSTONE'
			\ . ' -D JO_STATIC=static'
			\ . ' -I src/include'
			\ . ' -I src/interfaces/libpq'
			\ . ' -I src/test/cmocka'
			\ . ' -I ' . $JO_INST_JO . '/include'

let g:ale_cpp_gcc_options =
			\ '-Wall -Wmissing-prototypes -Wpointer-arith -Wdeclaration-after-statement -Wendif-labels -Wmissing-format-attribute -Wformat-security -fno-strict-aliasing -fwrapv -fexcess-precision=standard '
			\ . ' -I .'
			\ . ' -D JUSTONE'
			\ . ' -D JO_STATIC=static'
			\ . ' -I src/include'
			\ . ' -I src/test/cmocka'
			\ . ' -I ' . $JO_INST_JO . '/include'
