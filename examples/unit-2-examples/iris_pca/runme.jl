# include -
include("Include.jl")

# load the data -
path_to_data = joinpath(_PATH_TO_DATA, "iris.data")

# load the data, and create the data matrix -
df = CSV.read(path_to_data, DataFrame);
data = Matrix(df[:,1:4]);

# color map -
colors = Dict{String,Any}()
colors["Iris-setosa"] = colorant"#EF4035"
colors["Iris-versicolor"] = colorant"#0068AC"
colors["Iris-virginica"] = colorant"#6EB43F"

# scale -
X = standardize(data);

# decompose -
(U,Σ,VT) = svd(transpose(X));

# project -
W = U[:,1:2];
Y = X*W;

# visualize -
number_of_points = size(Y,1);
for i ∈ 1:number_of_points

    # get x -
    x = Y[i,1];
    y = Y[i,2];
    class = df[i,:class]
    color = colors[class]

    # plot -
    scatter!([x],[y],c=color, label="")
end

# add labels -
xlabel!("Principle Component 1", fontsize=18)
ylabel!("Principle Component 2", fontsize=18)
current()