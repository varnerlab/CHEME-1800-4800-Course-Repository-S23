# setup paths
const _ROOT = pwd()
const _PATH_TO_SRC = joinpath(_ROOT, "src")
const _PATH_TO_DATA = joinpath(_ROOT, "data")

# load external packages -
using DataStructures

# load my codes -
include(joinpath(_PATH_TO_SRC, "Parser.jl"))
include(joinpath(_PATH_TO_SRC, "Files.jl"))