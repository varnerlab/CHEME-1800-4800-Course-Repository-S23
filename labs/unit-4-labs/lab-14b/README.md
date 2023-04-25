## Lab 14b: Simulating the St. Petersburg Paradox
The objective of `Lab-14b` is to familiarize students with decisions under uncertainty, particularly with [Monte-Carlo simulation](https://en.wikipedia.org/wiki/Monte_Carlo_method) of uncertain situations and games. 

### Background
The [St. Petersburg Paradox](https://en.wikipedia.org/wiki/St._Petersburg_paradox) is a paradox involving flipping a coin where the expected payoff of the game approaches infinity but seems to be worth only a minimal amount to the participants.  A casino offers a single-player game in which a fair coin is tossed multiple times. The rules of the game:

* The initial stake (pot) begins at $2 and is doubled every time a head (H) appears.
* The first time a tail (T) appears, the game ends, and the player wins the current stake.

How much would you be willing to pay to enter this game?

### Prerequisites
* `Lab-14b` requires the [Distributions.jl](https://github.com/JuliaStats/Distributions.jl) and the [DataStructures.jl](https://github.com/JuliaCollections/DataStructures.jl) packages.
* __Note__: the _advanced task_ requires plotting. Thus, we must install the [Plots.jl](https://docs.juliaplots.org/stable/) and [Colors.jl](https://github.com/JuliaGraphics/Colors.jl) packages. However, if these give errors during installation, skip installing these packages, and comment out the `using XXX` statements in `Include.jl`.

### Tasks
1. Start the Julia in the `Lab-14b` folder with the `--project=.` argument
1. Install required packages using the [Julia package manager](https://docs.julialang.org/en/v1/stdlib/Pkg/).
1. Break up into groups and design the game loop in the `runme.jl` script. The results for each flip should be held in the `MyCoinFlipGameModel` type. The results of each trial (sequence of flips until we hit `Tails`) should be stored in a `Stack`. The last entry in the `Stack` should be the `Tails` result.