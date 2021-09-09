function Lh = compute_Lh(itrn, itst, x, h)
% Lh = compute_Lh(itrn, itst, x, h)
%
%   Computes the average log-likelihood over training/test splits generated
%   by crossval for a fixed kernel bandwidth h.
%
%   Parameters:
%       itrn, itst - data splits (indices) generated by crossval()
%       x - the data itself
%       h - kernel bandwidth
%
%   Returns:
%       Lh - average log-likelihood over training/test splits

 n = size(itrn,2);

 for i = 1:n
    p = my_parzen(x,x(itrn{i}),h);
    m = size(itst{i},2);
    for j = 1:m
        L(i) = L(i) + log(p(itst{i}(j)));
    end
 end
 Lh = sum(L)/n;