# include -
include("Include.jl");

# load the price data sets -
D_AMD = loaddataset(joinpath(_PATH_TO_DATA, "AMD-OHLC-daily-T03-22-23-F03-22-21.csv"));
D_SPY = loaddataset(joinpath(_PATH_TO_DATA, "SPY-OHLC-daily-T03-22-23-F03-22-21.csv"));

# Step 1: estimate α, β
# Ok, what do we do now?

# Step 2: estimate the error model.
# Hmmm. What do I need to do?