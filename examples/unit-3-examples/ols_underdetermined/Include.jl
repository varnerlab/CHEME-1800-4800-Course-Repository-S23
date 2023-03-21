# setup paths
const _ROOT = pwd();
const _PATH_TO_DATA = joinpath(_ROOT, "data")
const _PATH_TO_SRC = joinpath(_ROOT, "src")

# use packages -
using DelimitedFiles
using Plots
using Colors

# load my codes -
include(joinpath(_PATH_TO_SRC, "Files.jl"))
include(joinpath(_PATH_TO_SRC, "Compute.jl"))
