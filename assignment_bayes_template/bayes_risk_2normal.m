function R = bayes_risk_2normal(distribution1, distribution2, q)
% R = bayes_risk_2normal(distribution1, distribution2, q)
%
%   Compute bayesian risk of a strategy q for 2 normal distributions and zero-one loss function.
%
%   Parameters:
%       distribution1 - parameters of the normal dist. distribution1.Mean, distribution1.Sigma
%       distribution2 - the same as distribution1
%       q - strategy
%               q.t1 q.t2 - two descision thresholds 
%               q.decision - 3 decisions for intervals (-inf, t1>, (t1, t2>, (t2, inf)
%                            shape <1 x 3>
%
%   Return:
%       R - bayesian risk, scalar

x = zeros(1,3)
if q.decision(1) == 1
   x(1) = distribution1.Prior*(normcdf(q.t1,distribution1.Mean,distribution1.Sigma));
else
   x(1) = distribution2.Prior*(normcdf(q.t1,distribution2.Mean,distribution2.Sigma));
end

if q.decision(2) == 1
   x(2) = distribution1.Prior*(normcdf(q.t2,distribution1.Mean,distribution1.Sigma) - normcdf(q.t1,distribution1.Mean,distribution1.Sigma));
else
   x(2) = distribution2.Prior*(normcdf(q.t2,distribution2.Mean,distribution2.Sigma) - normcdf(q.t1,distribution2.Mean,distribution2.Sigma));
end

if q.decision(3) == 1
    x(3) = distribution1.Prior*(1 - normcdf(q.t2,distribution1.Mean,distribution1.Sigma));
else
    x(3) = distribution2.Prior*(1 - normcdf(q.t2,distribution2.Mean,distribution2.Sigma));
end
R = 1 - sum(x);
    
