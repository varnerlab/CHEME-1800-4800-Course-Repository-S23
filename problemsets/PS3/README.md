## Problem Set 3: Iterative Solution of a Species Concentration Balance

Set up a system of linear algebraic equations whose solution describes concentration as a function of time for a compound $A$ that undergoes first-order decay in a constant volume, isothermal well-mixed batch reactor (no flow in or out). The concentration balance for compound $A$ is given by:

$$
\frac{dC_{A}}{dt} = -\kappa{C_{A}}
$$

where $\kappa$ denotes the first-order rate constant governing the rate of decay (units: 1/time), where the initial condition is given by $C_{A,0}$. Discretize the concentration balance using a [forward finite difference](https://en.wikipedia.org/wiki/Finite_difference) approximation of the time derivative:

$$
C_{A,j+1} = C_{A,j} - h\kappa{C_{A,j}}\qquad{j=0,2,N}
$$

where $h$ denotes the time step-size, $C_{A,\star}$ denotes the concentration of $A$ at time-step $\star$ and $N$ denotes the _number_ of time steps. Starting with $j=0$, construct a $N\times{N}$ matrix where each row is a time-step and each column is a concentration value:

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
C_{A,N}
\end{pmatrix} = 
\begin{pmatrix}
C_{A,0}\left(1-h\kappa\right) \\
0 \\
\vdots \\
0 
\end{pmatrix}
$$

Thus, the problem of estimating the concentration of compound $A$ as a function of time reduces to the solution of a system of linear algebraic equations of the form:

$$
\mathbf{A}\mathbf{x} = \mathbf{b}
$$

### Tasks
1. Implement the functions `_build_right_handside_vector` and `_build_system_matrix` in `Factory.jl`. 
    1. `_build_right_handside_vector` is an internal function (not meant to be called by the user directly) that builds the right-hand side vector $\mathbf{b}\in\mathbb{R}^{T\times{1}}$ given system parameters.
    1. `_build_system_matrix` is an internal function (not meant to be called by the user directly) that builds the system matrix $\mathbf{A}\in\mathbb{R}^{T\times{T}}$ given the system parameters.
1. Modify the `solve` method in `Solvers.jl` to be compatible with the `MyChemicalDecayModel` type.
1. Solve the system of equations using `Jacobi` and `Gauss-Seidel` iteration for the concentration of $A$ at the discrete time-points $C_{A,1},\dots, C_{A, N}$ for the parameters:
    1. Case 1: Let $C_{A,0} = 10~\text{mmol/L}$, $\kappa = 1.0~\text{hr}^{-1}$, $h = 0.1~\text{hr}$ and the final time $T_{f} = 20.0~\text{hr}$.
    1. Case 2: Let $C_{A,0} = 10~\text{mmol/L}$, $\kappa = 10.0~\text{hr}^{-1}$, $h = 0.1~\text{hr}$ and the final time $T_{f} = 20.0~\text{hr}$.
    1. Case 3: Let $C_{A,0} = 10~\text{mmol/L}$, $\kappa = 100.0~\text{hr}^{-1}$, $h = 0.1~\text{hr}$ and the final time $T_{f} = 20.0~\text{hr}$.
1. Make a results [markdown table](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet) in your `README.md` file. Each column of the table will be a case, while the rows will be:    
    1. Whether $\det(\mathbf{A})\neq{0}$
    1. whether the system matrix $\mathbf{A}$ is diagonally dominant 
    1. whether the `Jacobi` solver found a solution
    1. whether the `Gauss-Seidel` found a solution
    1. The error between the solution found by the `Jacobi` solver and by calculating $\mathbf{A}^{-1}$ using the `inv` command. The error can be calculated using the [norm function](https://docs.julialang.org/en/v1/stdlib/LinearAlgebra/#LinearAlgebra.norm).
    1. The error between the solution found by the `Gauss-Seidel` solver and by calculating $\mathbf{A}^{-1}$ using the `inv` command. The error can be calculated using the [norm function](https://docs.julialang.org/en/v1/stdlib/LinearAlgebra/#LinearAlgebra.norm).

### Potentially useful stuff
The number of time steps that we need to consider is:

$$
N = \frac{T_{f} - T_{\circ}}{h}
$$

where $h$ denotes the step size, $T_{f}$ denotes the final time, and $T_{\circ}$ denotes the initial time (in this case $T_{\circ} = 0$).

### Assessment
* The teaching team will execute the `Submit.jl` script with your program functions. 
* The teaching team will verify the entries in your `README.md` results table. 
* The teaching team will evaluate style components: variable and function names should be informative, and functions should have informative docstrings. 
* The teaching team will evaluate whether the submission guidelines were followed.

### Rules, deadlines, and submission guidelines
* Problem Set 3 is due on __Saturday, March 18, 2023__ by __11:59 PM__ ITH time. 
* You may use your course materials and any literature resources (as well as the internet) to formulate your solutions.
* You may work in teams. All codes must be stored in a GitHub repository, and the link to that repository (and team information) must be entered into the [teaching team spreadsheet on box](https://cornell.box.com/s/hzioytetv3eb1trs4uoymo5kynbj13so) by the deadline. 

#### Notes on the GitHub repository
* Each student on the problem set team must be a collaborator on the problem set GitHub repository. 
* The problem set repository should include a `README.md` file that describes the problem set, lists the team members, and the contributions of each team to completing the problem set.

For help with setting up a GitHub repository: [How to set up a GitHub repository](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-new-repository). For help with GitHub markdown: [Help with markdown syntax for your README.md file](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax)