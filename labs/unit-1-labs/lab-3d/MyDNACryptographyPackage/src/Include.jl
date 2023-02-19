# setup internal paths -
_PATH_TO_SRC = dirname(pathof(@__MODULE__))

# Load external modules -
# ...

# Load my codes -
include(joinpath(_PATH_TO_SRC, "Types.jl"))
include(joinpath(_PATH_TO_SRC, "Factory.jl"))
include(joinpath(_PATH_TO_SRC, "Lab3d-Encryption-Lib.jl"))