# include the Include.jl -
include("Include.jl")

# Step 1: load the reaction file 
path_to_reactions_file = joinpath(_PATH_TO_DATA, "Reactions.net")

# Step 2: parse the list of chemical reaction strings -
reactions = read_reaction_file(path_to_reactions_file);

# Step 3: Cut the reaction and product strings around the +'s (using recursive descent parser)
# ...