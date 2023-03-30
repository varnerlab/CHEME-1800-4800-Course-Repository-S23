function _extract_species_dictionary(reaction_phrase::String;
	direction::Float64 = -1.0)::Dict{String,Float64}

	# initialize -
	species_symbol_dictionary = Dict{String,Float64}()
	
	# ok, do we hve a +?
	component_array = split(reaction_phrase,'+');
	for component ∈ component_array

		if (contains(component,'*') == true)
			
			tmp_array = split(component,'*')
			st_coeff = direction*parse(Float64,tmp_array[1])
			species_symbol = String(tmp_array[2])

			# don't cache the ∅ -
			if (species_symbol != "∅" && species_symbol != "[]")
				species_symbol_dictionary[species_symbol] = st_coeff
			end
		else 
			
			# strip any spaces -
			species_symbol = component |> lstrip |> rstrip

			# don't cache the ∅ -
			if (species_symbol != "∅" && species_symbol != "[]")
				species_symbol_dictionary[species_symbol] = direction*1.0
			end
		end
	end

	# return -
	return species_symbol_dictionary
end

function _expand_reversible_reactions(reactions::Dict{Int64, MyChemicalReaction})::Dict{Int64,MyChemicalReaction}

    # initialize -
    processed_reactions = Dict{Int64, MyChemicalReaction}()
    counter = 0;
    number_of_reactions = length(reactions)

    # main loop -
    for i ∈ 0:(number_of_reactions - 1)

        # get reaction -
        reaction = reactions[i];
        
        # get components -
        rname = reaction.name
        forward_phrase = reaction.reactants
        reverse_phrase = reaction.products
        is_reversible = reaction.reversible

        # add the parent reaction to the dictionary -
        processed_reactions[counter] = reaction;
        counter += 1;
    
        # if the reaction is reversible, then we need to build a new reaction
        if (is_reversible == true)

            # create a new reaction object, with the reactants and products reversed
            new_name = "$(rname)r"
            new_reaction_object = build(MyChemicalReaction, new_name, reverse_phrase, forward_phrase, false);

            # store -
            processed_reactions[counter] = new_reaction_object;
            counter += 1
        end
    end

    # return -
    return processed_reactions
end


function _build_transport_matrix(inputs::Int, outputs::Int,species::Int)::Array{Float64,2}
    
    # initialize -
    total_number_of_streams = (inputs + outputs)
    number_of_inputs = inputs;
    number_of_outputs = outputs;
    number_of_species = species;
    T = zeros(number_of_species, (total_number_of_streams*number_of_species));

    # build a dictionary of blocks, starting with the inputs
    block_dictionary = Dict{Int,Array{Float64,2}}()
    for i ∈ 1:number_of_inputs
        B = Matrix{Float64}(I, number_of_species, number_of_species);       
        block_dictionary[i] = B;
    end
    
    for j ∈ 1:number_of_outputs
        output_block_index = (number_of_inputs + j);
        B = -1*Matrix{Float64}(I, number_of_species, number_of_species);
        block_dictionary[output_block_index] = B;
    end

    # put the blocks together -
    T = nothing
    for i ∈ 1:total_number_of_streams

        # get the block -
        B = block_dictionary[i]

        # add the block to T 
        if (i == 1)
            T = B;
        else
            T = hcat(T,B)
        end
    end

    # return the transport matrix -
    return T
end


"""
    build(type::Type{MyChemicalReaction}, name::String, reactants::String, products::String)::MyChemicalReaction

Factory method to build an instance of the MyChemicalReaction type. MyChemicalReaction is a model of the
information contained in the Reactions.net file
"""
function build(type::Type{MyChemicalReaction}, name::String, reactants::String, products::String, reversible::Bool)::MyChemicalReaction

    # check: name, reactants and products correct?
    # in production, we'd check this. Assume these are ok now

    # initialize -
    model = MyChemicalReaction(); # build an empty model 

    # add data to the model -
    model.name = name;
    model.reactants = reactants;
    model.products = products;
    model.reversible = reversible;

    # return -
    return model;
end

"""
    build(type::Type{MyStoichiometricNetworkModel}, reactions::Dict{Int64, MyChemicalReaction}; 
        expand::Bool = false) -> MyStoichiometricNetworkModel
"""
function build(type::Type{MyStoichiometricNetworkModel}, reactions::Dict{Int64, MyChemicalReaction}; 
    expand::Bool = false)::MyStoichiometricNetworkModel

    # initialize -
	species_array = Array{String,1}()
	reaction_array = Array{String,1}()
	reaction_dictionary_array = Array{Dict{String,Float64},1}()

    # should we expand the reversible reactions?
    reactions_to_process = reactions;
    if (expand == true)
        reactions_to_process = _expand_reversible_reactions(reactions);
    end

    # how many reactions are we going to process?
    number_of_reactions = length(reactions_to_process)
    for i ∈ 0:(number_of_reactions - 1)

		# initialize tmp storage -
		tmp_dictionary = Dict{String,Float64}()
        reaction = reactions_to_process[i]
		
        # get the data from the reaction -
        reactants = reaction.reactants;
        products = reaction.products;
        rname = reaction.name;

        # store the reaction name -
        push!(reaction_array, rname)

		# generate species lists for the reactants and products, then merge -
		merge!(tmp_dictionary, _extract_species_dictionary(reactants; direction = -1.0))
		merge!(tmp_dictionary, _extract_species_dictionary(products; direction = 1.0))

		# grab the tmp_dictionary for later -
		push!(reaction_dictionary_array, tmp_dictionary)

		# the species that we need to look at are the keys of the tmp_dictionary -
		tmp_species_list = keys(tmp_dictionary)
		
		# we need a unique species list, so check to see if we have already discovered this species -
		for tmp_species ∈ tmp_species_list
			if (in(tmp_species, species_array) == false)

				# ok, we have *not* seen this species before, let's grab it -
				push!(species_array, tmp_species)
			end
		end
	end

	# sort alphabetically -
	sort!(species_array)

    # we have a *unique* species array, let's initialize some storage for the stoichiometric array
	S = zeros(length(species_array), length(reactions_to_process));

	# last: fill in the values for stoichiometric coefficents -
	for (row_index, species_symbol) ∈ enumerate(species_array)
		for (col_index, reaction_dictionary) ∈ enumerate(reaction_dictionary_array)

			# ok: is this species symbol in my reaction dictionary?
			if (haskey(reaction_dictionary, species_symbol) == true)
				S[row_index,col_index] = reaction_dictionary[species_symbol]
			end
		end
	end

    # build model -
    model = MyStoichiometricNetworkModel()
    model.S = S;
    model.species = species_array
    model.reactions = reaction_array

	# return -
	return model
end


function build(type::Type{MyStreamNetworkModel}, data::NamedTuple)::MyStreamNetworkModel

    # build an empty model -
    model = MyStreamNetworkModel();
    number_of_input_streams = 0;
    number_of_output_streams = 0;
    number_of_species = 0;
    
    # check: do we have a :number_of_input_streams key?
    if (haskey(data,:number_of_input_streams) == true)
        number_of_input_streams = data[:number_of_input_streams]
    end

    # check: do we have a :number_of_output_streams key?
    if (haskey(data,:number_of_output_streams) == true)
        number_of_output_streams = data[:number_of_output_streams]
    end    

    # check: do we have a :number_of_output_streams key?
    if (haskey(data,:number_of_species) == true)
        number_of_species = data[:number_of_species]
    end  

    # set data on the model -
    model.number_of_input_streams = number_of_input_streams;
    model.number_of_output_streams = number_of_output_streams;
    model.number_of_species = number_of_species;
    model.T = _build_transport_matrix(number_of_input_streams, number_of_output_streams, number_of_species);

    # return -
    return model;
end