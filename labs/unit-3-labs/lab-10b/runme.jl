# include -
include("Include.jl")

# == Stage 1: build the problem object ====================================================================== #
# build -
path_to_network_file = joinpath(_PATH_TO_DATA, "Network.net")
edges = read_network_file(path_to_network_file)

# build model
problem = build(MyBatchProductionSchedulingProblem, edges)

# setup the LP -
number_of_nodes = problem.number_of_nodes;
number_of_edges = problem.number_of_edges;
A = problem.A;                              # this has all the nodes (including s and t) -
c = problem.c;                              # vector  of coefficients for the objective function
bounds = problem.bounds;                    # capacity constraints on the edges
b = zeros(number_of_nodes);                 # Ax = b 

# remove the s and t -
Â = A[1:(number_of_nodes - 2),:];
b̂ = b[1:(number_of_nodes - 2)];

# maximize the sum of e7 + e8 
ĉ = zeros(number_of_edges)
ĉ[7] = 1.0
ĉ[8] = 1.0
# ========================================================================================================== #

# == Stage 2: build the LP model object ==================================================================== #
# build a model -
model = model = Model(GLPK.Optimizer)

# add decision variables to the model -
@variable(model, bounds[i,1] <= x[i=1:number_of_edges] <= bounds[i,2]) # this sets up the upper bound

# Set the objective => maximize the profit -
@objective(model, Max, transpose(ĉ)*x);

# Setup the capacity constraints - add them to the model 
@constraints(model, 
    begin
        Â*x .== 0
    end
);
# ========================================================================================================== #

# == Stage 3: solve the LP model object ==================================================================== #
# solve the model
optimize!(model)
solution_summary(model)

# show the solution
for i in 1:number_of_edges
    println("flow e$i = ",value(x[i]), " units.")
end

# print objective value -
println("Objective value for the primal is: ", objective_value(model))
# ========================================================================================================== #