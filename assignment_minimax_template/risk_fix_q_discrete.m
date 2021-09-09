function risks = risk_fix_q_discrete(D1, D2, D1_priors, q )
% risks = risk_fix_q_discrete(D1, D2, D1_priors, q )
%
%   Computes risk(s) for varying prior.
%
%   Parameters:
%       D1, D2 - discrete distributions, priors not needed
%       D1_priors <1xn> vector of D1 priors
%       q - strategy
%
%   Returns:
%       risks - <1xn> vector of bayesian risk of the strategy q 
%               with 0-1 cost function and varying priors D1_priors

W = [0 1; 1 0];

risks = zeros(size(D1_priors));

for k = 1: size(D1_priors,2)
    risks(k) = bayes_risk_discrete(D1.Prob, D2.Prob, D1_priors(k),W,q);
end
