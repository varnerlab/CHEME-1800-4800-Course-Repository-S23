# load required packages
using JSON

"""
    readjsonfile(path::String)::Dict{String,Any}

Load the JSON file at the path arg. Returns a Dict{String,Any} containing the JSON data.
"""
function readjsonfile(path::String)::Dict{String,Any}

    # check: does path point to a json file?
    # ...

    return JSON.parsefile(path)
end

# setup path -
path_to_json_file = "Contacts.json"

# load -
d = readjsonfile(path_to_json_file);