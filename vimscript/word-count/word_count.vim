"
" Given a phrase, return a dictionary containing the count of occurrences of
" each word.
"
" Example:
"
"   :echo WordCount('olly olly in come free')
"   {'olly': 2, 'come': 1, 'in': 1, 'free': 1}
"
function! WordCount(phrase) abort
    let result = {}

    for word in split(a:phrase, "[ ,\n]")
        if strlen(word) == 0
            continue
        endif

        let word = tolower(word)
        let word = substitute(word, '[!&:.@$%^]', '', 'g')

        if word[0] == "'"
            let word = word[1:]
        endif

        let lastIndex = strlen(word)-1
        if word[lastIndex] == "'"
            let word = word[:lastIndex-1]
        endif

        let result[word] = 1 + get(result, word, 0)
    endfor

    return result
endfunction
