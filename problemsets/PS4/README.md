## Problem Set 4: Principle component analysis (PCA) of synthetic patient data
Principal Component Analysis (PCA) is a statistical technique that reduces the dimensionality of a dataset while retaining as much of its variation as possible. PCA transforms the original dataset into a new set of uncorrelated variables called principal components, ranked by importance. 

* Principal components are the directions in which the data varies the most. Principle components are the eigenvectors of the 
[covariance matrix](https://en.wikipedia.org/wiki/Covariance_matrix) of the data.  The principal components are obtained from columns of the matrix $\mathbf{U}$, computed using [Singular Value Decomposition (SVD)](https://en.wikipedia.org/wiki/Singular_value_decomposition). The variance that each component explains is obtained from the singular values in $\mathbf{\Sigma}$.

### Data
The `Synthetic-Numerical-CoV-10K-Fibrinolysis-NoMLabels.csv` dataset holds clinical measurements for basal (V1), first-trimester (V2) and third-trimester (V3) synthetic patients (1000 each, for a total of 30k patient records).

### Prerequisites
* Problem set 4 requires that the [CSV.jl](https://github.com/JuliaData/CSV.jl) and [DataFrames.jl](https://github.com/JuliaData/DataFrames.jl) packages be installed using the [Julia package manager included in the standard library](https://docs.julialang.org/en/v1/stdlib/Pkg/).

### Tasks
1. Start the Julia in the `PS4` folder with the `--project=.` argument
1. Install required packages using the [Julia package manager](https://docs.julialang.org/en/v1/stdlib/Pkg/).
1. __Duration__ (05 minutes): Break up into teams and familiarize yourself with the files and functions in `PS4`.
1. __Duration__ (10 minutes): Implement the `_mean` function in the `Compute.jl` file. The `_mean` function computes the [arithmetic mean](https://en.wikipedia.org/wiki/Mean) $\mu$ of a data vector.
1. __Duration__ (10 minutes): Implement the `_std` function in the `Compute.jl` file. The `_std` function computes the [unbiased sample standard deviation](https://en.wikipedia.org/wiki/Unbiased_estimation_of_standard_deviation) $\sigma$ of a data vector.
1. __Duration__ (25 minutes): Compute the first two principle components using [Singular Value Decomposition (SVD)](https://en.wikipedia.org/wiki/Singular_value_decomposition) of the transpose of the standardized data array in the `Submit.jl` file.

### Assessment
* The teaching team will execute the `Submit.jl` script with your program functions. 
* The teaching team will evaluate style components: variable and function names should be informative, and functions should have informative docstrings. 
* The teaching team will evaluate whether the submission guidelines were followed.

### Rules, deadlines, and submission guidelines
* Problem Set 4 is due on __Saturday, March 25, 2023__ by __11:59 AM__ ITH time. 
* You may use your course materials and any literature resources (as well as the internet) to formulate your solutions.
* You may work in teams. All codes must be stored in a GitHub repository, and the link to that repository (and team information) must be entered into the [teaching team spreadsheet on box](https://cornell.box.com/s/md7wi4igt74d19ffc3gz11xx5kd0gwih) by the deadline. 

#### Notes on the GitHub repository
* Each student on the problem set team must be a collaborator on the problem set GitHub repository. 
* The problem set repository should include a `README.md` file that describes the problem set, lists the team members, and the contributions of each team to completing the problem set.

For help with setting up a GitHub repository: [How to set up a GitHub repository](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-new-repository). For help with GitHub markdown: [Help with markdown syntax for your README.md file](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax)