## Problem Set 3: Iterative Solution of Species Concentration Balances

Set up a system of linear algebraic equations whose solution describes the concentration as a function of time for a compound $A$ that undergoes first-order decay in a well-mixed batch reactor. The concentration balance for compound $A$ is given by:

$$
\frac{dC_{A}}{dt} = -\kappa{C_{A}}
$$

where $\kappa$ denotes the first-order rate constant governing the rate of decay (units: 1/time), and the initial condition is given by $C_{A,0}$. Discretize the concentration balance using a [forward finite difference](https://en.wikipedia.org/wiki/Finite_difference) approximation of the time derivative:

$$
C_{A,j+1} = C_{A,j} - h\kappa{C_{A,j}}\qquad{j=0,2,T}
$$

where $h$ denotes the time step-size, and $C_{A,\star}$ denotes the concentration of $A$ at time-step $\star$. Starting with $j=0$, construct a $T\times{T}$ matrix where each row is a time-step and each column is a concentration value:

$$
\begin{pmatrix}
1 & 0 & \dots & 0 \\
(\kappa{h} - 1) & 1 & \dots & 0 \\
\vdots & \vdots & \vdots & \vdots \\
0 & \dots & (\kappa{h} - 1) & 1
\end{pmatrix}
\begin{pmatrix}
C_{A,1} \\
C_{A,2} \\
\vdots \\
C_{A,T}
\end{pmatrix} = 
\begin{pmatrix}
C_{A,0}\left(1-h\kappa\right) \\
0 \\
\vdots \\
0 
\end{pmatrix}
$$

Thus, the problem of estimating the concentration as a function of time becomes the solution of the system of linear algebraic
equations:

$$
\mathbf{A}\mathbf{x} = \mathbf{b}
$$

### Tasks
1. Implement the functions `_build_right_handside_vector` and `_build_system_matrix` in `Factory.jl`. 
    1. `_build_right_handside_vector` is an internal function (not meant to be called by the user directly) that builds the right-hand side vector $\mathbf{b}\in\mathbb{R}^{T\times{1}}$ given system parameters.
    1. `_build_system_matrix` is an internal function (not meant to be called by the user directly) that builds the system matrix $\mathbf{A}\in\mathbb{R}^{T\times{T}}$ given the system parameters.
1. Modify the `solve` method in `Solvers.jl` to be compatible with the `MyChemicalDecayModel` type.
1. Solve the system of equations using `Jacobi` and `Gauss-Seidel` iteration for the concentration of $A$ at the discrete time-points $C_{A,1},\dots, C_{A, T}$ for the system parameters:
    1. Case 1: Let $C_{A,0} = 10~\text{mmol/L}$, $\kappa = 1.0~\text{hr}^{-1}$, $h = 0.1~\text{hr}$ and $T_{f} = 20.0~\text{hr}$.
    1. Case 2: Let $C_{A,0} = 10~\text{mmol/L}$, $\kappa = 10.0~\text{hr}^{-1}$, $h = 0.1~\text{hr}$ and $T_{f} = 20.0~\text{hr}$.
    1. Case 3: Let $C_{A,0} = 10~\text{mmol/L}$, $\kappa = 100.0~\text{hr}^{-1}$, $h = 0.1~\text{hr}$ and $T_{f} = 20.0~\text{hr}$.
1. Make a [markdown table](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet) in your `README.md` file. Each column of the table will be a case, while the rows will be:    
    1. Whether $\det(\mathbf{A})\neq{0}$, 
    1. whether the system matrix $\mathbf{A}$ is diagonally dominant, 
    1. whether the `Jacobi` solver found a solution,
    1. whether the `Gauss-Seidel` found a solution
    1. The error between the solution found by the `Jacobi` solver and by calculating $\mathbf{A}^{-1}$ using the `inv` command. The error can be calculated using the [norm function](https://docs.julialang.org/en/v1/stdlib/LinearAlgebra/#LinearAlgebra.norm).
    1. The error between the solution found by the `Gauss-Seidel` solver and the solution found by calculating $\mathbf{A}^{-1}$ using the `inv` command. The error can be calculated using the [norm function](https://docs.julialang.org/en/v1/stdlib/LinearAlgebra/#LinearAlgebra.norm).