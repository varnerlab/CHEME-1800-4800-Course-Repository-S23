# setup paths -
const _ROOT = pwd()
const _PATH_TO_SRC = joinpath(_ROOT, "src")

# load external packages -
using LinearAlgebra
using IterativeSolvers

# extra (comment out it giving issues)
using Plots
using Colors

# load my codes -
include(joinpath(_PATH_TO_SRC, "Types.jl"))
include(joinpath(_PATH_TO_SRC, "Factory.jl"))
include(joinpath(_PATH_TO_SRC, "Solvers.jl"))
