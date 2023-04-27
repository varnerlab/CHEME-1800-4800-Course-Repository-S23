# include the include -
include("Include.jl")

# set parameters that are *constant* for all contracts -
B = 365.0       # Days in a year (all values are per year)
DTE = 51.0      # Days to expiration (DTE``)
μ = 0.0352      # risk free rate: https://www.cnbc.com/quotes/US10Y
L = 100;        # number of levels on the tree
ticker = "AMD"  # let's look at AMD contracts

# TODO impl a test simulation and compare results with midpoint values
# ...