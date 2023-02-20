## Recursion
Recursion is a programming technique in which a function calls itself with a modified version of its input. This allows the function to repeat a process on a smaller scale, and the results of these smaller-scale processes can be combined to solve the original problem.

We illustrate recursion concepts by looking at different implementations of the computation of the `fibonacci` sequence in the `fibonacci.jl` file. 
* The `fibonacci_recursive(n::Int64)::Int64` function is a vanilla recursive function that computes $F_{n}$ for a given $n$. 
* The `fibonacci!(n::Int64, series::Dict{Int64, Int64})::Nothing` function is a mutating recursive function that computes sequence $F_{0},\dots, F_{n}$ for a given $n$. The recursive sequence is stored in the `series::Dict{Int64, Int64}` argument. 
* The `memoization_fibonacci!(n::Int64, series::Dict{Int64, Int64})::Nothing` function is a mutating recursive function that uses memoization to speed up the computation of the sequence $F_{0},\dots, F_{n}$ for a given $n$. The recursive sequence is stored in the `series::Dict{Int64, Int64}` argument.

