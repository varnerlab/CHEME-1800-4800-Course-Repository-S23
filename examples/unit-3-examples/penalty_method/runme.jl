"""
    _loss(x::Float64; λ::Float64 = 1.0) -> Float64

Loss function for penalty method example. 
"""
function _loss(x::Float64; λ::Float64 = 1.0)::Float64

    # compute the f(x) and the penalty -
    f = 100.0/x;
    P = (max(0.0, x - 5.0))^2;

    # return -
    return f + λ*P;
end

"""
    main() -> Float64
Runs an evolutionary algorithm to estimate x̂ (min of loss function). 
"""
function main()::Float64

    # initialize -
    # Λ = [1e3,1e6,1e9];
    Λ = [0.01,1.0,68.0,613.0].*10000.0;
    xₒ = 20.0;
    best_loss = Inf;
    x̂ = xₒ;
    max_number_of_iterations = 1000;

    # use a simple evolutionary algorithm -
    for λ ∈ Λ

        x′ = x̂ # initialize the current x, with the best value we have so far

        # refine our best guess
        for i ∈ 1:max_number_of_iterations
            
            # compute the loss -
            l = _loss(x′, λ = λ);
            
            # is this loss *better* than our best solution so far?
            if (l < best_loss)
                x̂ = x′;
                best_loss = l;

                # we have a new soln, print it out!
                println("New soln found (λ,x̂,l) = ($(λ),$(x̂),$(l))");
            else
                if (mod1(max_number_of_iterations,i)==i)
                    println("Oooops. No improvement at iteration $(i) with λ = $(λ)")
                end
            end

            # generate a new guess for x -
            x′ = x̂ + 0.1*randn()
        end
    end

    # return -
    return x̂;
end

# call the main -
x = main();
