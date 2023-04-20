# include -
include("Include.jl");

# initialize -
Sₒ = 100.0;
T = 3;
up = 1.01;
pvalue = 0.51;

# build CRR model -
my_crr_model = build(MyCRRPriceLatticeModel, (
    u = up, # a 1% increase in the price
    p = pvalue  # bias toward price increase
));

# solve -
result = solve(my_crr_model, Sₒ, T);

# compute the entropy -
H = entropy(result, 2);