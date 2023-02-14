"""
    compute_spam_bag_of_words(data::DataFrame) -> Dict{String, Float64}
"""
function compute_bag_of_words(data::DataFrame; label::String = "ham")::Dict{String, Float64}
    
    # check: should we check that label is legit?

    # initialize -
    label_df = filter(:label=>x->x==label, data) # filter's out the ham/spam messages

    # how many records (rows) do we have?
    

end