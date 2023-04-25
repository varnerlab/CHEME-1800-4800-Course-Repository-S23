# include the include -
include("Include.jl")

# initialize -
number_of_sample_paths = 20000;
results = Dict{Int, Stack{MyCoinTossResultModel}}()
p = 0.5; # fair coin
d = Bernoulli(p);

 # simulation loop -
for k ∈ 1:number_of_sample_paths

    # initialize current payout -
    current_payout = 2.0;

    # build stack -
    s = Stack{MyCoinTossResultModel}()

    # setup a flag -
    can_flip_again = true
    flip_index = 1;
    while (can_flip_again == true)

        # flip -
        coin_flip_result = rand(d);
        if (coin_flip_result == 1) # heads
            
            # update the current payout -
            current_payout = current_payout + 2^(flip_index)

            # build -
            result_model = build(MyCoinTossResultModel, (
                payout = current_payout,
                result = coin_flip_result
            ));

            push!(s, result_model)
        else

            # ok, ww hit a tails, stop the game -
            
            # build -
            result_model = build(MyCoinTossResultModel, (
                payout = current_payout,
                result = coin_flip_result
            ));

            push!(s, result_model);

            # stop the loop -
            can_flip_again = false;
        end

        flip_index = flip_index + 1
    end

    # store the stack -
    results[k] = s;
end

# # compute the endstate -
tmp_array = Array{Float64,1}()
for i ∈ 1:number_of_sample_paths
    stack_trace = results[i];
    end_roll = pop!(stack_trace)
    push!(tmp_array,end_roll.payout)
end