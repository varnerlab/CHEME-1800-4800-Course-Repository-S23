## Lab-3b: Computing the Runtime of Bubble and Insertion Sort

### Objective
The objective of `lab-3b` is to give you practice with understanding and analyzing simple sorting algorithms [Bubble sort](https://en.wikipedia.org/wiki/Bubble_sort) and [Insertion sort](https://en.wikipedia.org/wiki/Insertion_sort).

In `lab-3b`, you will create lists of random numbers of different lengths and compute how long it takes to sort these lists using different sorting algorithms using the [BenchmarkTools](https://github.com/JuliaCI/BenchmarkTools.jl) package.

### Tasks
1. Sort a set of random vectors of length `l = 2, 4, 8, 16, 32, 64, 128, 256` created using the `rand()` command. Record the mean and standard deviation of the execution time for the `bubble_sort` algorithm as a function of the length of the array using the [BenchmarkTools](https://github.com/JuliaCI/BenchmarkTools.jl) package. 
1. Sort a set of random vectors of length `l = 2, 4, 8, 16, 32, 64, 128, 256` created using the `rand()` command. Record the mean and standard deviation of the execution time for the `insertion_sort` algorithm as a function of the length of the array using the [BenchmarkTools](https://github.com/JuliaCI/BenchmarkTools.jl) package. 
