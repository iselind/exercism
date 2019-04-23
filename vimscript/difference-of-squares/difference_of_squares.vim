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

function! Sum(numbers, sumFunc) abort
    let runningSum = 0

    for element in a:numbers
        let runningSum += a:sumFunc(element)
    endfor

    return runningSum
endfunction

function! SquareOfSum(number) abort
    let sum = Sum(range(1,a:number), {a->a})
    return sum * sum
endfunction

function! SumOfSquares(number) abort
    return Sum(range(1,a:number), {a->a*a})
endfunction
