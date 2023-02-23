## Problem Set 2: Recursive Chemical Formula Parser
Chemical reaction databases, e.g., [The KEGG: Kyoto Encyclopedia of Genes and Genomes](https://www.kegg.jp), are ubiquitous on the web.  In Problem Set 2, we will develop a program to compute the molecular composition of chemical compound strings such as `C6H12O6`, which are stored in the [KEGG database](https://www.kegg.jp).

### Tasks
1. Implement the `read_compounds_file` method in `Files.jl`. This function is responsible for loading and processing the records in the `Compounds.data` file.
The `read_compounds_file` should return a `Dict` with the compound names as keys and instances of the `MyChemicalCompoundModel` type as the value. Make sure to finish the `docstrings` for each function. More information on `docstrings` can be found at [Julia docstrings](https://docs.julialang.org/en/v1/manual/documentation/#Writing-Documentation)
1. Design and implement the `recursive_compound_parser` and `_recursive_compound_parser` functions in `Parser.jl`. These functions compute the composition dictionary for each instance of the `MyChemicalCompoundModel` type. For example, the compound string `C6H12O6` would generate a `Dict` with `C` => 6, `H` => 12, and `O` => 6 as its entries. 
1. Finish the implementation of the `Include.jl` file. 
1. To test your program implementation, execute the `Submit.jl` file.

### Assessment
* The teaching team will execute the `Submit.jl` script with your program functions. 
* The teaching team will evaluate style components: variable and function names should be informative, and functions should have informative docstrings. 
* The teaching team will evaluate whether the submission guidelines were followed.

### Rules, deadlines, and submission guidelines
* Problem Set 2 is due on __Friday, March 10, 2023__ by __11:59 PM__ ITH time. 
* You may use your course materials and any literature resources (as well as the internet) to formulate your solutions.
* You may work in teams. All codes must be stored in a GitHub repository, and the link to that repository (and team information) must be entered into the [teaching team spreadsheet on box](https://cornell.box.com/s/qd5nzzxlwikwxf515s3oe76yu8eb8uhu) by the deadline. 

#### Notes on the GitHub repository
* Each student on the problem set team must be a collaborator on the problem set GitHub repository. 
* The problem set repository should include a `README.md` file that describes the problem set, lists the team members, and the contributions of each team to completing the problem set.

For help with setting up a GitHub repository: [How to set up a GitHub repository](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-new-repository). For help with GitHub markdown: [Help with markdown syntax for your README.md file](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax)
