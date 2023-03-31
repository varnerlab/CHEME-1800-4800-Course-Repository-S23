"""
    findreaction(data::Dict{String,Any}, reactionid::String) -> Union{Nothing,Dict{String,Any}}
"""
function findreaction(data::Dict{String,Any}, reactionid::String)::Union{Nothing,Dict{String,Any}}

    # initialize
    list_of_reactions = data["reactions"]
    should_keep_going = true;
    counter = 1;
    result_dictionary = nothing;

    while (should_keep_going == true)
        
        # grab a dictionary, not sure if this 
        test_dict = list_of_reactions[counter]

        # update -or- stop?
        if (test_dict["id"] == reactionid)
            
            # we found the one we are looking for - grab it
            result_dictionary = test_dict

            # we are done, set the keep going flag to false
            should_keep_going = false;
        else

            # hmmm. Did not find what we were looking for, update the counter and try again
            counter = counter + 1
        end
    end

    # return 
    return result_dictionary
end

"""
    findreaction(data::Dict{String,Any}, index::Int) -> Union{Nothing,Dict{String,Any}}
"""
function findreaction(data::Dict{String,Any}, index::Int)::Union{Nothing,Dict{String,Any}}
    reactionid = data["reactions"][index]["id"]
    return reactionstring(data, reactionid);
end