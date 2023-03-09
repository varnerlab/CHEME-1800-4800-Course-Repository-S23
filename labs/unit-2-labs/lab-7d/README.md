## Lab 7d: Development of an iterative linear solver
The objective of `lab-7d` is to familiarize students with the development of iterative linear algebraic equation solvers and the solution of a typical chemical engineering application, namely, steady state species mole balances. 

### Background
Iterative methods work by improving an initial guess of the solution until a desired level of accuracy is achieved. Commonly used iterative methods include Jacobi's method and the Gauss-Seidel method.

#### Jacobi's method
Jacobi's method __batch updates__ the estimate of $x_{i}$ at the _end_ of each iteration $k$:

$$
\hat{x}_{i,k+1}=\frac{1}{a_{ii}}\bigl(b_{i}-\sum_{j=1,i}^{n}a_{ij}\hat{x}_{j,k}\bigr)\qquad{i=1,2,\cdots,n}
$$

In the Jacobi method, the estimate for all variables from the previous iteration is used, and we wait to update the solution until we have processed all $i=1,2,\cdots,n$ equations. We continue to iterate until the estimated solution stays the same.

#### Gauss-Seidel method
The Gauss-Seidel method __live updates__ the best estimate of $x_{i}$ _during_ the processing of equations $i=1,\cdots,n$:

$$
\hat{x}_{i,k+1}=\frac{1}{a_{ii}}\bigl(b_{i}-\sum_{j=1}^{i-1}a_{ij}\hat{x}_{j,k+1}-\sum_{j=i+1}^{n}a_{ij}\hat{x}_{j,k}\bigr)\qquad{i=1,2,\cdots,n}
$$

The Gauss-Seidel update procedure generally leads to better convergence properties than the Jacobi method. 

### Test case:
Consider a $3\times{3}$ `test system` with a system matrix $\mathbf{A}$:

$$
\mathbf{A} = \begin{bmatrix}
3.0 & -0.3 & -0.2 \\
0.1 & 7.0 & -0.3 \\
0.3 & -0.2 & 10.0 \\
\end{bmatrix}
$$

and right-hand side vector $\mathbf{b}$:

$$
\mathbf{b} = \begin{bmatrix}
7.85 \\
-19.3 \\
71.4 \\
\end{bmatrix}
$$

### Prerequisites
* The [IterativeSolvers.jl](https://github.com/JuliaLinearAlgebra/IterativeSolvers.jl) package must be installed using the [Julia package manager included in the standard library](https://docs.julialang.org/en/v1/stdlib/Pkg/).

### Tasks:
1. Start the Julia in the `lab-7d` folder with the `--project=.` argument
1. Install the [IterativeSolvers.jl](https://github.com/JuliaLinearAlgebra/IterativeSolvers.jl) package using `package mode`.
1. __Duration__ (05 minutes): Break up into teams and familiarize yourself with the files and functions in `lab-7d`. 
1. __Duration__ (10 minutes): Implement the `_gauss_seidel_iteration_solver` function by wrapping a call to the [gauss_seidel](https://iterativesolvers.julialinearalgebra.org/dev/linear_systems/stationary/#IterativeSolvers.gauss_seidel) function in the [IterativeSolvers.jl](https://github.com/JuliaLinearAlgebra/IterativeSolvers.jl) package. 
    . This is a `buy` versus `build` decision. We can use existing code or write it ourselves. This is why [Open Source Software](https://en.wikipedia.org/wiki/Open-source_software) is so __important!__

1. __Duration__ (10 minutes): Use the `Jacobi method` to solve the `test system`. 
    1. Should we expect a solution to exist? check: compute `det(A)`.
    1. How can we tell if we have a good solution?

1. __Duration__ (10 minutes): Use the `Gauss-Seidel method` to solve the `test system`. Do we get the same answer as the `Jacobi method`?

1. __Pathological case__ (05 minutes): Solve a random $3\times{3}$ system using either the `Jacobi` or `Gauss-Seidel` methods. Generate the ramdom system using the call `A = rand(3,3)` and `b = rand(3)`. 
	1. Before solving, check for existence by computing `det(A)`. Should this system have a solution?