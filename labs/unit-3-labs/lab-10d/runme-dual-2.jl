# include the include -
include("Include.jl")

# === STAGE 1: BUILD THE REACTOR MODEL =============================================================================== #
# data about the reactor -
number_of_species = 7;
number_of_reactions = 3;
number_of_input_streams = 1
number_of_output_streams = 1

# load the reaction file -
path_to_reaction_file = joinpath(_PATH_TO_DATA, "Network.net");
reactions = readreactionfile(path_to_reaction_file);

# from the reaction file, let's build the stoichiometric matrix 
reaction_model = build(MyStoichiometricNetworkModel,reactions);
number_of_species = length(reaction_model.species);
number_of_reactions = length(reaction_model.reactions);

# how many variables do we have?
number_of_variables = number_of_reactions
list_of_variables = ["ϵ̇_1", "ϵ̇_2", "ϵ̇_3"];
# =================================================================================================================== #

# === STAGE 2: SETUP THE LP ========================================================================================= #
# Build a system matrix -
S = reaction_model.S;

# setup bounds -
bounds_array = [

    # reaction extents
    0.0 100.0 ; # 15 ϵ̇_1 mol/s reaction 1
    0.0 100.0 ; # 16 ϵ̇_2 mol/s reaction 2
    0.0 100.0 ; # 17 ϵ̇_3 mol/s reaction 3
];

# setup objective - let's maximize product
c = zeros(number_of_variables);
c[2] = 1.0 # index of ė_2 (B -> P)

# setup rhs -
b = [
    # species -
    10.0 ; # 1 A1
    10.0 ; # 2 A2
    0.0 ; # 3 B
    0.0 ; # 4 C
    0.0 ; # 5 P
    0.0 ; # 6 x
    0.0 ; # 7 y
];
# =================================================================================================================== #

# === STAGE 3: SOLVE THE LP ========================================================================================= #
lp_model = model = Model(GLPK.Optimizer)

# add decision variables to the model, and set the upper and lower bounds
@variable(lp_model, y[i=1:number_of_species] >= 0.0)

# Set the objective => maximize the profit -
@objective(lp_model, Min, transpose(b)*y);

# Setup the capacity constraints - add them to the model 
@constraints(lp_model, 
    begin
        -1*transpose(S)*y .>= c
    end
);

# solve the model
optimize!(model)
solution_summary(model)
# =================================================================================================================== #