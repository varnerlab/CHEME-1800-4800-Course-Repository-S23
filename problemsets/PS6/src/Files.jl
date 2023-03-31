"""
Fill me in
"""
function readreactionfile(path::String)::Dict{String,Any}
    return JSON.parsefile(path)
end