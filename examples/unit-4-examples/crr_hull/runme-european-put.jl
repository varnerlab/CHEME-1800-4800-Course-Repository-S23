# Example 13.4 from Hull
# Setup parameters -
μ = 0.05;   # annual
p = 0.6282; # probability of an up move -
ΔT = 1.0;   # time step
D = exp(μ*ΔT);

# Setup the price payout calculation for node 1
V3 = 0.0;
V4 = 4.0; 
V1 = (1/D)*(p*V3 + (1-p)*V4)

# Setup price calculation for node 2 -
V5 = 20.0;
V2 = (1/D)*(p*V4 + (1-p)*V5)

# Setup price calculation for node 1 -
V0 = (1/D)*(p*V1 + (1-p)*V2)

# Print -
println("The expected payout at nodes: V = (V0,V1,V2) = ($(round(V0,sigdigits=3)), $(round(V1,sigdigits=3)), $(round(V2,sigdigits=3)))")