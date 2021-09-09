function worst_risks = worst_risk_discrete(D1, D2, D1_priors)
% worst_risks = worst_risk_discrete(D1, D2, D1_priors)
%
%   Compute worst possible risks of a bayesian strategies.
%
%   Parameters:
%       D1, D2 - discrete distributions
%       D1_priors - <1 x n> vector of D1 priors to be used
%
%   Returns:
%       worst_risks - <1 x n> worst risk of bayesian strategies
%                     for D1, D2 with different priors D1_priors


%   Hint: for all D1_priors calculate bayesian strategy and 
%   corresponding maximal risk.

W = [0 1; 1 0];
sz = size(D1_priors,2);
worst_risks = zeros(1,sz);
for k = 1: sz
    q = find_strategy_discrete(D1.Prob, D2.Prob, D1_priors(k),W);
    for n = 1:sz
        A(n) = bayes_risk_discrete(D1.Prob, D2.Prob, D1_priors(n),W,q);
    end
    worst_risks(k) = max(A);
end