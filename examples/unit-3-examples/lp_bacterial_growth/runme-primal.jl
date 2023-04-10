# include -
include("Include.jl")

# setup constants -
number_of_genes = 2;
Y = [2.5, 0.5];
β = [1.0, 1.0]
R = 1.0;

# build a model -
model = model = Model(GLPK.Optimizer)

# add decision variables to the model -
@variable(model, 0.0 <= x[i=1:number_of_genes] <= 1.0) # this sets up 5 variables

# Set the objective => maximize the profit -
@objective(model, Max, transpose(Y)*x);

# Setup the constraints - add them to the model 
@constraints(model, 
    begin
        transpose(β)*x <= R
    end
);

# solve the model
optimize!(model)
solution_summary(model)

# show the solution
for i in 1:number_of_genes
    println("x$i = ",value(x[i]))
end

# print objective value -
println("Objective value for the primal is: ", objective_value(model))