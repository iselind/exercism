"
" Given a word and a list of possible anagrams, select the correct sublist.
"
" Example:
"
"   :echo Anagram('foo', ['foo', 'bar', 'oof', 'Ofo'])
"   ['Ofo', 'oof']
"

" ConvertToMatchable will convert word into something that is easy to compare.
" It converts word to lower case characters and sort the characters
function! ConvertToMatchable(word)
    " The case of each character affects the sorting that will happen at the
    " end of this function, so make everything into lower case.
    let lowerWord = tolower(a:word)

    " The usage of the split function here, was taken from the split() docs.
    "
    " See `:he \\zs` for details about the pattern .
    let charList = split(lowerWord, '\zs')

    return join(sort(charList), "")
endfunction

function! IsAnagram(word, candidate) abort
    " Given the argument `word` never change it seems wasteful to create
    " comparableWord each time IsAnagram is called. But I cannot see how to
    " make the test in the return statement below, unless I do it this way.
    let comparableWord = ConvertToMatchable(a:word)
    let comparableCandidate = ConvertToMatchable(a:candidate)

    " ==# will match with case in mind
    " ==? will match withput case in mind
    return (a:word !=? a:candidate) && (comparableWord ==? comparableCandidate)
endfunction

function! Anagram(word, candidates) abort
    " The second argument to `filter()` is a lambda function. The lambda
    " function takes two arguments, the key/index of the current item and the
    " value (w) itself.
    return sort(filter(a:candidates,
        \ { _, w -> IsAnagram(a:word, w) }))
endfunction
