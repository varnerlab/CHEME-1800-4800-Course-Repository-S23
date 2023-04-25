# include the include -
include("Include.jl")

# initialize -
number_of_sample_paths = 10000; # number of instance of the game
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
    # setup a flag - and while loop
    can_flip_again = true
    flip_index = 1;
    while (can_flip_again == true)

        # flip -
        coin_flip_result = rand(d);
        if (coin_flip_result == 1) # heads
            
            # update the current payout -
            current_payout += 2^(flip_index)

            # we are going around again, update the flip index
            flip_index = flip_index + 1
        else

            # ok, ww hit a tails, stop the game -
            can_flip_again = false;
        end

        # build the result of this flip -
        flip_model = build(MyCoinFlipGameModel, (
            payout = current_payout,
            result = coin_flip_result
        ));

        # push this onto the stack
        push!(s, flip_model)
    end


    # store the stack for this instance of the game
    results[i] = s;
end