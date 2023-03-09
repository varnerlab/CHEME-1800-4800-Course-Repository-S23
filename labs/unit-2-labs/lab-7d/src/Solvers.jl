
function _jacobi_iteration_solver(A::Array{Float64,2}, b::Array{Float64,1}, xₒ::Array{Float64,1},
    tolerance::Float64, maxiter::Int64)::Array{Float64,1}

    # initialize
    (number_of_cols) = size(A,1);
    x̂ = xₒ                      # set the current best answer to the initial guess that was passed
    ϵ = Inf;                    # initial error is Inf
 
    # main -
    for _ ∈ 1:maxiter
        
        # initialize tmp solution
        x′ = zeros(number_of_cols)
        for i ∈ 1:number_of_cols
            
            s = 0;
            for j ∈ 1:number_of_cols
                if (i != j)
                    s += A[i,j]*x̂[j]
                end
            end
            
            # calculate new x value
            x′[i] = (1/A[i,i])*(b[i] - s);
        end

        # update the flag -
        ϵ = norm(x′ - x̂)
        if (ϵ < tolerance)
            # the solution 
            return x′
        else
            x̂ = x′; # update the solution
        end
    end

    # return
    return x̂
end

function _gauss_seidel_iteration_solver(A::Array{Float64,2}, b::Array{Float64,1}, xₒ::Array{Float64,1},
    tolerance::Float64, maxiter::Int64)::Array{Float64,1}

    # initialize
    (number_of_rows, number_of_cols) = size(A);
    x̂ = xₒ # set the current best answer to the initial guess that was passed
    should_we_stop = false

    # return -
    return x̂;
end


function solve(type::T, A::Array{Float64,2}, b::Array{Float64,1}, xₒ::Array{Float64,1};
    tolerance::Float64 = 0.001, maxiter::Int64 = 10000)::Array{Float64,1} where T <: AbstractIterativeSolver
    
    if (isa(type, JacobiIterationSolver) == true)
        return _jacobi_iteration_solver(A, b, xₒ, tolerance, maxiter);
    elseif (isa(type, GaussSeidelIterationSolver) == true)
        return _gauss_seidel_iteration_solver(A, b, xₒ, tolerance, maxiter);
    else
        throw("Incorrect solver type has been requested!")
    end
end