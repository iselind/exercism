"
" This function takes two strings which represent strands and returns
" their Hamming distance.
"
" If the lengths of the strands don't match, throw this exception:
"
"     'The two strands must have the same length.'
"
function! Hamming(strand1, strand2) abort
  if strlen(a:strand1) != strlen(a:strand2)
   throw "The two strands must have the same length."
  endif

  " From here it's safe to assume that strand1 and strand2 
  " are equal in length

  let distance = 0

  for c in range(0, len(a:strand1))
   if a:strand1[c] != a:strand2[c]
    let distance += 1
   endif
  endfor

  return distance
endfunction
