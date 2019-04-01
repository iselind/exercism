"
" Given a phrase, return a dictionary containing the count of occurrences of
" each word.
"
" Example:
"
"   :echo WordCount('olly olly in come free')
"   {'olly': 2, 'come': 1, 'in': 1, 'free': 1}
"

function! CleanWord(word) abort
    let word = tolower(a:word)
    let word = substitute(word, '[!&:.@$%^]', '', 'g')

    let lastIndex = strlen(word)-1
    if word[0] == "'" && word[lastIndex] == "'"
        echo word
        let word = word[:lastIndex-1]
        let word = word[1:]
    endif

    return word
endfunction

function! WordCount(phrase) abort
    let result = {}

    for word in split(a:phrase, "[ ,\n]\\+")
        let word = CleanWord(word)
        let result[word] = 1 + get(result, word, 0)
    endfor

    return result
endfunction
