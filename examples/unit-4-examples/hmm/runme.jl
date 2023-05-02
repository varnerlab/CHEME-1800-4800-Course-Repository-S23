# include the include -
include("Include.jl"); # load paths, packages and codes

# PHASE 1: Setup the calculation ------------------------------------------------------------------ #
# Setup/initialize
number_of_hidden_states = 2
number_of_output_states = 3
number_of_simulation_steps = 480
emission_probability_dict = Dict{Int,Categorical}()
simulation_dict = Dict{Int,Int}()

# Transition matrix for the MC
P = [
    0.60 0.40;
    0.35 0.65;
];

# Emission probability matrix -
EPM = [
    0.70 0.20 0.1 ;
    0.10 0.20 0.7 ;
]

# compute the stationary distribution for the MC -
π = iterate(P, 1;  maxcount = 10, ϵ = 0.001)[1,:] # assumption: iterate converges
mcd = Categorical(π); # Markov-chain distribution

# construct emission probability dictionary -
for i ∈ 1:number_of_hidden_states
    emission_probability_dict[i] = Categorical(EPM[i,:])
end

# PHASE 2: Simulation ----------------------------------------------------------------------------- #
for i ∈ 1:number_of_simulation_steps
    
    # which state is the mc in?
    hidden_state = rand(mcd);
    
    # grab the emission probability model from the emission_probability_dict -
    epd = emission_probability_dict[hidden_state];
    
    # role for a random ouput -
    simulation_dict[i] = rand(epd);
end
