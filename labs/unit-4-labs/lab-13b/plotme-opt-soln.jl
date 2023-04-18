# include -
include("Include.jl")

# run case -
include("runme-case-1.jl"); # super hack ... but it works

# setup colors 
colors = Dict{Int,RGB}();
colors[1] = colorant"#0077BB"
colors[2] = colorant"#88CCEE"
colors[3] = colorant"#EE7733"
colors[4] = colorant"#CC3311"

# ok, let's grab the results dictionary, and the Uopt -
Uopt = round(results["objective_value"], sigdigits=4);
xopt = results["argmax"];
xlim = [0.01,2*xopt[1]];
x1_opt = round(xopt[1]; sigdigits=2)
x2_opt = round(xopt[2]; sigdigits=2)

# compute the indifference curve -
INC = indifference(problem,Uopt,xlim)

# compute the budget -
BC = budget(problem,xlim)

# make the plots -
plot(INC[:,1],INC[:,2],xlim=xlim,ylim=[0.01,1.2*BC[1,2]], label="U: $(Uopt)", lw=3, c=colors[1], 
    bg="floralwhite", background_color_outside="white", framestyle = :box, fg_legend = :transparent);
plot!(BC[:,1],BC[:,2], label="Budget", lw=3,c=colors[4])
scatter!([xopt[1]], [xopt[2]], ms=4, label="opt: ($(x1_opt),$(x2_opt))", c="white", mec=colors[1])
xlabel!("Units of Good or Service 1 Consumed", fontsize=18)
ylabel!("Units of Good or Service 2 Consumed", fontsize=18)


