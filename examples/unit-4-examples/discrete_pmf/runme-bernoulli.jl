# load the distributions package, and some other stuff
using Distributions
using Statistics
using PrettyTables

# Details of Bernoulli distribution: 
# https://juliastats.org/Distributions.jl/stable/univariate/#Discrete-Distributions

# setup constants -
p = 0.64;
number_of_samples = 100;

# build a Bernoulli distribution
d = Bernoulli(p)

# sample (check expectation, and variance)
samples = rand(d,number_of_samples);

# build a table -
data_for_table = Array{Any,2}(undef, 2, 3)
table_header = ["", "E(X)", "Var(X)"]

# row 1: model
data_for_table[1,1] = "model"
data_for_table[1,2] = mean(d);
data_for_table[1,3] = var(d);

# row 2: samples
data_for_table[2,1] = "samples"
data_for_table[2,2] = mean(samples);
data_for_table[2,3] = var(samples);
pretty_table(data_for_table, header=table_header);