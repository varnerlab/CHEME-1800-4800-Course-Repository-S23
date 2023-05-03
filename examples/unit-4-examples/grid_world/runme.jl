# include -
include("Include.jl")


# Step 1: Build a model of the world -
number_of_rows = 3
number_of_cols = 3

# setup rewards -
rewards = Dict{Tuple{Int,Int}, Float64}()
rewards[(2,2)] = -100000.0 # lava is in the center square 
rewards[(3,3)] = 1000.0    # target square

# setup set of absorbing states -
absorbing_state_set = Set{Tuple{Int,Int}}()
push!(absorbing_state_set, (2,2));
push!(absorbing_state_set, (3,3));

# call the factory -
world_model = build(MyRectangularGridWorldModel, number_of_rows, number_of_rows, rewards);

# Step 2: Build a model of the agent -
α = 0.1;  # learning rate
γ = 0.95; # discount rate
nstates = (number_of_rows*number_of_cols);
nactions = 4; 
agent = build(MyQLearningAgentModel, (
    states = range(1,stop=nstates,step=1) |> collect,
    actions = range(1,stop=nactions,step=1) |> collect,
    α = α,
    γ = γ,
    Q = zeros(nstates,nactions)
))

# Step 3: Let the agent learn the world for itself ...
startstate = 1; # start at the (1,1) position
result = simulate(agent,world_model,startstate,100);

# compute the policy -
policy_dictionary = Dict{Tuple{Int,Int},String}()
action_labels = ["u","d","l","r"];
Q = result.Q;
for i ∈ 1:nstates

    # get coordinate -
    coordinate = world_model.coordinates[i];

    # get action -
    action = argmax(Q[i,:]);

    # populate policy dictionary
    if (coordinate ∈ absorbing_state_set)
        policy_dictionary[coordinate] = "∅"
    else
        policy_dictionary[coordinate] = action_labels[action];
    end
end
