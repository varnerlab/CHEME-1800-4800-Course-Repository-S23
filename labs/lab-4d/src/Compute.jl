"""
    compute_bag_of_words(sentences::Dict{Int,String}) -> Dict{String,Int}
"""
function compute_bag_of_words(sentences::Dict{Int,String})::Dict{String,Int}

    # initialize -
    number_of_sentences = length(sentences);
    bag_of_words = Dict{String,Int}()

    # process each sentence -
    for (index, sentence) ∈ sentences
        
        # grab a sentence -
        clean_sentence = replace(sentence, "."=>"", "," =>"", 
            "\""=>"", ":"=>"", "("=>"", ")" => "", "?"=>"")
        
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

    # remove ""
    delete!(bag_of_words, "")

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


function words(bow::Dict{String,T})::Array{String,1} where T <: Number

    # initialize -
    list_of_words = Array{String,1}()

    for (word,value) ∈ bow
        push!(list_of_words, word)
    end

    # sort -
    return sort!(list_of_words)
end


"""
    maximum(bow::Dict{String,T}) -> Pair{String,T} where T <: Number
"""
function maximum(bow::Dict{String,T}; exclude::Set{String} = Set{String}())::Pair{String,T} where T <: Number

    # initialize -
    max_value = 0.0
    max_word = nothing

    for (word,value) ∈ bow

        if (in(word,exclude) == false && value>max_value)
            
            # grab the value and word -
            max_value = value
            max_word = word
        end
    end

    return max_word => max_value
end