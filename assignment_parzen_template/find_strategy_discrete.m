function q = find_strategy_discrete(d1,p1, d2,p2, W)
% q = find_strategy_discrete(distribution1, distribution2, W)
%
%   Find bayesian strategy for 2 discrete distributions.
%   
%   Parameters:
%       distribution1.Prob      pXk(x|A) given as a <1 × n> vector
%       distribution1.Prior 	prior probability pK(A)
%       distribution2.Prob      ...
%       distribution2.Prior 	...
%       W - cost function matrix, <states x decisions>
%                                (nr. of states is fixed to 2)
%
%   Return: 
%       q - optimal strategy <1 x n>
%initialize
out = [p1*W(1,1)*d1 + p2*W(2,1)*d2 ; p1*W(1,2)*d1 + p2*W(2,2)*d2];
[m,q] = min(out);
end
