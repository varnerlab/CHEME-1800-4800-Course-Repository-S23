## Problem Set 2: Recursive Chemical Formula Parser
Chemical compound and chemical reaction databases, e.g., [The KEGG: Kyoto Encyclopedia of Genes and Genomes](https://www.kegg.jp) are ubiquitous on the web. 

### Tasks
1. Implement the `read_compounds_file` method in `Files.jl`. This function should return a `Dict` with the compound names as keys and instances of the `MyChemicalCompoundModel` type as the value. Make sure to finish the `docstrings` for each function. More information on `docstrings` can be found at [Julia docstrings](https://docs.julialang.org/en/v1/manual/documentation/#Writing-Documentation)
1. Design and implement the `recursive_compound_parser` and `_recursive_compound_parser` functions in `Parser.jl`. These functions compute the composition dictionary for each chemical in the `Compounds.data` file. 
1. Finish the implementation of the `Include.jl` file. 
1. Execute the `Submit.jl` file to test your program implementation.

### Assessment
* The teaching team will execute the `Submit.jl` script with your program functions. 
* The teaching team will evaluate style components: variable and function names should be informative, and functions should have informative docstrings. 
* The teaching team will evaluate whether the submission guidelines were followed.

### Rules, deadlines, and submission guidelines
* Problem Set 2 is due on __Friday, February 24, 2023__ by __11:59 PM__ ITH time. 
* You may use your course materials and any literature resources (as well as the internet) to formulate your solutions.
* You may work in teams. All codes must be stored in a GitHub repository, and the link to that repository (and team information) must be entered into the [teaching team spreadsheet on box](https://cornell.box.com/s/qd5nzzxlwikwxf515s3oe76yu8eb8uhu) by the deadline. 
