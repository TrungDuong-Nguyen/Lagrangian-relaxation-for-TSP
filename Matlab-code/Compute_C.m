% --------------------------------------------------------------------------------
% Function: Compute_C.
% Brief: 	Calculate the distances between nodes.
%
% Input parameters: 
%           n: Number of nodes.
% 			X, Y: Coordinates of the nodes. 
%
% Output parameters:
%           C: Matrix of distances between nodes.
%
% Programmer: NGUYEN Trung Duong
% -------------------------------------------------------------------------------

function C = Compute_C(n, X, Y)

C = zeros(n,n);

for i=1:n
    for j=1:n
        C(i,j)= sqrt((X(i)-X(j))^2 + (Y(i)-Y(j))^2);
        C(i,j)= round(C(i,j));                          % Round up the distance
    end
end

end