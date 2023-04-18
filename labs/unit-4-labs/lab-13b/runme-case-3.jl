# include the include -
include("Include.jl")

# build my problem object -
problem = build(MySimpleCobbDouglasChoiceProblem, (
    
    initial = 0.1*ones(2), # initial guess
    α = [0.5, 0.5], # coefficients
    c = [20.0, 40.0], # price of x1 and x2
    I = 100.0, # income
    
    # how much of x₁ and x₂ can be we buy?
    bounds = [
        0.0 100.0; # L U`
        0.0 100.0; # L U
    ]
));

# solve problem -
results = solve(problem)

