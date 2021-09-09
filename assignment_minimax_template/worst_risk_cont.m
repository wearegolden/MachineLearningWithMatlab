function worst_risks = worst_risk_cont(D1, D2, D1_priors)
% worst_risks = worst_risk_cont(D1, D2, D1_priors)
%
%   Compute worst possible risks of a bayesian strategies.
%
%   Parameters:
%       D1, D2 - normal distributions
%       D1_priors - <1 x n> vector of D1 priors to be used
%
%   Returns:
%       worst_risks - <1 x n> worst risk of bayesian strategies
%                     for D1, D2 with different priors D1_priors


%   Hint: for all D1_priors calculate bayesian strategy and 
%   corresponding maximal risk.

sz = size(D1_priors,2);
worst_risks = zeros(1,sz);
for k = 1: sz
    q = find_strategy_2normal(D1, D2, D1_priors(k));
    for n = 1:sz
        A(n) = bayes_risk_2normal(D1, D2, D1_priors(n),q);
    end
    worst_risks(k) = max(A);
end
