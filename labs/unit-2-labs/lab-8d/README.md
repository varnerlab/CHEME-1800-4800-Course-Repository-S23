## Lab 8d: Structural Decomposition Using Singular Value Decomposition
Fill me in.

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

where $R_{\mathbf{A}}$ is the rank of matrix $\mathbf{A}$ and:

$$\mathbf{F}_{i} = \left(\mathbf{u}_{i}\otimes\mathbf{v}_{i}\right)$$

is an outer product between the left and right singular vectors.



#### Additional resources
* [MIT 18.065 Matrix Methods in Data Analysis, Signal Processing and Machine Learning, Spring 2018](https://www.youtube.com/watch?v=rYz83XPxiZo)