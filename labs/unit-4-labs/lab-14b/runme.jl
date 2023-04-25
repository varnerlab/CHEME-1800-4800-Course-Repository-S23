# include the include -
include("Include.jl")

# initialize -
number_of_sample_paths = 1000; # number of instance of the game
results = Dict{Int, Stack{MyCoinFlipGameModel}}() # this data structure holds a stack of coin flip results for each instance of the game
p = 0.5; # fair coin, so = 0.5
d = Bernoulli(p); # to get a sample from this distribution, call rand(d)

 # simulation loop -
for i ∈ 1:number_of_sample_paths

    # initialize current payout - we always start w/2.0
    current_payout = 2.0;

    # build stack: this holds the data for the flips
    s = Stack{MyCoinFlipGameModel}()

    # TODO: Implement the coin flip game logic here
    # ...


    # store the stack for this instance of the game
    results[i] = s;
end