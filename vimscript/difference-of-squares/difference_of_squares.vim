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
    return SquareOfSum(a:number) - SumOfSquares(a:number)
endfunction

function! SquareOfSum(number) abort
    let runningSum = 0
    let term = 1

    while term <= a:number
        let runningSum += term
        let term += 1
    endwhile

    let runningSum = runningSum * runningSum

    return runningSum
endfunction

function! SumOfSquares(number) abort
    let runningSum = 0
    let term = 1

    while term <= a:number
        let squaredTerm = term * term

        let runningSum += squaredTerm

        let term += 1
    endwhile

    return runningSum
endfunction
