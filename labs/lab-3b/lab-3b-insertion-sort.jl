# load external packages -
using BenchmarkTools

"""
    insertion_sort(arr::Array{Int64, 1})

Sorts an array of Float64 values into ascending order.

See: https://en.wikipedia.org/wiki/Insertion_sort
"""
function insertion_sort(arr::Array{Float64, 1})
    n = length(arr)
    for i in 2:n
        key = arr[i]
        j = i - 1
        while j >= 1 && arr[j] > key
            arr[j + 1] = arr[j]
            j -= 1
        end
        arr[j + 1] = key
    end
    return arr
end