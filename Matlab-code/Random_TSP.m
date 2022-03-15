% ----------------------------------------------------------------------------------------------------
% Function: Random_TSP.
% Brief: 	Generate a random TSP. 
% 
% Input parameters: 
% 			n: Number of nodes.
% 			Xmax, Ymax: Width and length of the rectangle in which the nodes are randomly distributed.
% 
% Output parameters:
% 			X, Y: Coordinates of the nodes. 
%
% Programmer: NGUYEN Trung Duong
% ----------------------------------------------------------------------------------------------------

function [X,Y] = Random_TSP(n, Xmax, Ymax)
    X = Xmax*rand(1,n);
    Y = Ymax*rand(1,n);
end