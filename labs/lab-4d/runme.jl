# Fill me in -
include("Include.jl")

# set path -
path_to_review = joinpath(_PATH_TO_POSITIVE_REVIEWS,"cv002_15918.txt")

# load review text -
sentences = load_review_file(path_to_review);

# create bow -
bow = compute_bag_of_words(sentences);