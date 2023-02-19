# include -
include("Include.jl")

# Build a test string -
test_string = " you've got mail works alot better than it deserves to . ";

# parse -
d = recursive_string_parser(test_string);
