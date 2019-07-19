function [clusterNumber,Means] = KMeansRGB(imageArray,seedMeans,max)
% This function partitons the points in an image into k clusters using the
% k-means algorithm
% Inputs: imageArray = array containing all the pixels in an image
%         seedMeans = initial cluster means for k-means algorithm
%         max = maximum number of iterations
% Outputs: clusterNumber = clusters where each pixels in the image belongs
%          to
%          clusterMean = means of each clusters after the iterations or
%          when it converges
% Author: Tommy Shi

% Get the size of the image array(m rows, n columns) and k, then initilize
% the clusterNumber array that stores where each pixels in the image
% belongs to
[m, n, ~] = size(imageArray);
k = size(seedMeans, 1);
clusterNumber = zeros(m, n);

% Initilize the kmeans which is the given seed means and the variable
% previousMean which stores the k-means from the last iteration to check
% for convergence
Means = seedMeans;
previousMean = zeros(k, 1, 3);

% Initilize the number of iterations and iterate through the image array
% using the k-means algorithm until the k-means converge or the maximum
% number of iterations has been reached
numberOfIterations = 1;
while (numberOfIterations <= max) && ~isequal(Means, previousMean)
    clusterNumber = AssignToClusters(imageArray, Means);
    previousMean = Means;
    Means = UpdateMeans(imageArray, k, clusterNumber);
    numberOfIterations = numberOfIterations + 1;
end

% Display the warning message if the maximum number of iterations reached
% before convergence was achieved
if numberOfIterations > max
    disp('Maximum number of iterations reached before convergence was achieved')
end

end