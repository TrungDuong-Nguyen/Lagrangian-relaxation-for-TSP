- Function `Random_TSP.m` generates a random TSP which contains (n) nodes distributed randomly in a rectangle of size (Xmax x Ymax)

- Function `Read_TSP.m` reads the data (the number of nodes, and their coordinates) from a text-file.

- Function `Compute_C.m` uses the data provided by function `Read_TSP.m` to compute the matrix of distances between nodes.

- Two functions `Farthest_Insertion.m` and `One_Tree.m` both take the number of nodes and the matrix distances between nodes as input parameters, then apply respectively heuristic method Farthest Insertion and algorithm "1_Tree" to compute the aggregate distance of the journey.

     The heuristic method _Farthest Insertion_, when implemented, gives good results on Euclidean traveling salesman problems. The outcomes include the cycle found, with the depot 1 at the beginning and at the end, and _UB_ is the cost of the cycle. The heuristic starts with a cycle reduced to a loop over the depot: Cycle = (1,1). At each iteration, it determines the unvisited node _i_ which is farthest from the nodes in the cycle, then inserts this node _i_ into the cycle such that the total length is increased as little as possible.

- The functions `Sub_Gradient_R1.m`, `Sub_Gradient_R2.m`, `Sub_Gradient_R3.m` are three variants (make a footnote here, that cites to paragraph "example of classis rules" in the end of section 2, document Theory-Foundation_brief.pdf)
that apply method subgradient to compute the aggregate distance of the journey. Specifically, the only difference between these three functions is at the way they update the value of step "lambda" used in method subgradient. Below is three classic rules[^1] to update "lambda":

[^1]: See section 2: [**Solving the dual by a subgradient method**](/Theory-Foundation_brief.pdf).
<br>

![](/Matlab-code/R1-Constant-step.PNG)
![](/Matlab-code/R2-Rule-of-divergent-series.PNG)
![](/Matlab-code/R3-Rule-of-convergent-series.PNG)

<br>

Notice that the functions Sub_Gradient internally call to function `One_Tree.m` as method subgradient is implemented on the basis of algorithm "1_Tree".

- Two functions `plot_Cycle.m` and `plot_Aretes.m` are used to draw the path found using methods Farthest Insertion and subgradient, respectively.

- Program `Main1.m` performs the works in [**Task 5** - _Evaluation of the methods on given test data_](refer to section on README.md] typically for the case of Rule 1 (lambda = 1).

- Program `Main2.m` performs the works in [**Task 6** - _Statistical evaluation_](refer to section on README.md] typically for the case of Rule 1 (lambda = 1).

For the work in **Task 6**, we must eliminate the codeline:
```
C(i,j)= round(C(i,j)); 
```
which is used to round up the distance, in the function `Compute_C.m`.