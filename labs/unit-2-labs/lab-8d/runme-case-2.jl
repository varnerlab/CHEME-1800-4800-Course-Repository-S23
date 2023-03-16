include("Include.jl")

# path -
path_to_test_file = joinpath(_PATH_TO_DATA, "RBC.net")

# load reaction dictionary -
reactions = readreactionfile(path_to_test_file)

# build model -
model = build(MyStoichiometricNetworkModel,reactions; expand = true)

# compute the binary S -
S = model.S;

# compute the SVD -
(U,Σ,V) = svd(S)

# Analysis
# TODO: implement a call to the important function for the first col of U (species) and V (reactions)
# ...