
" let g:tmuxline_preset = {
"             \'a'    : '#S',
"             \'b'    : '#W',
"             \'c'    : '#H',
"             \'win'  : '#I #W',
"             \'cwin' : '#I #W',
"             \'x'    : '%a',
"             \'y'    : '#W %R',
"             \'z'    : '#H #{cpu_percentage} #{cpu_icon}' }


let g:tmuxline_preset = {
      \'a'    : ['#S', '#H', '#(cpu-load)'],
      \'win'  : ['#I', '#W'],
      \'cwin' : ['#I', '#W'],
      \'y'    : ['%R', '%a', '%Y']}
      " \'z'    : '#H'}
