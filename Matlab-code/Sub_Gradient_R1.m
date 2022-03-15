% -------------------------------------------------------------------------------------------------
% Function: Sub_Gradient_R1 (Rule 1).
% Brief: 	Applying the method subgradient to compute the aggregate 
%           distance (the cost) of the journey.
%
% Input parameters: 
%           n:  Number of nodes.
%           C:  Matrix of distances between nodes.
%           UB: Aggregate distance of the journey, obtained when applying
%               heuristic method Farthest Insertion.
%           lamda: Value of step "lambda".
%           ** Note that with Rule 1, we have to preset lambda = 1 (fixed 
%              and constant) before calling this function.
%
% Output parameters:
%           h: The aggregate distance (the cost) of the journey. 
%           A: List of edges.
%           D: Nodes's degree table.
%
% Programmer: NGUYEN Trung Duong
% --------------------------------------------------------------------------------------------------
function [h, A, D] = Sub_Gradient_R1 (n, C, UB, lamda)

% Initialization.
LB = 0.00;                              % lower bound value
Pi(1:n) = 0.00;                         % multipliers

esl = 0.01;                             % precision value

TSP = 0;
Norm = 0.00;
NewC = zeros(n,n);

% Create a matrix (1 x n) with all elements equal to 2.
Temp = repmat(2,1,n);                   

% Iteration counters: 
% "kmax" is set experimentally large enough to ensure the convergence.
k = 0; kmax = 1000;

while (TSP == 0)
      k = k + 1;            
      
      for i = 1:n 
          for j = 1:n  
              NewC(i,j) = C(i,j) + Pi(i) + Pi(j);
          end    
      end
      
      % Call predefined function "One_Tree" which applies algorithm "1_Tree" 
      % to compute the aggregate distance (the cost) of the journey.
      [h, A, D] = One_Tree(n, NewC);
                
      SumPi = sum(Pi);
      
      if ((h - 2*SumPi) > LB)
          LB = h - 2*SumPi;
      end               
    
      if ((TSP == 0) && (LB < UB))
         Norm = 0.00;        
         for i = 1:n
             Norm = Norm + (D(2,i)-2)^2;
         end

         Norm = sqrt(Norm);
         if(Norm > esl)
            %----- Update the multipliers -----%
            for i = 1:n
                Pi(i) = Pi(i) + lamda*(D(2,i) - 2)/ Norm;
            end    
         end    
      end 

      % Conditions to exit the while loop (stop the subgradient method).
      % (D(2,:)= Temp) means that all nodes have a degree equal to 2.
      if ((D(2,:)== Temp)||(k == kmax)||(LB > UB-esl)||(Norm < esl))
        TSP = 1;  
      end
      
end
end