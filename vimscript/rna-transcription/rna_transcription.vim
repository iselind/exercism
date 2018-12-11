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

function! Translate(strand) abort
    if a:strand == 'G'
        return "C"
    elseif a:strand == 'C'
        return "G"
    elseif a:strand == 'T'
        return "A"
    elseif a:strand == 'A'
        return "U"
    endif
    return ""
endfunction

function! ToRna(strand) abort
    if len(a:strand) == 0
        return ""
    endif

    let result = []

    " range will produce list from zero up until, and including, the length of
    " a:strand.
    "
    " An example is `range(0, len("abcde"))` would produce `[0,1,2,3,4,5]`
    " i.e. a string of five characters produce a range of six elements.
    " "abcd"[0] == 'a'
    " "abcd"[1] == 'b'
    " "abcd"[2] == 'c'
    " "abcd"[3] == 'd'
    " "abcd"[4] == 'e'
    " "abcd"[5] == ' ' (Index out of bounds!)
    "
    " As we use the list as indices we subract by one to not go
    " outside a:strand
    for c in range(0, len(a:strand)-1)
        let tmp = Translate(a:strand[c])
        if tmp == ""
            return ""
        endif
        call add(result, tmp)
    endfor

    return join(result, '')
endfunction
