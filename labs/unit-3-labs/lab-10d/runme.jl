# include the include -
include("Include.jl")

# load the reaction file -
path_to_reaction_file = joinpath(_PATH_TO_DATA, "Network.net");
reactions = readreactionfile(path_to_reaction_file);

# from the reaction file, let's build the stoichiometric matrix 
model = build(MyStoichiometricNetworkModel,reactions);

