"""
    backward_substitution(U::Array{Float64,2}, b::Array{Float64,1})::Array{Float64,1}

Takes an upper triangular matrix U and a right-hand-side vector b. Returns the solution
to Ux = b.
"""
function backward_substitution(U::Array{Float64,2}, b::Array{Float64,1})::Array{Float64,1}

    # check: dimensions ok?
    # ...

    # check: is U upper triangular?
    # ...

    # initialize -
    (m,n) = size(U)
    x = zeros(n); 
    x[n] = b[n]/U[n,n]; # populate the last solution
    irange = range(n-1,stop=1,step=-1) |> collect


    # main: populate n-1 -> 1
    for i ∈ irange
        
        # jrange -
        jrange = range(i+1,stop=n,step=1) |> collect
        sum_term = 0.0;
        for j ∈ jrange
            sum_term = sum_term + U[i,j]*x[j]
        end

        # update x -
        x[i] = (1/U[i,i])*(b[i] - sum_term)
    end

    # return -
    return x
end

# test code -

