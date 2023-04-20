# include -
include("Include.jl");

# setup colors 
colors = Dict{Int,RGB}();
colors[1] = colorant"#0077BB"
colors[2] = colorant"#88CCEE"
colors[3] = colorant"#EE7733"
colors[4] = colorant"#CC3311"

# initialize -
Sₒ = 100.0;
T = 30;
u = 1.01;
p = 0.51;

# build CRR model -
my_crr_model = build(MyCRRPriceLatticeModel, (
    u = u, # a 1% increase in the price
    p = p  # bias toward price increase
));

# solve -
result = solve(my_crr_model, Sₒ, T);

# initialize some space -
H_array = Array{Float64,2}(undef,T+1,2);
for t ∈ 1:(T+1)

    # compute the entropy -
    H_array[t,1] = t-1;
    H_array[t,2] = entropy(result, (t-1));
end

# plot -
plot(H_array[:,1],H_array[:,2], lw=2,c=colors[1], label="Entropy (bits)", 
    bg="floralwhite", background_color_outside="white", framestyle = :box, fg_legend = :transparent);
scatter!(H_array[:,1], H_array[:,2], ms=4, label="", c="white", mec=colors[1])
xlabel!("Time periods (AU)", fontsize=18)
ylabel!("Lattice entropy (bits)", fontsize=18)
