## Problem Set 3: Iterative Solution of Species Mole Balances

Setup a system of linear algebraic equations whose solution describes the concentration as a function of time for a compound $A$ that undergoes first-order decay in a well-mixed batch reactor. The concentration balance for compound $A$ is given by:

$$
\frac{dC_{A}}{dt} = -\kappa{C_{A}}
$$

where $\kappa$ denotes the first-order rate constant governing the rate of decay (units: 1/time), and the initial condition is given by $C_{A,0}$. Let $C_{A,0} = 10~\text{mmol/L}$, $\kappa = 0.5~\text{hr}^{-1}$ and $h = 0.1$. 

### Tasks

Discretize the concentration balance using a [forward finte difference](https://en.wikipedia.org/wiki/Finite_difference) approximation of the time derivatrive:

$$
C_{A,j+1} = C_{A,j} - h\kappa{C_{A,j}}\qquad{j=0,2,T}
$$

where $h$ denotes the time step-size, and $C_{A,\star}$ denotes the concentration of $A$ at time-step $\star$. Starting with $j=0$, construct a $T\times{T}$ matrix where each rows is a seperate time-step:

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


### Assessment
* The teaching team will execute the `Submit.jl` script with your program functions. 
* The teaching team will evaluate style components: variable and function names should be informative, and functions should have informative docstrings. 
* The teaching team will evaluate whether the submission guidelines were followed.

### Rules, deadlines, and submission guidelines
* Problem Set 3 is due on __Saturday, March 18, 2023__ by __11:59 AM__ ITH time. 
* You may use your course materials and any literature resources (as well as the internet) to formulate your solutions.
* You may work in teams. All codes must be stored in a GitHub repository, and the link to that repository (and team information) must be entered into the [teaching team spreadsheet on box](https://cornell.box.com/s/hzioytetv3eb1trs4uoymo5kynbj13so) by the deadline. 

#### Notes on the GitHub repository
* Each student on the problem set team must be a collaborator on the problem set GitHub repository. 
* The problem set repository should include a `README.md` file that describes the problem set, lists the team members, and the contributions of each team to completing the problem set.

For help with setting up a GitHub repository: [How to set up a GitHub repository](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-new-repository). For help with GitHub markdown: [Help with markdown syntax for your README.md file](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax)