function heaps_algorithm_recursive(A::Array{Int64,1}, size::Int64, permutations::Set{Array{Int64,1}})

    # base case -
    if size == 1
        push!(permutations, copy(A))
    else
        
        # process all the entries 
        for i = 1:size

            # recursive -
            heaps_algorithm_recursive(A, size-1, permutations)

            # swap mechanics -
            if (iseven(size) == true)
                A[size], A[1] = A[1], A[size]
            else
                A[size], A[i] = A[i], A[size]
            end
        end
    end
end

# initialize some storage -
S = Set{Array{Int64,1}}();

# call -
V = [1,2,3,4];
heaps_algorithm_recursive(V, length(V),  S);

