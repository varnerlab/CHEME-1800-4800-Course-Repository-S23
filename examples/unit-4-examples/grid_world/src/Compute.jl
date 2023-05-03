
"""
    lookahead(model::MyQLearningModel, s::Int, a::Int) = model.Q[s,a];
"""
lookahead(model::MyQLearningModel, s::Int, a::Int) = model.Q[s,a];

"""
    update!(model::MyQLearningModel, data::NamedTuple) -> MyQLearningModel
"""
function update!(model::MyQLearningModel, data::NamedTuple)::MyQLearningModel

    # grab the s,a,reward and next state from the data tuple
    s = data[:s];
    a = data[:a];
    r = data[:r];
    s′ = data[:sprime];

    # grab parameters from the model -
    γ, Q, α = model.γ, model.Q, model.α

    # use the update rule to update Q -
    Q[s,a] += α*(r+γ*maximum(Q[s′,:]) - Q[s,a])

    # return -
    return model;
end

"""
    simulate(model::MyQLearningModel, startstate::Int, maxsteps::Int, policy::Function, world::Function) -> MyQLearningModel
"""
function simulate(model::MyQLearningModel, environment::MyGridWorldModel, startstate::Int, maxsteps::Int;
    ϵ::Float64 = 0.2)::MyQLearningModel

    # initialize -
    s = startstate
    actions = model.actions;

    number_of_actions = length(actions);

    # simulation loop -
    for _ ∈ 1:maxsteps

        a = nothing;
        if rand() < ϵ

            # we generate a random action
            a = rand(1:number_of_actions);
        else

            # ok: so we are in some state s, let's use our memory to suggest a new action
            Q = model.Q;
            a = argmax(Q[s,:]);
        end
        
        # ask the world, what is my next state and reward from this (s,a)
        (s′,r) = world(environment, s, a);

        # update my model -
        model = update!(model, (
            s = s, 
            a = a, 
            r = r, 
            s′ = s′)
        );

        # move -
        s = s′;
    end

    # return -
    return model
end

function world(model::MyWorldModel, s::Int, a::Int)::Tuple{Int,Float64}

    # initialize -
    s′ = nothing
    r = nothing

    # get data from the model -
    coordinates = model.coordinates;
    moves = model.moves
    states = model.states;
    rewards = model.rewards;

    # where are we now?
    current_position = coordinates[s];

    # get the perturbation -
    Δ = moves[a];
    new_position = current_position .+ Δ

    # lookup the new state -
    s′ = states[new_position];
    r = rewards[s′];

    # return -
    return (s′,r);
end