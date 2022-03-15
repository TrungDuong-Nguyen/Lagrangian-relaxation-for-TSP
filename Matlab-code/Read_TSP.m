% -------------------------------------------------------------------
% Function: Read_TSP.
% Brief: 	Read the data contained in a text-file with a given name. 
%
% Input parameters: 
%           filename: Name of the text-file.
%
% Output parameters:
% 			n: Number of nodes.
% 			X, Y: Coordinates of the nodes. 
%
% Programmer: NGUYEN Trung Duong
% -------------------------------------------------------------------

function [n, X, Y] = Read_TSP(filename)

A = textscan(filename,'%n %f %f');

n = size(A{1},1);
X = zeros(1,n); 
Y = zeros(1,n);

for i = 1:n
    X(i) = A{2}(i,1);
    Y(i) = A{3}(i,1);
end

end