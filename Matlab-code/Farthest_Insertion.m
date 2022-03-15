% -------------------------------------------------------------------------
% Function: Farthest_Insertion.
% Brief: 	Applying the heuristic method Farthest Insertion to compute 
%           the aggregate distance (the cost) of the journey.
%
% Input parameters: 
%           n: Number of nodes.
%           C: Matrix of distances between nodes. 
%
% Output parameters:
%           UB: Aggregate distance of the journey.
%           T:  Itinerary (the order of nodes to cross successively).
%
% Programmer: NGUYEN Trung Duong
% -------------------------------------------------------------------------

function [UB, T] = Farthest_Insertion(n, C)

cost = 0;

% When the heuristic starts, the cycle contains only the depot: T = (1,1).
T(1) = 1;               
T(2) = 1;

Free = zeros(1,n);
Free(2:n) = 1;  % Node i (from the 2nd to the n_th) is initially outside the cycle.

%---------------- Loop performing the (n-1) insertions -------------------%
for k = 1:(n-1)         
    
    % Find "bi" (i.e, "best i"), the farthest free node outside of cycle T.
    Dmax = -Inf('single');                 % Negative infinity    
    for i = 2:n
        if (Free(i)==1)
            Dmin = Inf('single');          % Positive infinity    
            
            for j = 1:k
                if (C(i,T(j))< Dmin)
                    Dmin = C(i,T(j));
                end    
            end    
            
            if(Dmin > Dmax)
               Dmax = Dmin;
               bi = i;
            end
        end
    end
    
    %-- Insert node "bi" into cycle T such that the increasing in the cycle's total length is minimized --%
    MinCVar = Inf('single');    % Minimum cost variation
    
    for j = 1:k
        CVar = C(T(j), bi) + C(bi, T(j+1)) - C(T(j), T(j+1));
        if (CVar < MinCVar)
            MinCVar = CVar;
            bj = j;             % Better insertion position for the selected node "bi".
        end    
    end
    
    % Shift T to make a place for node "bi" in cycle T(bj+1).
    for i = (k+1):-1:(bj+1)
        T(i+1) = T(i);
    end

    T(bj+1) = bi;
    cost = cost + MinCVar;
    UB = cost;                  % Aggregate distance of the newly-formed cycle.

end
end