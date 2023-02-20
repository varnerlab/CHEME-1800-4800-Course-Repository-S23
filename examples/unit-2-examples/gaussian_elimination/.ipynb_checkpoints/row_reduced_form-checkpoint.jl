using LinearAlgebra

function rref!(A::Matrix{T}, ɛ=T <: Union{Rational,Integer} ? 0 : eps(norm(A,Inf))) where T
    nr, nc = size(A)
    i = j = 1
    while i <= nr && j <= nc
        (m, mi) = findmax(abs.(A[i:nr,j]))
        mi = mi+i - 1
        if m <= ɛ
            if ɛ > 0
                A[i:nr,j] .= zero(T)
            end
            j += 1
        else
            for k=j:nc
                A[i, k], A[mi, k] = A[mi, k], A[i, k]
            end
            d = A[i,j]
            for k = j:nc
                A[i,k] /= d
            end
            for k = 1:nr
                if k != i
                    d = A[k,j]
                    for l = j:nc
                        A[k,l] -= d*A[i,l]
                    end
                end
            end
            i += 1
            j += 1
        end
    end
    A
end

# ChatGPT generated this function. Crazy interesting 
function row_echelon_form(A::Matrix)
    
    # Get the number of rows and columns in A
    m, n = size(A)

    # Initialize the pivot row and pivot column
    pivot_row = 1
    pivot_col = 1

    # Initialize the list of pivot columns
    pivots = Int64[]

    # Loop over the rows and columns of A
    for i in 1:m, j in 1:n
        
        # Find the first non-zero element in the pivot column
        pivot = findfirst(x->x!=0, A[i:end, j])

        # If a non-zero element was found
        if pivot !== nothing
            
            # Swap the pivot row with the current row
            A[pivot_row], A[pivot_row + pivot - 1] = A[pivot_row + pivot - 1], A[pivot_row]

            # Normalize the pivot row
            pivot_val = A[pivot_row, j]
            A[pivot_row, :] /= pivot_val

            # Zero out the other rows in the pivot column
            for k in 1:m
                if k != pivot_row
                    row_mult = A[k, j]
                    A[k, :] -= row_mult * A[pivot_row, :]
                end
            end

            # Increment the pivot row and column
            pivot_row += 1
            pivot_col += 1

            # Add the pivot column to the list of pivots
            push!(pivots, j)
        end

        # If we have reached the last row or column, break out of the loop
        if pivot_row > m || pivot_col > n
            break
        end
    end

    # Return the row echelon form and the list of pivot columns
    return A
end


# ChatGPT generated this function. Crazy interesting
function upper_triangular(A::Matrix)
    n, m = size(A)
    for k = 1:min(n,m)
        for i = k+1:n
            l = A[i,k] / A[k,k]
            for j = k:m
                A[i,j] = A[i,j] - l*A[k,j]
            end
        end
    end
    return A
end

# compute U -
# A = [2.0 -1.0 0.0 0.0; -1.0 2.0 -1.0 1.0; 0.0 -1.0 2.0 0.0];
# UAUG = upper_triangular(A)