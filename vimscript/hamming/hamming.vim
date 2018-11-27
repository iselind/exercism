"
" This function takes two strings which represent strands and returns
" their Hamming distance.
"
" If the lengths of the strands don't match, throw this exception:
"
"     'The two strands must have the same length.'
"
function! Hamming(strand1, strand2)

  :echom "Length is" strlen(a:strand1)
  :echom "Length is" strlen(a:strand2)

  " We start by assuming strand1 and strand2 are equal in length

  :let c = 0
  :let distance = 0

  :while c <= strlen(a:strand1)
  : if a:strand1[c] != a:strand2[c]
  :  let distance += 1
  : endif
  : let c += 1
  :endwhile

  return distance
endfunction
