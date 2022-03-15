% -------------------------------------------------------------------------
% Function: plot_Cycle.
% Brief: 	Plot the cycle found using method Farthest Insertion.
%
% Input parameters: 
%           X, Y :  Coordinates of the nodes.
%           T: Cycle itinerary (the order of nodes to cross successively), 
%              obtained in the output of function "Farthest_Insertion". 
%
% Programmer: NGUYEN Trung Duong
% -------------------------------------------------------------------------
function plot_Cycle(X, Y, T)

n = size(T,2);

newX = zeros(1,n);
newY = zeros(1,n);

for i = 1:n
    newX(i) = X(T(i));
    newY(i) = Y(T(i));
end

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

% Draw the cycle
line(newX, newY,'Color','r','LineWidth',2);

end