function [q risk] = minmax_strategy_cont(D1, D2)
% [q risk] = minmax_strategy_cont(D1, D2)
%
%   Find minmax strategy.
%
%   Parameters:
%       D1, D2 - 2 normal distributions
%                D1.Sigma, D1.Mean
%                prior not needed
%
%   Returns:
%       q - strategy (see find_strategy_2normal)
%       risk - bayes risk of the minimax strategy q


x_minimizer = fminbnd(@(x) 1-worst_risk_cont(D1, D2, x),0,1); % 모든 prior에 대해 worst가 최소가 되는 prior을 찾고
% p_2 = 0:0.001:1;
% w_r = worst_risk_cont(D1, D2, p_2);
% [a,b] = min(w_r);
% x_minimizer = p_2(b);
q = find_strategy_2normal(D1, D2,x_minimizer);
risk = worst_risk_cont(D1, D2, x_minimizer);
