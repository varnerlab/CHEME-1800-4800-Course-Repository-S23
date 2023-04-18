function solve(problem::MySimpleCobbDouglasChoiceProblem)

    # initialize -
    α = problem.α;
    c = problem.c;
    bounds = problem.bounds;
    I = problem.I;

    # how many variables do we have?
    d = length(α);

    # Setup the problem -
    model = Model(()->MadNLP.Optimizer(print_level=MadNLP.INFO, max_iter=100))
    @variable(model, bounds[i,1] <= x[i=1:d] <= bounds[i,2]) # we have d variables
    @NLobjective(model, Max, prod(x.^α));
    @constraints(model, 
        begin
            # my budget constraint
            transpose(c)*x <= I
        end
    );

    # run the optimization -
    optimize!(model)


    
end