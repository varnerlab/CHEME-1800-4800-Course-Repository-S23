## Problem Set 6: Computing the Maximum Theoretical Growth Rate of _E.coli_

[_E.coli_ is a widely used industrial bacteria](https://en.wikipedia.org/wiki/Protein_production) for producing a wide variety of commercial products. The biochemical reaction network used by _E.coli_ has been widely studied because of its commercial relevance. In this problem set, let's explore an _E. coli_ metabolic reaction network constructed by [Palsson and coworkers](https://pubmed.ncbi.nlm.nih.gov/26443778/). In particular, let's compute the maximum growth rate of an _E.coli_ cell.

The _E.coli_ model is contained in the `e_coli_core.json` file downloaded from the [BiGG models database](http://bigg.ucsd.edu/models/e_coli_core) and stored in the `data` subdirectory.

### Prerequisites
* `PS6` requires that the [JuMP](https://jump.dev/JuMP.jl/stable/), [GLPK](https://github.com/jump-dev/GLPK.jl) and [JSON](https://github.com/JuliaIO/JSON.jl) packages be installed using the [Julia package manager included in the standard library](https://docs.julialang.org/en/v1/stdlib/Pkg/).

### Tasks
1. Complete the implementation of the `build` function in `Factory.jl`
    1. Finish implementing the `_build_metabolite_id_array` function in `Factory.jl`. The `_build_metabolite_id_array` function returns the list of metabolite id's in the _E.coli_ model.
    1. Finish implementing the `_build_reaction_id_array` function in `Factory.jl`. The `_build_reaction_id_array` function returns the list of reaction id's in the _E.coli_ model.
    1. Finish implementing the `_build_bounds_array` function in `Factory.jl`. The `_build_bounds_array` function returns the $|\mathcal{R}|\times{2}$ reaction bounds array, where the first column holds the lower bound, second column holds the upper bound. Use the bounds in the `e_coli_core.json` file as the default values. We can change them later if needed.
    1. Finish implementing the `_build_stoichiometric_matrix` function in `Factory.jl`. The `_build_stoichiometric_matrix` function returns the $|\mathcal{M}|\times|\mathcal{R}|$ stoichiometric matrix $\mathbf{S}$.
1. In `Submit.jl` build a model dictionary holding information from the `e_coli_core.json` file by calling the `readreactionfile` function in `Files.jl`
1. In `Submit.jl` build an instance of the `MyStoichiometricNetworkModel` type by calling your `build` method in `Factory.jl`
1. In `Submit.jl` call the `compute_maximum_growth_rate` function and compute the maximum possible cellular growth rate. The id for cellular growth is `BIOMASS_Ecoli_core_w_GAM`. What growth rate value did you obtain?

### Assessment
* The teaching team will execute the `Submit.jl` script with your program functions. 
* The teaching team will evaluate style components: variable and function names should be informative, and functions should have informative docstrings. 
* The teaching team will evaluate whether the submission guidelines were followed.

### Rules, deadlines, and submission guidelines
* Problem Set 6 is due on __Friday, April 14, 2023__ by __11:59 AM__ ITH time. 
* You may use your course materials and any literature resources (as well as the internet) to formulate your solutions.
* You may work in teams. All codes must be stored in a GitHub repository, and the link to that repository (and team information) must be entered into the [teaching team spreadsheet on box](https://cornell.box.com/s/qaaismzp18ohahqctvdeedeludl2kybl) by the deadline. 

#### Notes on the GitHub repository
* Each student on the problem set team must be a collaborator on the problem set GitHub repository. 
* The problem set repository should include a `README.md` file that describes the problem set, lists the team members, and the contributions of each team member to completing the problem set.

For help with setting up a GitHub repository: [How to set up a GitHub repository](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-new-repository). For help with GitHub markdown: [Help with markdown syntax for your README.md file](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax)

#### Additional resources
* [Orth JD, Fleming RM, Palsson BØ. Reconstruction and Use of Microbial Metabolic Networks: the Core _Escherichia coli_ Metabolic Model as an Educational Guide. EcoSal Plus. 2010 Sep;4(1). doi: 10.1128/ecosalplus.10.2.1. PMID: 26443778](https://pubmed.ncbi.nlm.nih.gov/26443778/)