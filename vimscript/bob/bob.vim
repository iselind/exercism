"
" This function takes any drivel and returns Bob's response.
"
function! Answer(drivel) abort

  let length = len(a:drivel)

  if a:drivel[length -1] == "."
      return "Whatever."
  endif

  " ==# will match with case in mind
  " ==? will match withput case in mind
  if a:drivel ==# toupper(a:drivel) && a:drivel !=# tolower(a:drivel)
      return "Whoa, chill out!"
  endif

  if a:drivel[length -1] == "?"
      return "Sure."
  endif

  " Match both the empty string and strings only containing whitespace
  if a:drivel =~ "^\s*$"
      return "Fine. Be that way!"
  endif

  return "Whatever."
endfunction
