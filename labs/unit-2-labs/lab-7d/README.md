## Lab 7d: Development of an iterative linear solver
The objective of `lab-7d` is to familarize students with the development of iterative linear algebraic equation solvers and the solution of a typical chemical engineering application, namely, steady state species mole balances. 

### Background
Iterative methods work by improving an initial guess of the solution until a desired level of accuracy is achieved. Commonly used iterative methods include Jacobi's method and the Gauss-Seidel method.

#### Jacobi's method
Jacobi's method __batch updates__ the estimate of $x_{i}$ at the _end_ of each iteration. Let the estimate of the value of $x_{i}$ at iteration k be $\hat{x}_{i,k}$. Then, the solution estimate at the next iteration $\hat{x}_{i,k+1}$ is given by:

$$
\hat{x}_{i,k+1}=\frac{1}{a_{ii}}\bigl(b_{i}-\sum_{j=1,i}^{n}a_{ij}\hat{x}_{j,k}\bigr)\qquad{i=1,2,\cdots,n}
$$

In the Jacobi method, the estimate for all variables from the previous iteration is used, and we wait to update the solution until we have processed all $i=1,2,\cdots,n$ equations. We continue to iterate until the change in the estimated solution does not change, i.e., the _distance_ between the solution estimated at $k$ and $k+1$ is below some specified tolerance. 

#### Gauss-Seidel method
The Gauss-Seidel method __live updates__ the best estimate of $\hat{x}_{i}$ _during_ the processing of equations $i=1,\cdots,n$. The Gauss-Seidel update procedure generally leads to better convergence properties than the Jacobi method. Let the estimate for variable $i$ at iteration $k$ be $\hat{x}_{i,k}$. Then, the solution estimate at the next iteration $\hat{x}_{i,k+1}$ is given by:

$$
\hat{x}_{i,k+1}=\frac{1}{a_{ii}}\bigl(b_{i}-\sum_{j=1}^{i-1}a_{ij}\hat{x}_{j,k+1}-\sum_{j=i+1}^{n}a_{ij}\hat{x}_{j,k}\bigr)\qquad{i=1,2,\cdots,n}
$$

We continue to iterate until the change in the estimated solution does not change, i.e., the _distance_ between the solution estimated at $k$ and $k+1$ is below some specified tolerance. 

### Prerequisites
* No external packages are required for `lab-7d`.

### Tasks
Fill me in.
