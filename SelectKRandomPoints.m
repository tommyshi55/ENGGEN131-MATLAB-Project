function [randomPoints] = SelectKRandomPoints(imageArray, k)
% This function generates a 2D array which store k randomly selected pixels
% from the image
% Inputs: imageArray = The 3D image array to select the pixels from
%         k = number of points to randomly select
% Output: randomPoints = The selected k random points
% Author: Tommy Shi

% Create the array of size kx2
randomPoints = zeros(k, 2);

% Get the rows and columns value of the image array
[rows, cols, ~] = size(imageArray);

% Get the position of k UNIQUE random points
pointsIndices = randperm(rows * cols, k);

% Convert the positions value into x(row) and y(column) values
[rowValues,columnValues] = ind2sub([rows, cols], pointsIndices);

% Assign row and column values
randomPoints(:, 1) = rowValues';
randomPoints(:, 2) = columnValues';
end