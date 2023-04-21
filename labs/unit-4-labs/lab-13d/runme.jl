# include -
include("Include.jl");

# initialize -
Sₒ = 100.0;
T = 3;
u = 1.01;
p = 0.51;

# build CRR model -
my_crr_model = build(MyCRRPriceLatticeModel, (
    u = u, # a 1% increase in the price
    p = p  # bias toward price increase
));

# solve -
results = solve(my_crr_model, Sₒ, T);

# compute the entropy -
# H = entropy(results, 0);