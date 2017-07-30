function ret = knn_classifier(tx, ty, x, k)
%UNTITLED Summary of this function goes here

%   Find the distances from x(unlabeled test input) to all points in
%   tx(labelled training data).
for i = 1:size(tx,1)
        dist(i) = e_dist(x,tx(i,:));
end

% Now sort the distances in ascending order. Nearest Neighbor's index will
% be saved in indices.%
[sorted_distances, indices] = sort(dist);

% get the number of distinct classes to which a given input can belong to.
% In Iris dataset is 3 class classifier. Instead of hard coding to 3, lets us get it from ty.
classes = size(unique(ty),1);
% Get K nearest neighbors 
votesForEachClass = zeros(1, classes);
for r = 1:k
    votesForEachClass(ty(indices(r))) = votesForEachClass(ty(indices(r))) + 1;
end

[sorted_votes, class] = sort(votesForEachClass,'descend');
%get the most often one...
ret = class(1);
