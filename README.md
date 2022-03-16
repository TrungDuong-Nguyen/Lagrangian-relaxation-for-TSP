# Lagrangian Relaxation for the traveling salesman problem

## Introduction
This mini-project is realized within the course _0S01 - Fondements de la Recherche Opérationnelle_ (Fundamentals of Operations Research) for student of the Master program _Optimisation et Securité des Systèmes_ (Optimization and Systems Safety), semester Autumn 2012, at University of Technology of Troyes (France).

The original French document [Relaxation-lagrangienne-pour-le-probleme-du-voyageur-de-commerce](/Relaxation-lagrangienne-pour-le-probleme-du-voyageur-de-commerce.pdf) presents the theory foundations, algorithms, as well as task assignments of the project. I selectively translate some important parts of this document into English at [Theory-foundation_brief](/Theory-Foundation_brief.pdf). 

The report (in French) of the project is at [OS01_Rapport-du-projet](/OS01_Rapport-du-projet.pdf). 

The algorithms in this project are implemented using Matlab.
We can find all source programs (`.m` files), that have been optimized for code performance (speed, memory) and clarification, together with a related [synthesis note](/Matlab-code/README.md) at folder [Matlab-code](/Matlab-code/). 


## Test data
There are 5 test files in folder [TSPLIB](/Test-data/TSPLIB/): 

|TSPLIB| 
|:---:|
|_bier127.tsp_|
|_eil51.tsp_|
|_eil76.tsp_|
|_pr76.tsp_|
|_st70.tsp_|

The number in the filename is the number of nodes. These files, whose types are “.tsp”, are readable with a text editor (notepad, VBA editor, Visual C++ editor, etc.). In these files, notice some important details below:
- The optimal cost is provided on line 1.
- The number of nodes is on line 4. For example, test file _eil51.tsp_ has “DIMENSION: 51” which means there are 51 nodes.
- From line 7 are the node number _i_ and its coordinates (_xi_, _yi_).

We can copy these files into Excel sheets and simplify the format. For example, after eliminating the first six line in each file, the simplified versions with extension “.txt” are stored in folder [TSPLIB simplified](/Test-data/TSPLIB-simplified/).



## Task assignements
- **Task 5** - _Evaluation of the method on test problems_.  
For 5 test files in folder [TSPLIB](/Test-data/TSPLIB/), compute the value of _LB_ for rules _R1_, _R2_, _R3_, the value of _UB_, and the difference between _LB_ and _UB_ in _%_. For _R2_, use _Lambda_j = 1/j_. For _R3_, use _sigma = 50_ and _alpha = 0.9_. 

- **Task 6** - _Statistical evaluation_.
Generate randomly 100 problems, each contains 30 nodes and specify for each rule the average difference between _UB_ and _LB_ in _%_, and the number of problems where the algorithm _"1_Tree"_ is an optimal solution of the TSP. 