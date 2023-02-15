# include -
include("Include.jl")

# setup file path -
path_to_data_file = joinpath(_PATH_TO_DATA, "Quicksort.csv")

# load CSV file using built-in CSV package -
df = loadcsvfile(path_to_data_file);

# load CSV file using our own parser -
(h,d) = readfile(path_to_data_file, delim = ',')