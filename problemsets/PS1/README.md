## Problem Set 1: Introduction to DNA Cryptography 
DNA cryptography is a form of cryptography that uses the principles of genetics and biochemistry to store and transmit information. It involves encoding a digital message into the DNA molecule, synthesizing the encoded DNA, and decoding the information using DNA sequencing technology. 

In DNA cryptography, each character is translated into the four chemical bases (A, C, G, and T) that make up the DNA molecule. The mapping between characters and a unique three-base pair codon is encoded in an encryption key. The DNA encryption key used in this study was taken from:

* [Clelland CT, Risca V, Bancroft C. Hiding messages in DNA microdots. Nature. 1999 Jun 10;399(6736):533-4. doi: 10.1038/21092. PMID: 10376592.](https://pubmed.ncbi.nlm.nih.gov/10376592/)

### Tasks
1. Implement the `encrypt` and `decrypt` functions in the `CHEME-1800-ProblemSet-1-Lib.jl` file starting from the function skeletons provided. Make sure to finish the `docstrings` for each function. More information can be found at [Julia docstrings](https://docs.julialang.org/en/v1/manual/documentation/#Writing-Documentation)
1. Implement a `build` function in the `Factory.jl` file that builds and initializes an instance of the `DNAEncryptionKey` custom type (encoded in the `Types.jl` file).
1. Create a file `Test.jl` in the root PS1 directory (same as `Include.jl` and `Submit.jl`). In the `Test. jl` file, call your `encrypt` and `decrypt` functions with plain text to check that your functions are working correctly. Don't forget to include `Include.jl` at the top of `Test.jl`. 

### Assessment
* The teaching team will execute the `Submit.jl` script with your `encrypt` and `decrypt` functions. The text into the `encrypt` function should equal the text out of the `decrypt` function (sans the uppercase transformation).
* The teaching team will evaluate style components: variable and function names should be informative, and functions should have informative docstrings. 
* The teaching team will evaluate whether the submission guidelines were followed.

### Rules, deadlines, and submission guidelines
* Problem Set 1 is due on __Friday, February 17, 2023__ by __11:59 PM__ ITH time. 
* You may use your course materials and any literature resources (as well as the internet) to formulate your solutions.
* You may work in teams. All codes must be stored in a GitHub repository, and the link to that repository (and team information) must be entered into the [teaching team spreadsheet on box](https://cornell.box.com/s/syi0tdjlrwc44tl5ecrejp6hw1lw3qbr) by the deadline. 

#### Notes on the GitHub repository
* Each student on the problem set team must be a collaborator on the problem set GitHub repository. 
* The problem set repository should include a `README.md` file that describes the problem set, lists the team members, and the contributions of each team to completing the problem set.


For help with setting up a GitHub repository: [How to set up a GitHub repository](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-new-repository). For help with GitHub markdown: [Help with markdown syntax for your README.md file](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax)







