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
    let DNA_CHARS = "GCTA"
    let RNA_CHARS = "CGAU"

    if a:strand =~ "\[^GCTA\]"
        return ""
    endif

    return tr(a:strand, DNA_CHARS, RNA_CHARS)
endfunction
