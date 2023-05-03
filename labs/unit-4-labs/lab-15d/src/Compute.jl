# PRIVATE METHODS BELOW HERE ================================================================================= #


"""
    _update!(model::MyQLearningModel, data::NamedTuple) -> MyQLearninAgentModel
"""
function _world(model::MyRectangularGridWorldModel, s::Int, a::Int)::Tuple{Int,Float64}

    # initialize -
    s′ = nothing
    r = nothing
    
    # get data from the model -
    coordinates = model.coordinates;
    moves = model.moves
    states = model.states;
    rewards = model.rewards;
    number_of_rows = model.number_of_rows
    number_of_cols = model.number_of_cols

    # where are we now?
    current_position = coordinates[s];

    # get the perturbation -
    Δ = moves[a];
    new_position = current_position .+ Δ

    # before we go on, have we "driven off the grid"?
    if (new_position[1] >= 1 && new_position[1] <= number_of_rows 
        && new_position[2] >= 1 && new_position[2] <= number_of_cols)

        # lookup the new state -
        s′ = states[new_position];
        r = rewards[s′];
    else
       
        # ok: so we are all the grid. Bounce us back to to the current_position, and charge a huge penalty 
        s′ = states[current_position];
        r = -1000000.0
    end

    # return -
    return (s′,r);
end

"""
    _update!(model::MyQLearningModel, data::NamedTuple) -> MyQLearningAgentModel
"""
function _update(model::MyQLearningAgentModel, data::NamedTuple)::MyQLearningAgentModel

    # grab the s,a,reward and next state from the data tuple
    s = data[:s];
    a = data[:a];
    r = data[:r];
    s′ = data[:s′];

    # grab parameters from the model -
    γ, Q, α = model.γ, model.Q, model.α

    # use the update rule to update Q -
    Q[s,a] += α*(r+γ*maximum(Q[s′,:]) - Q[s,a])

    # return -
    return model;
end
# PRIVATE METHODS ABOVE HERE ================================================================================= #

# PUBLIC METHODS BELOW HERE ================================================================================== #

# Cool hack: What is going on with these?
(model::MyRectangularGridWorldModel)(s::Int,a::Int) = _world(model, s, a);
(model::MyQLearningAgentModel)(data::NamedTuple) = _update(model, data);

"""
    simulate(model::MyQLearningModel, environment::T, startstate::Int, maxsteps::Int;
        ϵ::Float64 = 0.2) -> MyQLearningModel where T <: AbstractWorldModel
"""
function simulate(agent::MyQLearningAgentModel, environment::T, startstate::Int, maxsteps::Int;
    ϵ::Float64 = 0.2)::MyQLearningAgentModel where T <: AbstractWorldModel

    # initialize -
    s = startstate
    actions = agent.actions;

    number_of_actions = length(actions);

    # simulation loop -
    for _ ∈ 1:maxsteps

        a = nothing;
        if rand() < ϵ

            # we generate a random action
            a = rand(1:number_of_actions);
        else

            # ok: so we are in some state s, let's use our memory to suggest a new action
            Q = agent.Q;
            a = argmax(Q[s,:]);

        end
        
        # ask the world, what is my next state and reward from this (s,a)
        (s′,r) = environment(s,a)

        # update my model -
        agent = agent((
            s = s, a = a, r = r, s′ = s′
        ));

        # move -
        s = s′;
    end

    # return -
    return agent
end
# PUBLIC METHODS ABOVE HERE ================================================================================== #