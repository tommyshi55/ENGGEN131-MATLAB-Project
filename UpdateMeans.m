function [clusterMean] = UpdateMeans(imageArray, k, clusterNumber)
% This function calculates the mean value of each cluster
% Inputs: imageArray = array containing every pixels in the image
%         k = number of clusters
%         clusterNumber = array specifying which cluster each pixel belongs
%         to
% Output: clusterMean = mean value for each cluster
% Author: Tommy Shi

% Initlize the array storing the updated means, clusterMean, which has the
% dimension k*1*3
clusterMean = zeros(k, 1, 3);

% Get the RGB values for the whole image array in 3 layers
red = imageArray(:,:,1);
green = imageArray(:,:,2);
blue = imageArray(:,:,3);

% Iterate and update the means
for i = 1:k
    
    % Find the position of pixels that has the specific number of cluster
    position = find(clusterNumber == i);
    
    % Find the new means for each colour component and store them in the
    % array clusterMean
    clusterMean(i, 1, 1) = mean(red(position));
    clusterMean(i, 1, 2) = mean(green(position));
    clusterMean(i, 1, 3) = mean(blue(position));
end
end