"""
    quicksort(arr::Array{T,1}) -> Array{T,1} where T <: Number
"""
function quicksort(arr::Array{T,1})::Array{T,1} where T <: Number
    
    # initialize -
    smaller_array = Array{T,1}()
    larger_array = Array{T,1}()

    # Base case: if we only have element, return the array
    if length(arr) <= 1
        return arr
    else
        
        # Recursive case: we have more than one element in the array 
        # 1. grab the *last* element - we call this the pivot element
        # 2. partition arr into elements that are smaller and larger than the pivot element

        # grab the *last* element of the array - this is the pivot element
        pivot = arr[end]

        # populate the smaller array -
        for x ∈ arr[1:end-1]
            
            # if this value of x is *smaller or equal to* the pivot element, it goes in the smaller array
            # otherwise, x goes in the larger array
            if (x <= pivot)
                push!(smaller_array, x);
            else
                push!(larger_array, x);
            end
        end

        # show the user what is going on ...
        # println("small: $(smaller_array) pivot: $(pivot) large: $(larger_array)")

        # return: this line creates (and returns) an array with the smaller part, the pivot and the larger part
        return [quicksort(smaller_array); pivot; quicksort(larger_array)]
    end
end
