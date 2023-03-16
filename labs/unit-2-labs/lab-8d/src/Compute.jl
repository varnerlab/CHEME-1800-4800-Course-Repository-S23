"""
    multiplication(v::Array{Float64,1}, c::Float64) -> Array{Float64,1}

Multiplies the elements of the vector `vector` by the constant `c`
"""
function multiply(vector::Array{Float64,1}, c::Float64)::Array{Float64,1}

    # initialize -
    product_array = Array{Float64,1}()

    # main loop -
    for vᵢ ∈ vector
        push!(product_array, vᵢ*c);
    end

    # return -
    return product_array;
end


"""
    multiplication(A::Array{Float64,2}, c::Float64) -> Array{Float64,2}

Multiplies the elements of the array `array` by the scalar constant `c`
"""
function multiply(array::Array{Float64,2}, c::Float64)::Array{Float64,2}
   
    # initialize -
    (number_of_rows, number_of_cols) = size(array);
    product_array = Array{Float64,2}(undef, number_of_rows, number_of_cols);

    # main loop -
    for i ∈ 1:number_of_rows
        for j ∈ 1:number_of_cols
            product_array[i,j] = c*array[i,j]     
        end
    end

    # return -
    return product_array
end

"""
    multiplication(matrix::Array{Float64,2}, vector::Array{Float64,1}; right::Bool = true) -> Array{Float64,1}

Computes the right or left matrix vector product. If the optional `right::Bool` is true (default), the right
product is calculated. Otherwise the left product is calculated. 

See: https://varnerlab.github.io/CHEME-1800-Computing-Book/unit-2-data/vectors-matricies-nla.html#defn-right-matrix-vector-multiplication
"""
function multiply(matrix::Array{Float64,2}, vector::Array{Float64,1}; right::Bool = true)::Array{Float64,1}

    # check: compatible?

    # initialize
    (m,n) = size(matrix);
    y = nothing;

    if (right == true)  # compute the right product
        
        # See Algorithm 5: https://varnerlab.github.io/CHEME-1800-Computing-Book/unit-2-data/vectors-matricies-nla.html#algo-right-multiplication-matrix-vector
        # initialize
        y = zeros(m);
        for i ∈ 1:m
            for j ∈ 1:n
                y[i] = y[i] + matrix[i,j]*vector[j]
            end
        end
    else  # compute the left product

        # See Algorithm 6: https://varnerlab.github.io/CHEME-1800-Computing-Book/unit-2-data/vectors-matricies-nla.html#algo-left-multiplication-matrix-vector

        # initialize
        (m,n) = size(A);
        y = zeros(m);
        for i ∈ 1:n
            for j ∈ 1:m
                y[i] = y[i] + matrix[j,i]*vector[j]
            end
        end
    end

    # return the product vector
    return y
end

"""
    multiplication(A::Array{Float64,2}, B::Array{Float64,2}) -> Array{Float64,2}

Multiplies the matrix `A` by the matrix `B` returns C = AB.
"""
function multiply(A::Array{Float64,2}, B::Array{Float64,2})::Array{Float64,2}

    # check: are A and B compatible?
    # in production we'd check: here, we assume ok

    # initialize -
    (RA,CA) = size(A);
    (RB,CB) = size(B);
    C = Array{Float64,2}(undef, RA, CB)
    tmp = Dict{Int64,Array{Float64,1}}()

    # look at the M x M figure and try to develop a code
    # do the math
    for i ∈ 1:CB
        tmp[i] = multiply(A,B[:,i]);
    end

    # assemble
    for i ∈ 1:CB
        col = tmp[i];
        for j ∈ 1:RA
            C[j,i] = col[j]
        end
    end

    # return the product
    return C
end

"""
    binary(matrix::Array{Float64,2}) -> Array{Float64,2}

Converts an floating point array to its binary form (all non-zero values -> 1.0)
"""
function binary(matrix::Array{Float64,2})::Array{Float64,2}

    # initialize -
	(ℳ,ℛ) = size(matrix)
	B = Array{Int64,2}(undef,ℳ,ℛ)
    fill!(B, 0.0) # fill with default value of 0.0

    # main loop 
	for row_index ∈ 1:ℳ
		for col_index ∈ 1:ℛ
			if (matrix[row_index,col_index] != 0.0)
				B[row_index,col_index] = 1
			end
		end
	end
	
	# return -
	return B
end

"""
    ⊗(a::Array{Float64,1},b::Array{Float64,1}) -> Array{Float64,2}

Outer product between vectors `a` and `b`. 
See: https://varnerlab.github.io/CHEME-1800-Computing-Book/unit-2-data/vectors-matricies-nla.html#defn-vector-vector-multiplication-op
"""
function ⊗(a::Array{Float64,1}, b::Array{Float64,1})::Array{Float64,2}

    # initialize -
    m = length(a)  # length the input vector a
    n = length(b)  # length of input vector b
    Y = zeros(m,n) # holds the Outer product between a and b

    # main loop -
    # Look at: https://varnerlab.github.io/CHEME-1800-Computing-Book/unit-2-data/vectors-matricies-nla.html#defn-vector-vector-multiplication-op
    # implement here ...
    for i ∈ 1:m
        for j ∈ 1:n
            Y[i,j] = a[i]*b[j]
        end
    end

    # return 
    return Y
end