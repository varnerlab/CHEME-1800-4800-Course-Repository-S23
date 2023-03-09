
function _jacobi_iteration_solver(A::Array{Float64,2}, b::Array{Float64,1}, xₒ::Array{Float64,1},
    tolerance::Float64, maxiter::Int64)::Array{Float64,1}

    # initialize
    (number_of_rows, number_of_cols) = size(A);
    x̂ = xₒ                      # set the current best answer to the initial guess that was passed
    ϵ = Inf;                    # initial error is Inf
    should_we_stop = false      # loop flag
    loop_counter = 1;

    # main -
    while (should_we_stop == false)
        
        # initialize tmp solution
        x′ = zeros(number_of_cols)
        for j ∈ 1:number_of_cols
            s = 0;
            for k ∈ 1:number_of_cols
                if (j != k)
                    s = s + A[j,k]*x̂[k]
                end
            end
            
            # calculate new x value
            x′[j] = (1/A[j,j])*(b[j] - s);
        end

        # update the flag -
        ϵ = norm(x′ - x̂)
        if (ϵ < tolerance || loop_counter > maxiter)
            # update our solution 
            x̂ = x′
            
            # we have hit our tolerance, or run out of iterations
            should_we_stop = true
        else
            x̂ = x′
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