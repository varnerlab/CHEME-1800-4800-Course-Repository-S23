# include -
include("Include.jl")


# Step 1: Build a model of the world -
number_of_rows = 4
number_of_cols = 4

# setup rewards -
rewards = Dict{Tuple{Int,Int}, Float64}()
rewards[(2,2)] = -100000.0 # lava is the (2,2) square 
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
agent_model = build(MyQLearningAgentModel, (
    states = range(1,stop=nstates,step=1) |> collect,
    actions = range(1,stop=nactions,step=1) |> collect,
    α = α,
    γ = γ,
    Q = zeros(nstates,nactions)
));