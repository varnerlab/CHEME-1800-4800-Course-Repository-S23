"""
    build(type::Type{Stack{Char}}, string::String)::Stack{Char}

Factory method for constructing a Queue holding the contents of string

Assumptions:
* The DataStructures.jl package has been installed. See: https://juliacollections.github.io/DataStructures.jl/latest/
"""
function build(type::Type{Stack{Char}}, string::String)::Stack{Char}
    
    # initialize an empty stack -
    s = Stack{Char}()

    # add string to the stack -
    chars = collect(string);
    for c ∈ chars
        push!(s,c);
    end

    # return -
    return s
end

"""
    build(type::Type{Queue{Char}}, string::String)::Queue{Char}

Factory method for constructing a Queue holding the contents of string

Assumptions:
* The DataStructures.jl package has been installed. See: https://juliacollections.github.io/DataStructures.jl/latest/
"""
function build(type::Type{Queue{Char}}, string::String)::Queue{Char}
    
    # initialize an empty stack -
    q = Queue{Char}()

    # add string to the stack -
    chars = collect(string);
    for c ∈ chars
        enqueue!(q,c);
    end

    # return -
    return q
end