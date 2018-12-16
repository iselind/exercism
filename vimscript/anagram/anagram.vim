"
" Given a word and a list of possible anagrams, select the correct sublist.
"
" Example:
"
"   :echo Anagram('foo', ['foo', 'bar', 'oof', 'Ofo'])
"   ['Ofo', 'oof']
"
function! Anagram(word, candidates) abort

    let result = []

    for candidate in a:candidates
        if a:word ==# candidate
            continue
        endif

        " These split functions are taken from the split() docs
        let wordLst = split(a:word, '\zs')
        let candidateLst = split(candidate, '\zs')

        if join(sort(wordLst), "") == join(sort(candidateLst), "")
            echo "Match!" candidate
            call add(result, candidate)
        endif
    endfor

    return result

endfunction
