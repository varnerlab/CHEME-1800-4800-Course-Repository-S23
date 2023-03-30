# include the include -
include("Include.jl")

# === STAGE 1: BUILD THE REACTOR MODEL =============================================================================== #
# data about the reactor -
number_of_input_streams = 1;
number_of_output_streams = 1;

# load the reaction file -
path_to_reaction_file = joinpath(_PATH_TO_DATA, "Network.net");
reactions = readreactionfile(path_to_reaction_file);

# from the reaction file, let's build the stoichiometric matrix 
reaction_model = build(MyStoichiometricNetworkModel,reactions);
number_of_species = length(reaction_model.species);
number_of_reactions = length(reaction_model.reactions);
stream_model = build(MyStreamNetworkModel, (
    
    number_of_input_streams = number_of_input_streams,
    number_of_output_streams = number_of_output_streams,
    number_of_species = number_of_species
));

# how many variables do we have?
number_of_variables = (number_of_input_streams + number_of_output_streams)*number_of_species + number_of_reactions
list_of_variables = [
    "ṅ_A1_1", "ṅ_A2_1", "ṅ_B_1", "ṅ_C_1", "ṅ_P_1", "ṅ_x_1", "ṅ_y_1", 
    "ṅ_A1_2", "ṅ_A2_2", "ṅ_B_2", "ṅ_C_2", "ṅ_P_2", "ṅ_x_2", "ṅ_y_2",
    "ϵ̇_1", "ϵ̇_2", "ϵ̇_3"];
# =================================================================================================================== #

# === STAGE 2: SETUP THE LP ========================================================================================= #
# Build a system matrix -
S = reaction_model.S;
T = stream_model.T;
A = hcat(T,S); 

# setup bounds -
bounds_array = [

    # stream 1
    10.0 10.0 ; # 1 ṅ_A1_1 mol/s A1 in stream 1
    0.0 100.0 ; # 2 ṅ_A2_1 mol/s A2 in stream 1
    0.0 100.0 ; # 3 ṅ_B_1 mol/s B in stream 1
    0.0 100.0 ; # 4 ṅ_C_1 mol/s C in stream 1
    0.0 100.0 ; # 5 ṅ_P_1 mol/s P in stream 1
    0.0 100.0 ; # 6 ṅ_x_1 mol/s x in stream 1
    0.0 100.0 ; # 7 ṅ_y_1 mol/s y in stream 1

    # stream 2
    1.0 1.0 ; # 8 ṅ_A1_2 mol/s A1 in stream 2
    0.0 100.0 ; # 9 ṅ_A2_2 mol/s A2 in stream 2
    0.0 100.0 ; # 10 ṅ_B_2 mol/s B in stream 2
    0.0 100.0 ; # 11 ṅ_C_2 mol/s C in stream 2
    0.0 100.0 ; # 12 ṅ_P_2 mol/s P in stream 2
    0.0 100.0 ; # 13 ṅ_x_2 mol/s x in stream 2
    0.0 100.0 ; # 14 ṅ_y_2 mol/s y in stream 2

    # reaction extents
    0.0 100.0 ; # 15 ϵ̇_1 mol/s reaction 1
    0.0 100.0 ; # 16 ϵ̇_2 mol/s reaction 2
    0.0 100.0 ; # 17 ϵ̇_3 mol/s reaction 3
];

# setup objective - let's maximize product
c = zeros(number_of_variables);
c[16] = 1.0 # index of ė_2 (B -> P)

# setup rhs -
# mol balances must balance, so b = 0
b = zeros(number_of_species);
# =================================================================================================================== #

# === STAGE 3: SOLVE THE LP ========================================================================================= #
lp_model = model = Model(GLPK.Optimizer)

# add decision variables to the model, and set the upper and lower bounds
@variable(lp_model, bounds_array[i,1] <= x[i=1:number_of_variables] <= bounds_array[i,2])

# Set the objective => maximize the profit -
@objective(lp_model, Max, transpose(c)*x);

# Setup the capacity constraints - add them to the model 
@constraints(lp_model, 
    begin
        A*x .== b
    end
);

# solve the model
optimize!(model)
solution_summary(model)

# show the solution
for i in 1:number_of_variables
    println("variable ", list_of_variables[i]," = ",value(x[i]), " mol per time.")
end

# print objective value -
println("Objective value for the primal is: ", objective_value(model))
# =================================================================================================================== #