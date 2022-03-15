% -------------------------------------------------------------------------
% Function: plot_Aretes.
% Brief: 	Plot the cycle found using method subgradient.
%
% Input parameters: 
%           X, Y: Coordinates of the nodes.
%           A: List of edges, 
%              obtained in the output of one of 3 function "Sub_Gradient"). 
%
% Programmer: NGUYEN Trung Duong
% -------------------------------------------------------------------------
function plot_Aretes(X,Y,A)

% Locate the depot and the nodes.
plot(X,Y,'o','MarkerEdgeColor','k',...
             'MarkerFaceColor','g',...
             'MarkerSize',10);
grid
hold on

plot(X(1),Y(1),'o','MarkerEdgeColor','k',...
               'MarkerFaceColor','b',...
               'MarkerSize',12);
hold on  

% Draw the edges.
newX = zeros(1,2); 
newY = zeros(1,2);

for i = 1:size(A,2)
    for j = 1:2
        newX(1,j) = X(A(j,i));
        newY(1,j) = Y(A(j,i));
    end
        line(newX,newY,'Color','r','LineWidth',2);                   
end
end