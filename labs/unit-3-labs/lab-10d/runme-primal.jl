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

    # stream 1: input
    0.0 100.0 ; # 1 ṅ_A1_1 mol/s A1 in stream 1
    0.0 100.0 ; # 2 ṅ_A2_1 mol/s A2 in stream 1
    0.0 100.0 ; # 3 ṅ_B_1 mol/s B in stream 1
    0.0 100.0 ; # 4 ṅ_C_1 mol/s C in stream 1
    0.0 0.0 ; # 5 ṅ_P_1 mol/s P in stream 1 (we have no product in the input)
    0.0 100.0 ; # 6 ṅ_x_1 mol/s x in stream 1
    0.0 100.0 ; # 7 ṅ_y_1 mol/s y in stream 1

    # stream 2: output
    0.0 100.0 ; # 8 ṅ_A1_2 mol/s A1 in stream 2
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

# BELOW HERE: We are writing out the state and reaction tables ---
# build state table -
state_table_header = ["Species","ṅ₁ (mol/time)", "ṅ₂ (mol/time)", "Δ (mol/time)"]
state_table = Array{Any,2}(undef, number_of_species, (number_of_input_streams + number_of_output_streams)+2)
species_list = reaction_model.species
for i ∈ 1:number_of_species

    # setup index -
    j = i; # index for input stream 1
    k = i + number_of_species
    
    in_val = value(x[j])
    out_val = value(x[k])
    Δ = out_val - in_val

    state_table[i,1] = species_list[i];
    state_table[i,2] = in_val
    state_table[i,3] = out_val
    state_table[i,4] = Δ
end
pretty_table(state_table; header=state_table_header)

# print out the reaction table -
reaction_table_header = ["Reaction","ϵ̇ᵢ (mol/time)"]
reaction_table = Array{Any,2}(undef, number_of_reactions, 2)
reaction_list = reaction_model.reactions
for i ∈ 1:number_of_reactions
    
    # index -
    j = (number_of_input_streams+number_of_output_streams)*number_of_species + i

    reaction_table[i,1] = reaction_list[i];
    reaction_table[i,2] = value(x[j]);
end
pretty_table(reaction_table; header=reaction_table_header)
# =================================================================================================================== #