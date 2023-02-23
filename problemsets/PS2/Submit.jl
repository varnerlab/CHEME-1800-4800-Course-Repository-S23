# include the Include.jl -
include("Include.jl")

# Step 1: load the reaction file 
path_to_reactions_file = joinpath(_PATH_TO_DATA, "Compounds.data")

# Step 2: parse the list of chemical compounds records in Compounds.data
compounds = read_compounds_file(path_to_compounds_file);