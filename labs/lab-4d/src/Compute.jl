"""
    compute_spam_bag_of_words(data::DataFrame) -> Dict{String, Int64}
"""
function compute_bag_of_words(data::DataFrame; label::String = "ham")::Dict{String, Int}
    
    # check: should we check that label is legit?

    # initialize -
    label_df = filter(:label=>x->x==label, data) # filter's out the ham/spam messages
    bag_of_words = Dict{String, Int}()

    # how many records (rows) do we have?
    number_of_records = nrow(label_df);
    for r ∈ 1:number_of_records
        
        # grab the row (the message text)
        original_message_text = label_df[r, :message];
        clean_message_text = replace(original_message_text, "."=> " ", 
            ","=>" ", "?"=>" ", "!"=>" ", "'"=>"", "&lt;"=>"<", "&gt;"=>">")  # remove the puncation from the message text -

        # split -
        message_words = split(clean_message_text," ");
        for word ∈ message_words

            if (haskey(bag_of_words, word) == true)
                old_value = bag_of_words[word]
                bag_of_words[word] = old_value + 1;
            else
                bag_of_words[word] = 1;
            end
        end
    end

    # return -
    return bag_of_words
end

function frequency(bow::Dict{String,Int}; multiplier::Number = 100.0)::Dict{String, Number}

    # initialize -
    number_of_words = length(bow)
    freq_bow = Dict{String, Number}()

    # what is going on here?
    for (key, value) ∈ bow
        freq_bow[key] = (multiplier/number_of_words)*value;
    end

    # return -
    return freq_bow;
end