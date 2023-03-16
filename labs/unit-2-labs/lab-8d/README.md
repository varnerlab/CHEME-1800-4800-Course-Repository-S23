## Lab 8d: Structural Decomposition Using Singular Value Decomposition
The objective of `lab-8d` is to familiarize students with computing the [Singular value decomposition (SVD)](https://en.wikipedia.org/wiki/Singular_value_decomposition) and analyzing the properties of the resulting matrices. In particular, we'll use SVD to decompose and analyze two stoichiometric arrays. 

### Background
[Singular value decomposition (SVD)](https://en.wikipedia.org/wiki/Singular_value_decomposition) is a powerful tool used in many applications, such as image and data compression, signal processing, and machine learning, that factors a matrix into a canonical form composed of an orthogonal matrix, a diagonal matrix, and another orthogonal matrix.

Let the matrix $\mathbf{A}\in\mathbb{R}^{m\times{n}}$. The singular value decomposition of the matrix $\mathbf{A}$ is given by:


$$
\mathbf{A} = \mathbf{U}\mathbf{\Sigma}\mathbf{V}^{T}
$$

where $\mathbf{U}\in\mathbb{R}^{n\times{n}}$ and $\mathbf{V}\in\mathbb{R}^{m\times{m}}$ are orthogonal matrices and $\mathbf{\Sigma}\in\mathbb{R}^{n\times{m}}$ is a diagonal matrix containing the singular values $\sigma_{i}=\Sigma_{ii}$ along the main diagonal. The columns of $\mathbf{U}$ are called left-singular vectors, while the columns of $\mathbf{V}$ are called right-singular vectors. Singular vectors have a unique property: unlike eigenvectors, left- and right-singular vectors are linearly independent and orthogonal. Then, the matrix $\mathbf{A}\in\mathbb{R}^{m\times{n}}$ can be written as:

$$
\mathbf{A} = \sum_{i=1}^{R_{\mathbf{A}}}\sigma_{i}\left(\mathbf{u}_{i}\otimes\mathbf{v}_{i}\right)
$$

where $R_{\mathbf{A}}$ is the rank of matrix $\mathbf{A}$ and the mode $\mathbf{M}_{i}$:

$$\mathbf{M}_{i} = \left(\mathbf{u}_{i}\otimes\mathbf{v}_{i}\right)$$

is the outer product between the left and right singular vectors.

### Prerequisites
There are no external packages required for `lab-8d`.

### Tasks
1. Start the Julia in the `lab-8d` folder with the `--project=.` argument
1. __Duration__ (05 minutes): Break up into teams and familiarize yourself with the function calls in the `runme-case-1.jl` and `runme-case-2.jl` files in `lab-8d`. 
1. __Duration__ (10 minutes): Implement the $\otimes$ function in the `Compute.jl` file. The $\otimes$ function computes the `outer product`; see [the course notes](https://varnerlab.github.io/CHEME-1800-Computing-Book/unit-2-data/vectors-matricies-nla.html#defn-vector-vector-multiplication-op).
1. __Duration__ (15 minutes): Implement the `modes` function in the `Modes.jl` file. The `modes` computes the modes $\mathbf{M}_{i}$:

$$\mathbf{M}_{i} = \sigma_{i}\left(\mathbf{u}_{i}\otimes\mathbf{v}_{i}\right)\qquad{i=1,2,\dots,R}$$

### Cases
1. __Duration__ (10 minutes): Analyze the stoichiometric matrix built from `Test.net`. Update the `runme-case-1.jl` script to call the `important` function to estimate the most important species and reaction in the `Test` network.
1. __Duration__ (10 minutes): Analyze the stoichiometric matrix built from `RBC.net`. The `RBC` network is a model of metabolism in a [Human Red Blood Cell](https://pubmed.ncbi.nlm.nih.gov/2630803/). Update the `runme-case-2.jl` script to call the `important` function to estimate the most important species and reaction in the `RBC` network.


#### Additional resources
* [MIT 18.065 Matrix Methods in Data Analysis, Signal Processing and Machine Learning, Spring 2018](https://www.youtube.com/watch?v=rYz83XPxiZo)
* [Joshi A, Palsson BO. Metabolic dynamics in the human red cell. Part I--A comprehensive kinetic model. J Theor Biol. 1989 Dec 19;141(4):515-28. doi: 10.1016/s0022-5193(89)80233-4. Erratum in: J Theor Biol 1991 Sep 21;152(2):285. PMID: 2630803.](https://pubmed.ncbi.nlm.nih.gov/2630803/)
