function [var_mean var_sigma] = mle_variance(cardinality)
% [var_mean var_sigma] = mle_variance(cardinality)
%
%   Estimates variance of estimated parameters of a normal distribution 
%   in 100 trials.
%
%   Parameters:
%       cardinality - size of the generated dataset (e.g. 1000)
%   Returns
%       var_mean - variance of the estimated means in 100 trials
%       var_sigma - variance of the estimated standard deviation in 100 trials


    numTrials = 100;
    muRec = zeros(1,numTrials);
    sigmaRec = zeros(1,numTrials);
    
    for k = 1:numTrials
        x = randn(1,cardinality);
        [a b] = mle_normal(x);
        muRec(k) = a;
        sigmaRec(k) = b;
    end
    
    [a b] = mle_normal(muRec);
    var_mean = b^2;
    [a b] = mle_normal(sigmaRec);
    var_sigma = b^2;

