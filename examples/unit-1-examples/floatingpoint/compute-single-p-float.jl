function decompose(x::Float32)::Dict{Int,Int}

    # initialize -
    counter = 0;
    data = Dict{Int, Int}()

    # convert x to a bit string -
    array = reverse(parse.(Int, bitstring(x) |> collect));

    # main -
    for value ∈ array
        data[counter] = value;
        counter = counter + 1
    end

    # return -
    return data;
end

# sign bit -
function S(d::Dict{Int,Int})
    if d[31] == 0
        return 1.0
    else
        return -1.0
    end
end

# mantissa 
function M(d::Dict{Int,Int})
    
    # compute sum range 
    R = range(1,stop=23,step=1) |> collect

    # compute sum term -
    sum_value = 0.0;
    for i ∈ R
        sum_value = sum_value + (d[23-i])*2.0^(-i)
    end

    # return -
    return (1+sum_value)
end

# exponent -
function E(d::Dict{Int, Int})
    
    # compute sum range 
    R = range(0,stop=7,step=1) |> collect

    # compute sum term -
    sum_value = 0.0;
    for i ∈ R
        sum_value = sum_value + (d[23+i])*2.0^(i)
    end

    # return -
    return sum_value
end

# put the number together -
v = 3.14159
x = convert(Float32,v);
d = decompose(x)

# S -
SV = S(d);

# M -
MV = M(d);

# E -
EV = E(d);

# put all together -
Z = SV*MV*2.0^(EV-127)