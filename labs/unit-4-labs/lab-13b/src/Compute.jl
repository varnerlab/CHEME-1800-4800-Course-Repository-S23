function budget(problem::MySimpleCobbDouglasChoiceProblem, xlim::Array{Float64,1})::Array{Float64,2}

    # initialize -
    α₁ = 0.5 
    α₂ = 1.0 - α₁
    c = problem.c;
    I = problem.I;

    # set values for the good and service 1
    X1 = range(xlim[1], stop=xlim[2], step = 0.001) |> collect;
    d = length(X1);

    Y = Array{Float64,2}(undef,d,2);
    for j ∈ 1:d

        tmp = (1/c[2])*(I - c[1]*X1[j]);

        Y[j,1] = X1[j];
        Y[j,2] = tmp
    end

    # return -
    return Y;
end

function indifference(problem::MySimpleCobbDouglasChoiceProblem, U::Float64, xlim::Array{Float64,1})::Array{Float64,2}

    # initialize -
    α₁ = 0.5 
    α₂ = 1.0 - α₁

    # set values for the good and service 1
    X1 = range(xlim[1], stop=xlim[2], step = 0.001) |> collect;
    d = length(X1);

    Y = Array{Float64,2}(undef,d,2);
    for j ∈ 1:d

        tmp = (1/α₂)*(log(U) - α₁*log(X1[j]));

        Y[j,1] = X1[j];
        Y[j,2] = exp(tmp);
    end

    # return -
    return Y;
end


"""
    solve(problem::MySimpleCobbDouglasChoiceProblem) -> Dict{String,Any}

Solves the optimal decision problem with a budget constraint with a Cobb-Douglas utility function
"""
function solve(problem::MySimpleCobbDouglasChoiceProblem)::Dict{String,Any}

    # initialize -
    results = Dict{String,Any}()
    α = problem.α;
    c = problem.c;
    bounds = problem.bounds;
    I = problem.I;
    xₒ = problem.initial

    # how many variables do we have?
    d = length(α);

    # Setup the problem -
    model = Model(()->MadNLP.Optimizer(print_level=MadNLP.INFO, max_iter=100))
    @variable(model, bounds[i,1] <= x[i=1:d] <= bounds[i,2], start=xₒ[i]) # we have d variables
    
    # set objective function -   
    @NLobjective(model, Max, (x[1]^α[1])*(x[2]^α[2]));
    @constraints(model, 
        begin
            # my budget constraint
            transpose(c)*x <= I
        end
    );

    # run the optimization -
    optimize!(model)

    # populate -
    x_opt = value.(x);
    results["argmax"] = x_opt
    results["budget"] = transpose(c)*x_opt; 
    results["objective_value"] = objective_value(model);

    # return -
    return results
end