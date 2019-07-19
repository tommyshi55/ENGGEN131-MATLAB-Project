function [clusterNumber] = AssignToClusters(imageArray, kMeans)
% This function assigns each pixel in the image to a cluster based on which
% mean that pixel is closest to
% Inputs: imageArray = the 3D image array containing all the pixels
%         kMeans = the colour information of the k means
% Output: clusterNumber = array containing the corresponding cluster number
%                         of each pixel
% Author: Tommy Shi

% Get the size of the image array and the value of k
[m, n, ~] = size(imageArray);
k = size(kMeans, 1);

% Reshape the image array and the cluster means array for array element by
% element operations
imageArray = reshape(imageArray, [m*n 3]);
imageArray = permute(imageArray,[1 3 2]);
kMeans = permute(kMeans,[2 1 3]);

% Get the squared distance for each point to every k-mean
distance = sum((imageArray - kMeans).^2, 3);

% Transform the distance matrix back to the correct dimension m*n*k
distance = reshape(distance, [m n k]);

% Find the minimum distance and group each pixel to their clusters
[~, clusterNumber] = min(distance,[],3);

end