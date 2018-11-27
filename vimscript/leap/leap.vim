"
" This function takes a year and returns 1 if it's a leap year
" and 0 otherwise.
"
function! IsLeap(number) abort

    :if a:number % 400 == 0
        return 1
    :endif

    :if (a:number % 100) != 0 && (a:number % 4) == 0
        return 1
    :endif

endfunction
