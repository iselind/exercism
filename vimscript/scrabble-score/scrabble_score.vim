"
" Given a word, return the scrabble score for that word.
"
"    Letter                           Value
"    A, E, I, O, U, L, N, R, S, T     1
"    D, G                             2
"    B, C, M, P                       3
"    F, H, V, W, Y                    4
"    K                                5
"    J, X                             8
"    Q, Z                             10
"

" Translate a character to the corresponding scrabble score
function! CharScore(idx, character) abort
    if a:character =~ "[AEIOULNRST]"
      return 1
    endif

    if a:character =~ "[DG]"
      return 2
    endif

    if a:character =~ "[BCMP]"
      return 3
    endif

    if a:character =~ "[FHVWY]"
      return 4
    endif

    if a:character == "K"
      return 5
    endif

    if a:character =~ "[JX]"
      return 8
    endif

    if a:character =~ "[QZ]"
      return 10
    endif

    return 0
endfunction

" There is no function in Vim for reducing a list of integers to the sum of
" these, so we write one.
function! Sum(lst) abort
    " This implementation could have been written using reduce, if Vim would
    " have had such a function. I could implement reduce but that would only
    " add to the solution's complexity.
    let sum = 0
    for value in a:lst
        let sum = sum + value
    endfor
    return sum
endfunction

function! Score(word) abort
    let charlist = split(a:word, '\zs') " Split the word into a list of characters
    call map(charlist, function("CharScore"))

    return Sum(charlist)
endfunction
