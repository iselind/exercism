"
" This function takes a DNA strand and returns its RNA complement.
"
"   G -> C
"   C -> G
"   T -> A
"   A -> U
"
" If the input is invalid, return an empty string.
"
" Example:
"
"   :echo ToRna('ACGTGGTCTTAA')
"   UGCACCAGAAUU
"
function! ToRna(strand) abort
    if len(a:strand) == 0
        return ""
    endif

    if a:strand == 'G'
        return "C"
    elseif a:strand == 'C'
        return "G"
    elseif a:strand == 'T'
        return "A"
    elseif a:strand == 'A'
        return "U"
    else
        return ""
    endif
endfunction
