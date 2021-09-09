function q = find_strategy_2normal(d1Mean, d1Sigma,d2Mean, d2Sigma, distribution1_prior)
% q = find_strategy_2normal(distribution1, distribution2)
%
%   Find optimal bayesian strategy for 2 normal distributions and zero-one loss function.
%
%   Parameters:
%       distribution1 - parameters of the normal dist. distribution1.Mean, distribution1.Sigma
%       distribution2 - the same as distribution1
%
%   Return:
%       q - optimal strategy
%               q.t1 q.t2 - two descision thresholds 
%               q.decision - 3 decisions for intervals (-inf, t1>, (t1, t2>, (t2, inf)
%                            shape <1 x 3>
distribution2_prior = 1- distribution1_prior;
if distribution1_prior == 1
    q.decision = [1 1 1];
    q.t1 = -Inf;
    q.t2 = Inf;
    return
elseif distribution2_prior == 1
    q.decision = [2 2 2];
    q.t1 = -Inf;
    q.t2 = Inf;
    return
end

% quadratic discriminative function
Coef = zeros(1,3);
Coef(1) = d1Sigma^2-d2Sigma^2;
Coef(2) = 2*(d1Mean*d2Sigma^2-d2Mean*d1Sigma^2);
Coef(3) = 2*(d1Sigma*d2Sigma)^2*log((d2Sigma*distribution1_prior)/(d1Sigma*distribution2_prior))+(d1Sigma*d2Mean)^2-(d2Sigma*d1Mean)^2;

% computing the polinomial roots
Ts = roots(Coef); % thresholds

is_convex = Coef(1) > 0;

% assign thresholds and decisions
if isreal(Ts)
    if Ts(1) ~= Ts(2)  %2 real roots
          q.t1 = min(Ts);
          q.t2 = max(Ts);
        if is_convex
          q.decision = [1 2 1];
        else
          q.decision = [2 1 2];
        end
    else %1 real root
      q.t1 = -Inf;
      q.t2 = Inf;
      if is_convex
        q.decision = [1 1 1];
      else
        q.decision = [2 2 2];
      end
    end
else %2 complex roots
  q.t1 = -Inf;
  q.t2 = Inf;
  if is_convex
    q.decision = [1 1 1];
  else
    q.decision = [2 2 2];
  end
end
