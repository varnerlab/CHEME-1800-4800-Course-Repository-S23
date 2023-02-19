## Lab-3b: Computing the Runtime of Bubble and Insertion Sort

### Objective
The objective of `lab-3b` is to give you practice with understanding and analyzing simple sorting algorithms [Bubble sort](https://en.wikipedia.org/wiki/Bubble_sort) and [Insertion sort](https://en.wikipedia.org/wiki/Insertion_sort). In `lab-3b`, you will create lists of random numbers of different lengths and compute how long it takes to sort these lists using different sorting algorithms using the [BenchmarkTools](https://github.com/JuliaCI/BenchmarkTools.jl) package.

#### Algorithms
* [Bubble sort](https://www.youtube.com/watch?v=uJLwnsLn0_Q) performs a series of pairwise comparisons to sort a random list into ascending order. The worst-case time complexity of [Bubble sort](https://www.youtube.com/watch?v=uJLwnsLn0_Q) is $\mathcal{O}(n^2)$, where $n$ is the number of elements in the unsorted list. 
* [Insertion sort](https://www.youtube.com/watch?v=nKzEJWbkPbQ) performs shift operations to sort a random list into ascending order. The worst-case time complexity of [Insertion sort](https://www.youtube.com/watch?v=nKzEJWbkPbQ) is $\mathcal{O}(n^2)$, where $n$ is the number of elements in the unsorted list.

### Tasks
1. Break up into groups and explain/analyze the [Bubble sort](https://www.youtube.com/watch?v=uJLwnsLn0_Q) implementation.
1. Sort a set of random vectors of length `l = 2, 4, 8, 16, 32, 64, 128, 256` created using the `rand()` command. Record the mean and standard deviation of the execution time for the `bubble_sort` algorithm as a function of the length of the array using the [BenchmarkTools](https://github.com/JuliaCI/BenchmarkTools.jl) package. 
