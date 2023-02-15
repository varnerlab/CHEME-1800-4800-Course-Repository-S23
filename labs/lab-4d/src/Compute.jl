"""
"""
function compute_bag_of_words(sentences::Dict{Int,String})::Dict{String,Int}

    # initialize -
    number_of_sentences = length(sentences);
    bag_of_words = Dict{String,Int}()

    # process each sentence -
    for i ∈ 0:(number_of_sentences - 1)
        
        # grab a sentence -
        sentence = sentences[i];
        clean_sentence = replace(sentence, "."=>"", "," => "")
        
        # split -
        words = split(clean_sentence, " ");
        for word ∈ words
            if (haskey(bag_of_words, word) == false)
                bag_of_words[word] = 1;
            else
                bag_of_words[word] += 1
            end
        end
    end

    # return -
    return bag_of_words;
end 

"""
    frequency(bow::Dict{String, Int}; multiplier::Number = 100.0) -> Dict{String, Number}
"""
function frequency(bow::Dict{String, Int}; multiplier::Number = 100.0)::Dict{String, Number}

    # initialize -
    number_of_words = length(bow);
    frequency_dictionary = Dict{String, Number}();

    for (word, count) ∈ bow
        frequency_dictionary[word] = (multiplier/number_of_words)*count;
    end

    # return -
    return frequency_dictionary;
end