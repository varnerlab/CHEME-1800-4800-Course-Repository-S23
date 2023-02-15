# setup paths -
const _ROOT = pwd();
const _PATH_TO_DATA = joinpath(_ROOT,"data")
const _PATH_TO_SRC = joinpath(_ROOT, "src");

# load external package -
using CSV
using DataFrames

# load my codes -
include(joinpath(_PATH_TO_SRC,"Parser.jl"))