function classify = adaboost_classify(strong_class, X)
% classify = adaboost_classify(strong_class, X)
%
% Applies the strong classifier to the data X and returns the
% classification labels
%
%   Parameters:
%       strong_class - the structure returned by adaboost()
%
%       X [K x N] - training samples, K is the number of weak classifiers
%            and N the number of data points
%
%   Returns:
%       classify [1 x N] - the labels of the input data X as predicted by
%            the strong classifier strong_class
%

T = size(strong_class.alpha,2);

for t = 1:T
    h(t,:) = sign(strong_class.wc(t).parity.*(X(strong_class.wc(t).idx,:) - strong_class.wc(t).theta));
    F(t,:) = strong_class.alpha(t)*h(t,:);
end

classify = sign(sum(F(1:T,:)));

   



