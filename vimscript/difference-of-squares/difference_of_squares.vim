"
" Find the difference between the square of the sum and the sum of the squares
" of the first N natural numbers.
"
" Examples:
"
"   :echo SquareOfSum(3)
"   36
"   :echo SumOfSquares(3)
"   14
"   :echo DifferenceOfSquares(3)
"   22
"
function! DifferenceOfSquares(number) abort
  " your implemention goes here
endfunction

function! SquareOfSum(number) abort
    echom "=====" a:number

    let tmp = 0
    let term = 1

    while term <= a:number
        echom tmp
        let tmp += term
        let term += 1
    endwhile

    let tmp = tmp * tmp

    echom tmp
    echom "====="

    return tmp
endfunction

function! SumOfSquares(number) abort
  " your implemention goes here
endfunction
