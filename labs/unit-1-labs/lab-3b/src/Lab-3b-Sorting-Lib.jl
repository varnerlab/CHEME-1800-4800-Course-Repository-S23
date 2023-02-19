"""
    bubble_sort(arr::Array{Int64, 1}) -> Array{Int64,1}

Sorts an array of integers into ascending order.

See: https://en.wikipedia.org/wiki/Bubble_sort
"""
function bubble_sort(arr::Array{Int64,1})::Array{Int64,1}

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
function bubble_sort(arr::Array{Float64,1})::Array{Float64,1}

    # initialize -
    N = length(arr)

    # main -
    for i ∈ 1:N
        for j ∈ 1:N-i
            if arr[j] > arr[j+1]

                #println("(i,j) = ($(i),$(j)) before $(arr)")

                # swap that values at j and j+1
                tmp = arr[j]
                arr[j] = arr[j+1]
                arr[j+1] = tmp

                #println("(i,j) = ($(i),$(j)) after $(arr)")

                # fancy impl (but harder to understand)
                # arr[j], arr[j+1] = arr[j+1], arr[j] # check: what is this line doing?
            end
        end
    end

    # return sorted array -
    return arr
end

"""
    insertion_sort(arr::Array{Int64, 1})

Sorts an array of Float64 values into ascending order.

See: https://en.wikipedia.org/wiki/Insertion_sort
"""
function insertion_sort(arr::Array{Float64,1})::Array{Float64,1}
    
    # initialize -
    N = length(arr)

    # main -
    for i ∈ 2:N

        # grab the key element -
        key = arr[i]

        # inner while loop
        j = i - 1 # set inner index j -
        while j >= 1 && arr[j] > key
            
            # shift 1 postion to the right -
            arr[j+1] = arr[j]

            # decrement inner index 
            j = j - 1
        end

        # set the key
        arr[j+1] = key
    end

    # return sorted array -
    return arr
end
