# inlclude the Submit.jl script 
include("Submit.jl");

# add some plot specifc packages
using Plots
using Colors

# setup colors -
colors = Dict{Int,RGB}();
colors[1] = colorant"#0077BB"
colors[2] = colorant"#BBBBBB"
colors[3] = colorant"#EE7733"

# make a scatter plot for each point -
U = F.U; # get the U matrix -
W = U[:,1:2]
Y = X*W;
number_of_patients = size(Y,1);
for i ∈ 1:number_of_patients

    # which visit is this?
    visit_index = L[i]

    # get data and colors -
    x = Y[i,1];
    y = Y[i,2];
    c = colors[visit_index]

    # what do we want to plot?
    if (visit_index == 1 || visit_index == 3)
        scatter!([x],[y],c=c,label="", ylim=[-10.1,10.1], xlim=[-10.1,10.1], foreground_color_axis=:white, 
        foreground_color_grid="white", framestyle = :box, bg = :black,
        foreground_color_border = :white, legend_font_color = :white,
        fg_legend = :transparent, foreground_color=:black, foreground_color_text=:white,
        yguidefontcolor=:white,xguidefontcolor=:white, xlabel="Principal component 1", ylabel="Principal component 2", fontsize=18);
    end
end
current();
#xlabel!("Principal component 1", fontsize=18)
#ylabel!("Principal component 2", fontsize=18)
