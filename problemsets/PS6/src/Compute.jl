"""
Fill me in
"""
function compute_maximum_growth_rate(problem::MyStoichiometricNetworkModel)::Dict{String,Float64}

    # initialize -
    S = problem.S;
    B = problem.bounds;
    (number_of_metabolites, number_of_reactions) = size(S)
    c = zeros(number_of_reactions);     # default c vector 
    b = zeros(number_of_metabolites);   # default b vector
    fluxes = Dict{String,Float64}()

    # cellmass is reaction 25 -
    c[25] = 1.0;

    # Build JuMP model 
    model = Model(GLPK.Optimizer)

    # add decision variables to the model -
    @variable(model, B[i,1] <= v[i=1:number_of_reactions] <= B[i,2]) # this sets up the upper bound

    # Set the objective => maximize the profit -
    @objective(model, Max, transpose(c)*v);

    # Setup the capacity constraints - add them to the model 
    @constraints(model, 
        begin
            S*v .== b
        end
    );
   
    optimize!(model)
    solution_summary(model)

    # build the flux dictionary -
    list_reaction_id = problem.reactions;
    for i ∈ 1:number_of_reactions
        id = list_reaction_id[i]
        fluxes[id] = value(v[i])
    end

    # return -
    return fluxes
end