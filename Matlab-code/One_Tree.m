% -------------------------------------------------------------------------
% Function: One_Tree.
% Brief: 	Applying the algorithm "1_Tree" to compute the aggregate 
%           distance (the cost) of the journey.
%
% Input parameters: 
%           n: Number of nodes.
%           C: Matrix of distances between nodes. 
%
% Output parameters:
%           h: The aggregate distance (the cost) of the journey. 
%           A: List of edges.
%           D: Nodes's degree table.
%
% Programmer: NGUYEN Trung Duong
% -------------------------------------------------------------------------
function [h, A, D] = One_Tree(n, C)

h = 0;                              % Initialize the cost = 0.

S = zeros(1,n);                     % S is used to spot the connected nodes.
S(2)= 1;

A = zeros(2,n);                     % Pre-allocation for performance.

for k = 1:(n-2)
    Cmin = Inf('single');
    for i = 1:n
        if (S(i)== 1)
            for j = 2:n
                if (S(j)==0)
                    if(C(i,j)< Cmin)
                       Cmin = C(i,j);
                       imin = i;
                       jmin = j;
                    end    
                end    
            end    
        end       
    end
    
    S(jmin)= 1;
    h = h + Cmin;
    A(1,k) = imin;
    A(2,k) = jmin;
end

%----- Add the smallest incident edge to node 1 -----%
Cmin = Inf('single');
for j = 2:n
    if (C(1,j)< Cmin)
        Cmin = C(1,j);
        jmin = j;
    end
end
h = h + Cmin;
A(1,n-1) = 1;
A(2,n-1) = jmin;

%----- Add the second-smallest incident edge to node 1 -----%
Cmin = Inf('single');
for i = 2:n
    if ((C(1,i) < Cmin) && (i ~= jmin))
        Cmin = C(1,i);
        imin = i;
    end
end
h = h + Cmin;
A(1,n) = 1;
A(2,n) = imin;

%----- Build the nodes' degree table ----%
D = zeros (2,n);
for  i = 1:n
    D(1,i) = i;
    X = (A(1,:)== i);
    Y = (A(2,:)== i);
    D(2,i) = sum(X,2) + sum(Y,2);
end

end