# include -
using Plots
using Colors

# setup colors d -
colors = Dict{Int,RGB}();
colors[1] = colorant"#0077BB"
colors[2] = colorant"#88CCEE"
colors[3] = colorant"#EE7733"
colors[4] = colorant"#CC3311"

# Code sample to compute the u(W) = W/(W+b);

# initialize -
W = exp10.(range(-4,stop=4,step=0.01)) |> collect
number_of_values = length(W);
U = Array{Float64,2}(undef, number_of_values, 2);
barray = [100.0, 500.0, 1000.0, 5000.0]
number_of_constants = length(barray);

for i ∈ 1:number_of_constants

    b = barray[i]

    # compute -
    for j ∈ 1:number_of_values
        U[j,1] = W[j];
        U[j,2] = W[j]/(b+W[j]);
    end

    # plot -
    plot!(U[:,1],U[:,2],c=colors[i], lw=3, label="Utility b=$(b) USD", ylims=[0.0,1.01],
            bg="floralwhite", background_color_outside="white", framestyle = :box, fg_legend = :transparent)
end
current();
xlabel!("Wealth (USD)", fontsize=18)
ylabel!("Utility (utils)", fontsize=18)