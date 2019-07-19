function [squaredDistance] = SquaredDistance(P, Q)
% This function calculate the squared distance in three dimensions between
% two points, using the formula
% (P1 - Q1)^2 + (P2 - Q2)^2 + (P3 - Q3)^2
% Inputs: P = the coordinate of the first point
%         Q = the coordinate of the second point
% Output; squaredDistance = squared distance between the two points
% Author: Tommy Shi

squaredDistance = sum((P - Q).^2);

end