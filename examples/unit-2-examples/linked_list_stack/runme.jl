# include the Include -
include("Include.jl")

# create a new an empty stack -
s = Stack(nothing);

# add characters to the stack -
text = "Roomba!"
char_array = collect(text);
for c ∈ char_array
    push!(s,c)
end