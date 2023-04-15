# include the include -
include("Include.jl")

# setup colors d -
colors = Dict{Int,RGB}();
colors[1] = colorant"#0077BB"
colors[2] = colorant"#88CCEE"
colors[3] = colorant"#EE7733"
colors[4] = colorant"#CC3311"

# initialize -
α₁ = 0.5 
α₂ = 1.0 - α₁

# storage: holds indiffernce curves 
results = Dict{Int64,Array{Float64,2}}()

# set values for the good and service 1
X1 = range(0.001,stop=100.0,step = 0.001) |> collect;
d = length(X1);

# set utility values
U = [12.0, 24.0, 36.0, 48.0];
n = length(U);

# simulation loop
for i ∈ 1:n
    
    Y = Array{Float64,2}(undef,d,2);
    U_val = U[i];

    for j ∈ 1:d

        tmp = (1/α₂)*(log(U_val) - α₁*log(X1[j]));

        Y[j,1] = X1[j];
        Y[j,2] = exp(tmp);
    end

    # store -
    results[i] = Y;

    plot!(Y[:,1],Y[:,2],xlim=[0,100.0],ylim=[0,100.0],c=colors[i], lw=3, label="U: $(U_val)", 
        bg="floralwhite", background_color_outside="white", framestyle = :box, fg_legend = :transparent)
end
current();
xlabel!("Units of Good or Service 1 Consumed", fontsize=18)
ylabel!("Units of Good or Service 2 Consumed", fontsize=18)