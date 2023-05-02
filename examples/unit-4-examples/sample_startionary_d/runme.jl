# include -
using Distributions

# setup -
π = [ 0.857, 0.143];
number_of_samples = 10000;

# build a categorical distribution 
d = Categorical(π);

# sample -
samples = rand(d, number_of_samples)

# how many 1's -
number_of_1 = findall(x-> x == 1, samples) |> length;
number_of_2 = findall(x-> x == 2, samples) |> length;

# println -
println("Fraction of state 1: $(number_of_1/number_of_samples) and state 2: $(number_of_2/number_of_samples)")