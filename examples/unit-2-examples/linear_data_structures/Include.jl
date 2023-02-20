# setup paths -
const _ROOT = pwd()
const _PATH_TO_SRC = joinpath(_ROOT, "src")

# load external packages -
using DataStructures

# load my codes -
include(joinpath(_PATH_TO_SRC, "Stack.jl"))
include(joinpath(_PATH_TO_SRC, "Queue.jl"))
