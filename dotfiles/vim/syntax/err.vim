set nocursorcolumn
set nocursorline
syntax sync minlines=1 maxlines=1

" This creates a keyword ERROR and puts it in the highlight group called log_error
syn keyword log_error ERROR
syn keyword log_run RUN

syn match log_date /\d\{4}-\d\{2}-\d\{2}/
syn match log_time /\d\{2}:\d\{2}:\d\{2}/
syn match log_elapsed_time /\d\{2}:\d\{2}:\d\{2}:\d\{2}/
syn match log_begin /^\d\d\d\d-\d\d-\d\d \d\d:\d\d:\d\d-\d\d\d\d blade\d*-\d*-\d*: /

" Directories and file paths
syn match log_path /[a-zA-Z0-9.\-_+]*[/][a-zA-Z0-9.\-_/+]*/
syn match url /http[s]*[^ ]*/

" quoted strings
syn match log_single_quoted_strings /'.*'/
syn match log_double_quoted_strings /".*"/

" perl modules
syn match log_perl_module /[a-zA-Z0-9.\-_]*::[a-zA-Z0-9._/\(\)]*/

" Now make them appear:
" Link just links logError to the colouring for error
hi link log_error Error
hi link log_run PmenuSel

" Def means default colour - colourschemes can override
hi def log_begin ctermfg=7

hi def log_date ctermfg=2
hi def log_time ctermfg=2
hi def log_elapsed_time ctermfg=3

hi def log_path ctermfg=4
hi def url ctermfg=5
hi def log_perl_module ctermfg=5

hi def log_tools ctermfg=7

hi def log_single_quoted_strings ctermfg=7
hi def log_double_quoted_strings ctermfg=6
