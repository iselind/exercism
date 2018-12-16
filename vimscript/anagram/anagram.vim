"
" Given a word and a list of possible anagrams, select the correct sublist.
"
" Example:
"
"   :echo Anagram('foo', ['foo', 'bar', 'oof', 'Ofo'])
"   ['Ofo', 'oof']
"

" GarbleWord will sort the characters, as lower case characters, in word
function! GarbleWord(word)
    " The case of each character affects the sorting that will happen at the
    " end of this function, so make everything into lower case.
    let lowerWord = tolower(a:word)

    " The usage of the split function here, was taken from the split() docs.
    "
    " See `:he \\zs` for details about the pattern .
    let wordLst = split(lowerWord, '\zs')

    return join(sort(wordLst), "")
endfunction

function! Anagram(word, candidates) abort

    let result = []

    " ==# will match with case in mind
    " ==? will match withput case in mind
    for candidate in a:candidates
        if a:word ==? candidate
            continue
        endif

        if GarbleWord(a:word) ==? GarbleWord(candidate)
            call add(result, candidate)
        endif
    endfor

    return sort(result)

endfunction
