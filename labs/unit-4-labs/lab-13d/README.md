## Lab 13d: Future price prediction using a Binomial Lattice Model
The objective of `Lab-13d` is to familiarize students with the application of simple probability mass functions to predict future uncertain quantities such as commodity prices, interest rates, etc. 

<img src="./figs/Fig-Binomial-Lattice-Schematic.png" style="margin:auto; width:30%"/>

### Background
A binomial lattice model assumes that each discrete time increment, the state of the system, e.g., the share price of equity, the spot rate, etc., can either increase by a factor $u$ with probability $p$ or decrease by a factor $d$ with probability $(1-p)$. Different models can be developed for the specific values of the tuple $(u,d,p)$. One particular model is the Cox, Ross, and Rubinstein (CRR) model:

* [Cox, J. C.; Ross, S. A.; Rubinstein, M. (1979). "Option pricing: A simplified approach". Journal of Financial Economics. 7 (3): 229. CiteSeerX 10.1.1.379.7582. doi:10.1016/0304-405X(79)90015-1](https://www.sciencedirect.com/science/article/pii/0304405X79900151?via%3Dihub)
