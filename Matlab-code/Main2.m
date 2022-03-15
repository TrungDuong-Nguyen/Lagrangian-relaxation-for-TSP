% ------------------------------------------------------------------------ % 
% Function:    Main2 
% Brief:       [1]. Generate (N) TSP problems (test cases), 
%                   each contains (n) nodes.
%              [2]. Compute the average of difference (in percentage) 
%                   between UB and LB.
%              [3]. Identify the number of problems where the algorithm 
%                   "1_Tree" is an optimal solution of the TSP.
%      
% Programmer: NGUYEN Trung Duong
% ------------------------------------------------------------------------ % 

% Set number of nodes in each test case.
n = 30;                    
% Set the dimension of the square where n nodes are distributed.
Xmax = 50; Ymax = 50;        

% Set the number of test cases to be evaluated.
N = 100;
ecart = zeros(1,N);        % Vector that stores the percentage difference 
                           % between UB and LB for each test case.
k = 0;                     % Counter of the number mentioned in [3]. 

% Set value of the step "lambda" used in method subgradient (Rule 1).
lamda = 1;                 

for i = 1:N              
    
    % Generate a test case where n nodes are distributed randomly 
    % within an area (Xmax x Ymax).
    [X,Y] = Random_TSP(n, Xmax, Ymax);  
    % Calculate the distances between nodes.
    C = Compute_C(n, X, Y); 
    
    % Apply method Farthest Insertion to compute the journey's aggregate 
    % distance (value "UB").
    [UB, T] = Farthest_Insertion(n, C);
    
    % Apply method subgradient (Rule 1) to compute the journey's aggregate
    % distance (value "h").
    [h, A, D] = Sub_Gradient_R1(n, C, UB, lamda); 
    
    % Difference in percentage between LB (value "h") and UB.
    ecart(i) = (1 - h/UB)*100;     
     
    %----- Examine if all nodes have a degree equal to 2 ----% 
    if sum(D(2,:)== 2) == n 
       k = k + 1;                  % If Yes, method subgradient provides 
                                   % optimal solution for this test case.                                   
    end
    
end 

% Average of difference between LB and UB for the N test cases.
moyen = sum(ecart)/N;             