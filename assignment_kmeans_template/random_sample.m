function idx = random_sample(weights)
% RANDOM_SAMPLE picks randomly a sample based on the sample weights.
%
% Suppose weights / sum(weights) is a discrete probability distribution. 
% RANDOM_SAMPLE picks a sample from the distribution and returns its index.
%
% Input:
%   weights - array of sample weights
%
% Output:
%   idx - index of chosen sample
norm_w = weights / sum(weights);
norm_w = cumsum(norm_w);
% use rand() for random number generation in open interval (0, 1)
num = rand();
% YOUR CODE HERE
idx = find(num < norm_w,1);

