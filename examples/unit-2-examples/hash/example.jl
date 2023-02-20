"""
    myhash(key::String, β::Int64, size::Int64)::Int64

Convert a String `key` to `Int` for an array of type `size` 
"""
function myhash(key::String, β::Int64, size::Int64)::Int64

    # initialize -
    hash = 0
    L = length(key)

    # main loop -
    for i ∈ 1:L
        hash = (hash*β + convert(Int, key[i])) % size
    end

    # return -
    return hash
end