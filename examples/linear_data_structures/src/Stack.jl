"""
    build(type::Type{Stack{Char}}, string::String)::Stack{Char}
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