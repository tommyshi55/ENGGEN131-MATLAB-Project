function [newImage] = CreateKColourImage(clusterNumber, clusterMean)
% This function create a k-colour image for an image that has had its pixel
% divided into k clusters. All pixels in a given cluster will be recoloured
% using the mean colour values for that cluster.
% Inputs: clusterNumber = an array specifying which cluster each pixel
%                         belongs to
%         clusterMean = an array where each row contains the mean colour
%                       values for the cluster corresponding to that row
%                       number
% Output: newImage = A 3D array of unsigned 8 bits integer representing the
%                    new k-colour image
% Author: Tommy Shi

% Get the size of the image(m rows, n columns) and the number of k, then
% initilize the array for the new k-colour image
[m, n] = size(clusterNumber);
newImage = zeros(m, n, 3, 'uint8');
k = size(clusterMean, 1);

% initilize the arrays that represents each layer of the new image array
red = newImage(:,:,1);
green = newImage(:,:,2);
blue = newImage(:,:,3);

% Iterate through the clusters and assign the RGB values for each pixel
for i = 1:k
    position = find(clusterNumber == i);
    red(position) = clusterMean(i, 1, 1);
    green(position) = clusterMean(i, 1, 2);
    blue(position) = clusterMean(i, 1, 3);
end

% Merge the RGB values to the new image array
newImage(:,:,1) = red;
newImage(:,:,2) = green;
newImage(:,:,3) = blue;
end