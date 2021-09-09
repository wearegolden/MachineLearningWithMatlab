function [mu sigma] = mle_normal(x)
% [mu sigma] = mle_normal(x)
%
%   Computes maximum likelihood estimate of mean and sigma of a normal
%   distribution.
%
%   Parameters:
%       x - input features <1 x n>
%
%   Returns:
%       mu - mean
%       sigma - standard deviation
n = size(x,2);
mu = sum(x)/n;
sigma = sqrt(sum((x-mu).^2)/n);

