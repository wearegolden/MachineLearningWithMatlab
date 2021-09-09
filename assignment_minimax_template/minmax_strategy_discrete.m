function [q risk] = minmax_strategy_discrete(D1, D2)
% [q risk] = minmax_strategy_cont(D1, D2)
%
%   Find minmax strategy.
%
%   Parameters:
%       D1, D2 - 2 discrete distributions
%                D1.Prob - <1x21> vector of conditional probs
%                prior not needed
%
%   Returns:
%       q - strategy, <1x21> vector of 1 and 2 (see find_strategy_discrete)
%       risk - bayes risk of the minimax strategy q (in discrete
%       case, use the worse case risk of the optimal strategy - do
%       you know why?)

W = [0 1; 1 0];

x_minimizer = fminbnd(@(x) worst_risk_discrete(D1, D2, x),0,1); % 모든 prior에 대해 worst가 최소가 되는 prior을 찾고
q = find_strategy_discrete(D1.Prob, D2.Prob, x_minimizer,W);

risk = bayes_risk_discrete(D1.Prob, D2.Prob, x_minimizer, W, q);

% x_minimizer = fminbnd(@(x) bayes_risk_discrete(D1, D2, x, W, q_s),0,1);
% q_s = find_strategy_discrete(D1, D2, x_minimizer,W);
% x_minimizer = fminbnd(@(x) bayes_risk_discrete(D1, D2, x, W, q_s),0,1);
% q = find_strategy_discrete(D1, D2, x_minimizer,W);
% risk = worst_risk_discrete(D1, D2, x_minimizer);


