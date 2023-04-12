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
    11.0 ; # 1 A1
    11.0 ; # 2 A2
    2.0 ; # 3 B
    0.0 ; # 4 C
    0.0 ; # 5 P
    1.0 ; # 6 x
    0.0 ; # 7 y
];
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
        -1*(S*x) .<= b
    end
);

# solve the model
optimize!(model)
solution_summary(model)

# BELOW HERE: We are writing out the state and reaction tables ---
# build state table -
ṅ₁ = b;
ϵ̇ = value.(x)
ṅ₂ = ṅ₁ + S*ϵ̇;
state_table_header = ["Species","ṅ₁ (mol/time)", "ṅ₂ (mol/time)", "Δ (mol/time)"]
state_table = Array{Any,2}(undef, number_of_species, (number_of_input_streams + number_of_output_streams)+2)
species_list = reaction_model.species
for i ∈ 1:number_of_species

    # setup index -
    j = i; # index for input stream 1
    k = i + number_of_species
    
    in_val = ṅ₁[i]
    out_val = ṅ₂[i]
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
    reaction_table[i,1] = reaction_list[i];
    reaction_table[i,2] = value(x[i]);
end
pretty_table(reaction_table; header=reaction_table_header)
# =================================================================================================================== #