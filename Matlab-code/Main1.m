% ------------------------------------------------------------------------ % 
% Function:    Main1 
% Brief:       [1]. Get data from the given test file.
%              [2]. Compute the value of UB and LB (i.e, value "h" 
%                   obtained in the output of one of 3 function "Sub_Gradient").
%              [3]. Calculate the difference in percentage between LB and UB.
%      
% Programmer: NGUYEN Trung Duong
% ------------------------------------------------------------------------ % 

% Get filename of the test file.
filename = fopen('C:\Users\DUONG\Desktop\OS01 Lagrangian Relaxation for TSP\Test-data\TSPLIB-simplified\eil51.txt'); 
% Read the number of nodes and the coordinates of each node.
[n, X, Y] = Read_TSP(filename); 

% Calculate the distances between nodes.
C = Compute_C(n, X, Y);

% Apply method Farthest Insertion to compute the journey's aggregate distance
% (value "UB").
[UB, T] = Farthest_Insertion(n, C); 

% Set value of the step "lambda" used in method subgradient (Rule 1).
lamda = 1;
% Apply method subgradient (Rule 1) to compute the journey's aggregate
% distance (value "h").
[h, A, D] = Sub_Gradient_R1(n, C, UB, lamda); 

% Difference in percentage between LB and UB.
ecart = (1 - h/UB)*100;