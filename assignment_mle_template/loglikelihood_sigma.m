function [L maximizerSigma maxL] = loglikelihood_sigma(x, D, sigmas)
% [L maximizerSigma maxL] = loglikelihood_sigma(x, D, sigmas)
%
%   Compute log ligelihoods and maximum ll of a normal
%   distribution with fixed mean and variable standard deviation.
%
%   Parameters:
%       x - input features <1 x n>
%       D - D.Mean the normal distribution mean
%       sigmas - <1 x m> vector of standard deviations
%
%   Returns:
%       L - <1 x m> vector of log likelihoods
%       maximizerSigma - sigma for the maximal log likelihood
%       maxL - maximal log likelihood
  
% no need of for loops!!!

L = -sum((x - D.Mean).^2)./(2*sigmas.^2)-size(x,2).*(log(sqrt(2*pi)*sigmas));
min_sigma = min(sigmas);
max_sigma = max(sigmas);
maximizerSigma = fminbnd(@(y) -compute_L(x,D,y), min_sigma, max_sigma); 
maxL = -sum((x - D.Mean).^2)/(2*maximizerSigma^2)-size(x,2)*log((sqrt(2*pi)*maximizerSigma));

