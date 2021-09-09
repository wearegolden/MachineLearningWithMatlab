function q = find_strategy_discrete(distribution1, distribution2, W)
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
out = [distribution1.Prior*W(1,1)*distribution1.Prob + distribution2.Prior*W(2,1)*distribution2.Prob];
for d = 2:size(W,1)
    out = [out; distribution1.Prior*W(1,d)*distribution1.Prob + distribution2.Prior*W(2,d)*distribution2.Prob];
end
[m,q] = min(out);
end
