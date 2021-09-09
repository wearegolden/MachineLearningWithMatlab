function centers = k_meanspp(x, k)
% KMEANSPP - perform k-means++ initialization for k-means clustering.
%
% Input:
%   X - [DIMS x N] N input vectors of dimenionality DIMS
%   K - [int] number of k-means centers
%
% Output:
%   CENTERS - [DIMS x K] K proposed centers for k-means initialization

% Number of vectors
dims = size(x,1);
N = size(x, 2);

%idx = randsample(N,1);
idx = random_sample(ones(1,N));
centers = x(:,idx);
iter = 1;
p = zeros(1,N);
while size(centers,2) < k
    for i = 1:N
        for j = 1:size(centers,2)
            d(j) = norm(x(:,i) - centers(:,j));
        end
        p(i) = min(d)^2;
    end
    index = random_sample(p);
    centers = [centers x(:,index)];
end
    
