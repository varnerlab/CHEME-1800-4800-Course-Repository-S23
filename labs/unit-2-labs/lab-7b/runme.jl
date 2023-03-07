include("Include.jl")

# path -
path_to_test_file = joinpath(_PATH_TO_DATA, "Test.net")

# load reaction dictionary -
reactions = readreactionfile(path_to_test_file)

# Step 1: Build an instance of MyStoichiometricNetworkModel
# ...

# Step 2: Compute the binary version of the stoichiometric array (S̄)
# ...

# Step 3: Compute the S̄*transpose(S̄)
# ...