# runme -
include("runme.jl") # loads packages, computes simulation_dict -

# Setup -
Sₒ = 100.0;
S = Dict{Int,Float64}()
S[0] = Sₒ

# setup colors -
colors = Dict{Int,RGB}();
colors[1] = colorant"#0077BB"
colors[2] = colorant"#BBBBBB"
colors[3] = colorant"#EE7733"
colors[4] = colorant"#88CCEE"

# sim loop -
for i ∈ 1:number_of_simulation_steps

    # generate random up and down moves -
    lb = 0.0;
    ub = 0.1; # in %
    μ = (1/100)*(lb + (ub - lb)*rand());
    Δ = [μ,0,-μ];


    # market state -
    market_state_index = simulation_dict[i]

    # get previous price -
    S_old = S[i-1];
    S[i] = S_old*exp(Δ[market_state_index]);
end

# make a plot -
plot!(S,lw=3,c=colors[1],label="")
xlabel!("Time index (AU)", fontsize=18)
ylabel!("Share price (USD/share)", fontsize=18)
