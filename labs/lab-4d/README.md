## Lab-4d: Working with text data files. Movie reviews and sentiment analysis

Ultimately, we would like to build a system that can classify text as either positive or negative in tone, called [sentiment analysis](https://en.wikipedia.org/wiki/Sentiment_analysis). Toward this goal, we'll begin by introducing some basic ideas in [natural language processing (NLP)](https://en.wikipedia.org/wiki/Natural_language_processing).

### Objectives
The objectives of `lab-4d` are to familiarize students with working with text documents and a simple [natural language processing (NLP)](https://en.wikipedia.org/wiki/Natural_language_processing) model called the 
[bag of words](https://en.wikipedia.org/wiki/Bag-of-words_model).

### Data
We'll use the [Cornell movie review v2.0 data set](http://www.cs.cornell.edu/people/pabo/movie-review-data) as our corpus. This data set was introduced and analyzed in [Pang/Lee ACL 2004](https://aclanthology.org/P04-1035/). This data set contains 1000 positive and 1000 negative processed reviews.

### Tasks
1. Break up into groups and finish implementing the `load_review_file` function in `Files.jl`. The `load_review_file` function reads a text file and returns each line as an entry in a dictionary. 
1. Load the `cv002_15918.txt` file in the positive reviews directory. 
1. Analyze the word frequency for `cv002_15918.txt` (fill in the `runme.jl` script):
    * Finish implementing the `compute_bag_of_words` function in the `Compute.jl` file. The `compute_bag_of_words` function returns a dictionary with the words as keys and the counts as values.
    * Use the `frequency` function in the `Compute.jl` file to compute the frequency of word use. 
1. Let's look at what words are important using the `maximum` function in `Compute.jl`