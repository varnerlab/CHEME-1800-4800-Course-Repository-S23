"""
    bubble_sort(arr::Array{Int64, 1}) -> Array{Int64,1}

Sorts an array of integers into ascending order.

See: https://en.wikipedia.org/wiki/Bubble_sort
"""
function bubble_sort(arr::Array{Int64, 1})::Array{Int64,1}
    
    # initialize -
    N = length(arr)

    # main -
    for i ∈ 1:N
        for j ∈ 1:N-i
            if arr[j] > arr[j+1]
                
                # swap that values at j and j+1
                tmp = arr[j]
                arr[j] = a[j+1]
                arr[j+1] = tmp

                # fancy impl (but hard to understand)
                # arr[j], arr[j+1] = arr[j+1], arr[j] # check: what is this line doing?
            end
        end
    end

    # return sorted array -
    return arr
end


"""
    bubble_sort(arr::Array{Int64, 1}) -> Array{Int64,1}

Sorts an array of Float64 values into ascending order.

See: https://en.wikipedia.org/wiki/Bubble_sort
"""
function bubble_sort(arr::Array{Float64, 1})::Array{Float64,1}
    
    # initialize -
    N = length(arr)

    # main -
    for i ∈ 1:N
        for j ∈ 1:N-i
            if arr[j] > arr[j+1]
                
                # swap that values at j and j+1
                tmp = arr[j]
                arr[j] = arr[j+1]
                arr[j+1] = tmp

                # fancy impl (but harder to understand)
                # arr[j], arr[j+1] = arr[j+1], arr[j] # check: what is this line doing?
            end
        end
    end

    # return sorted array -
    return arr
end
