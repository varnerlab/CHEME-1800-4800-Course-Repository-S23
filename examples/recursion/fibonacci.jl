"""
    fibonacci_recurisive(n::Int64) -> Int64

Computes the `fibonacci` number for n where n >= 1.

See: https://en.wikipedia.org/wiki/Fibonacci_number
"""
function fibonacci_recursive(n::Int64)::Int64

    if (n == 0)  # base case
        return 0;
    elseif (n == 1) # base case
        return 1; 
    else # recursive case
        return fibonacci_recursive(n-1) + fibonacci_recursive(n-2);
    end
end

"""
    fibonacci!(n::Int64, series::Dict{Int64,Int64}) -> Nothing

Recursively computes the `fibonacci` sequence for 0 to n where n >= 1.
Stores series in `series::Dict`.

See: https://en.wikipedia.org/wiki/Fibonacci_number
"""
function fibonacci!(n::Int64, series::Dict{Int64,Int64})

    if (n == 0)  # base case
        return 0;
    elseif (n == 1) # base case
        return 1; 
    else
        series[n] = fibonacci!(n-1, series) + fibonacci!(n-2, series);
    end
end

"""
    memoization_fibonacci!(n::Int64, series::Dict{Int64,Int64}) -> Nothing

Recursively computes the `fibonacci` sequence for 0 to n where n >= 1.
Stores series in `series::Dict`.

See: https://en.wikipedia.org/wiki/Fibonacci_number
"""
function memoization_fibonacci!(n::Int64, series::Dict{Int64,Int64})

    if (n == 0)  # base case
        series[n] = 0;
    elseif (n == 1) # base case
        series[n] = 1;
    elseif (haskey(series,n) == true) # memoization
        return series[n];
    else # recursive case
        series[n] = memoization_fibonacci!(n-1, series) + memoization_fibonacci!(n-2, series);
    end
end