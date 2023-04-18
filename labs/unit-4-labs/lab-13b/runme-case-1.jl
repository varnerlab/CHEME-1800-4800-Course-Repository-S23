# include the include -
include("Include.jl")

# set problem constants -
α₁ = 0.50
α₂ = 1.0 - 0.50

# Budget -
I = 100.0
c₁ = 20.0;
c₂ = 40.0;

# Setup the problem -
model = Model(()->MadNLP.Optimizer(print_level=MadNLP.INFO, max_iter=100))
@variable(model, x>=0.0, start = 0.1)
@variable(model, y>=0.0, start = 0.1)
@NLobjective(model, Max, (x^α₁)*(y^α₂));
@constraints(model, 
    begin
        
        # my budget constraint
        c₁*x + c₂*y <= I
    end
);

optimize!(model)
