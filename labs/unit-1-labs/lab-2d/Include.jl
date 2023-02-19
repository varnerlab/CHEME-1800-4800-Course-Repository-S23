# load any external packages -
using UUIDs

# setup path structure -
const _ROOT = pwd();
const _PATH_TO_SRC = joinpath(_ROOT, "src")

# load my codes -
include(joinpath(_PATH_TO_SRC, "Types.jl"));
include(joinpath(_PATH_TO_SRC, "Factory.jl"))