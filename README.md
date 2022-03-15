# Lagrangian Relaxation for the traveling salesman problem

## Introduction
This mini-project is realized within the course _0S01 - Fondements de la Recherche Opérationnelle_ (_Fundamentals of Operations Research_) for student of the Master program _Optimisation et Securité des Systèmes_ (_Optimization and Systems Safety_)__, semester Autumn 2012 at University of Technology of Troyes (France).

Hereafter, I present firstly ... Next, ..

The original French document [Relaxation-lagrangienne-pour-le-probleme-du-voyageur-de-commerce](/Relaxation-lagrangienne-pour-le-probleme-du-voyageur-de-commerce.pdf) presents the theory foundations, algorithms, as well as task assignments of the project. I selectively translate some important parts of this document into English at [Theory-foundation_brief](/Theory-Foundation_brief.pdf). 

The report (in French) of the project is at [OS01_Rapport-du-projet](/OS01_Rapport-du-projet.pdf). 

The algorithms in this project are implemented using Matlab.
We can find all source programs (`.m` files), that have been optimized for code performance (speed, memory) and clarification, together with a related [synthesis note](/Matlab-code/Notes.md) at folder [Matlab-code](/Matlab-code/). 


## Test data
There are 5 test files in folder “TSPLIB”: 
bier127.tsp
eil51.tsp
eil76.tsp
pr76.tsp
st70.tsp
The number in the filename is the number of nodes. These files, whose types are “.tsp”, are readable with a text editor (notepad, VBA editor, Visual C++ editor, etc.). In these files, notice some important details below:
- The optimal cost is provided on line 1.
- The number of nodes is on line 4, example “DIMENSION: 51”
- From line 7 are the node number i and the coordinates x(i) and y(i).

We can copy these files into Excel sheets and simplify the format if you wish. For example, after eliminating the first six line in each file, the simplified files with extension “.txt” are stored in folder “TSPLIB simplified”.



## Task assignements
- **Task 5** - _Evaluation of the method on test problems_.  
For 5 test files in folder “TSPLIB”, compute the value of LB for rules R1, R2, R3, the value of UB, and the difference between LB and UB in %. For R2, use Lambda_j = 1/j. For R3, use delta = 50 and alpha = 0.9. 

- **Task 6** - _Statistical evaluation_.
Generate randomly 100 problems, each contains 30 nodes and specify for each rule the average difference between UB and LB in %, and the number of problems where the algorithm 1_Tree is an optimal solution of the TSP. 