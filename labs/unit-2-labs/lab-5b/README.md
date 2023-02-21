
## Lab-5b: Recursive descent chemical reaction parser
In computer science, a [recursive descent parser](https://en.wikipedia.org/wiki/Recursive_descent_parser) is a kind of top-down parser that recursively walks down a collection of objects until all the objects in the collection have been processed.

### Objectives
The objectives of `lab-5b` are to familiarize students with loading and parsing comma-separated value (CSV) files and developing a recursive descent parser to process the fields of the data records in the CSV file. 

In particular, we'll load and process chemical reaction strings of the form: `R00267,C6H8O7+C21H29N7O17P3,C5H6O5+CO2+C21H30N7O17P3+H` where:

__Fields__:
* Field 1: The `name` field contains an identifier for the reaction string, e.g., `R00267`
* Field 2: The `reactants` field contains the reaction string, e.g., `C6H8O7+C21H29N7O17P3`
* Field 3: The `products` field contains the reaction string, e.g., `C5H6O5+CO2+C21H30N7O17P3+H`

### Tasks
1. Break into groups and familiarize yourself with the lab structure; what do all the files do?
1. Implement the `read_reaction_file` method in `Files.jl`. This function should return a `Dict` with the names as keys and instances of the `MyKeggReaction` type as the value.
1. Analyze the behavior of the `recursive_reaction_parser` and `_recursive_reaction_parser` functions in `Parser.jl` using a simple text input such as `CAT+DOG`.
1. Test the `recursive_reaction_parser` function on different reaction phrases.

