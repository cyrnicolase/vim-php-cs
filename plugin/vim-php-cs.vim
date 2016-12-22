"==============================================
" File cs.vim
" Author: Cyrnicolase
"==============================================

if exists("g:phpcs_vim") || &cp
    finish
endif
let g:phpcs_vim = 1

" let g:phpcs_using_cache = 0
" let g:phpcs_rules=@PSR2
" let g:phpcs_path = '/home/work/bin/php-cs-fixer'
" let g:phpcs_php_path = 'php'

let g:phpcs_php_path = get(g:, 'phpcs_php_path', 'php')
let g:phpcs_path = get(g:, 'phpcs_path')
let g:phpcs_using_cache = get(g:, 'phpcs_using_cache')
let g:phpcs_rules = get(g:, 'phpcs_rules')
let g:phpcs_command = g:phpcs_php_path . ' ' . g:phpcs_path . ' fix -q'

func! PhpcsFix(path)
    let command = g:phpcs_command
    let command = command . ' ' . a:path
    let command = PhpCsUsingCache(command)
    let command = PhpCsAddRules(command)

    let s:output = system(command)
    if v:shell_error
        echohl Error | echo s:output | echohl None | echo command
    else
        exec 'edit!'
        :set syntax=php
    endif
endfunc

" using-cache
func! PhpCsUsingCache(command)
    if g:phpcs_using_cache
        let command = a:command . ' --using-cache=yes'
    else
        let command = a:command . ' --using-cache=no'
    endif

    return command
endfunc

" add php cs rules
func! PhpCsAddRules(command)
    let command = a:command
    if g:phpcs_rules
        let command = a:command . ' --rules=' . g:phpcs_rules
    endif

    return command
endfunc

func! PhpcsFixFile()
    call PhpcsFix(expand('%:p'))
endfunc

" Auto command
:autocmd BufWritePost *.php :call PhpcsFixFile()
