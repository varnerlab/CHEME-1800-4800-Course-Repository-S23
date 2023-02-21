# load packages 
using YAML

"""
    readyamlfile(path::String)::Dict{String,Any}

Load the YAML file at the path arg. Returns a Dict{String,Any} 
containing the YAML data.
"""
function readyamlfile(path::String)::Dict{String,Any}

    # check: does path point to a yaml file?
    # ...

    return YAML.load_file(path)
end

# setup path -
path_to_yaml_file = "MyApp.yaml"

# load -
d = readyamlfile(path_to_yaml_file);