# load packages 
using TOML

"""
    readtomlfile(path::String)::Dict{String,Any}

Load the TOML file at the path arg. Returns a Dict{String,Any} containing the TOML data.
"""
function readtomlfile(path::String)::Dict{String,Any}

    # check: does path point to a toml file?
    # ...

    return TOML.parsefile(path)
end

# setup path -
path_to_toml_file = "Database.toml"

# load -
d = readtomlfile(path_to_toml_file);