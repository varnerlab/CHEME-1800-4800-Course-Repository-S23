# include -
include("Include.jl");

# load the price data sets -
D_AMD = loaddataset(joinpath(_PATH_TO_DATA, "AMD-OHLC-daily-T03-22-23-F03-22-21.csv"));
D_SPY = loaddataset(joinpath(_PATH_TO_DATA, "SPY-OHLC-daily-T03-22-23-F03-22-21.csv"));

# Step 1: estimate α, β
RAMD = R(D_AMD);
RSPY = R(D_SPY);

# build the data matrix -
number_of_returns = length(RAMD);
X = Array{Float64,2}(undef,number_of_returns,2);
y = Array{Float64,1}(undef,number_of_returns)
for i ∈ 1:number_of_returns
    X[i,1] = 1.0
    X[i,2] = RSPY[i]
    y[i] = RAMD[i]
end

# compute parameters -
β̂ = pinv(X)*y;

# Step 2: estimate the error model.
errors = y - X*β̂; 
ϵ = errormodel(errors);