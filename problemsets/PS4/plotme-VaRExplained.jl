# inlclude the Submit.jl script 
include("Submit.jl");

# add some plot specifc packages
using Plots
using Colors

# compute the variance explained -
Σ = F.S;
D = explained(Σ);

# make a plot -
plot(D[:,2], lw=2, c=colorant"#0077BB", ylim=[0.0,1.1], xlim=[0,32], label="VaR explained")
scatter!(D[:,2], markercolor="white", msc=colorant"#0077BB", ylim=[0.0,1.1], xlim=[0,33], label="")
xlabel!("Mode index i", fontsize=18)
ylabel!("Fraction variance explained", fontsize=18)