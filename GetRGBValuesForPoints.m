function [RGBValues] = GetRGBValuesForPoints(imageArray, randomPoints)
% This function returns the RGB values for a list of specified points in
% the image
% Inputs: imageArray = The 3D image Array representing the image
%         randomPoints = the positions of points to extract RGB values from
% Output: RGBValues = RGB values of the specified points
% Author: Tommy Shi

% Get the value of k and initilize the array of RGBValues of dimension
% k*1*3
k = size(randomPoints, 1);
RGBValues = zeros(k, 1, 3);

% Iterate through the random points given and get the RGB values
for i = 1:k
    
    % Get the rows and columns of that random pixel
    row = randomPoints(i, 1);
    col = randomPoints(i, 2);
    
    % Get the RGB values of that pixel from the image array
    RGBValues(i, 1, 1) = imageArray(row, col, 1);
    RGBValues(i, 1, 2) = imageArray(row, col, 2);
    RGBValues(i, 1, 3) = imageArray(row, col, 3);
end
end