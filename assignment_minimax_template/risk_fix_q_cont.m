function risks = risk_fix_q_cont(D1, D2, D1_priors, q )
% risks = risk_fix_q_cont(D1, D2, D1_priors, q )
%
%   Computes risk(s) for varying prior.
%
%   Parameters:
%       D1, D2 - normal distributions, prior not needed
%       D1_priors <1xn> vector of D1 priors
%       q - strategy
%
%   Returns:
%       risks - <1xn> vector of bayesian risk of the strategy q with
%               varying prior D1_priors


risks = zeros(size(D1_priors));

for k = 1: size(D1_priors,2)
    risks(k) =bayes_risk_2normal(D1, D2, D1_priors(k),q);
end
