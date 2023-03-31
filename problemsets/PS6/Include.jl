# setup paths -
const _ROOT = pwd();
const _PATH_TO_DATA = joinpath(_ROOT, "data")
const _PATH_TO_SRC = joinpath(_ROOT, "src")

# load packaages -
using JSON
using JuMP
using GLPK
using LinearAlgebra

# load my codes -
include(joinpath(_PATH_TO_SRC,"Types.jl"))
include(joinpath(_PATH_TO_SRC,"Files.jl"))
include(joinpath(_PATH_TO_SRC,"Factory.jl"))
include(joinpath(_PATH_TO_SRC,"Compute.jl"))
include(joinpath(_PATH_TO_SRC,"Utility.jl"))
