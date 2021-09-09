function g = logistic_loss_gradient(X, y, w)
% g = logistic_loss_gradient(X, y, w)
%
%   Calculates gradient of the logistic loss function.
%
%   Parameters:
%       X - d-dimensional observations of size [d, number_of_observations]
%       y - labels of the observations of size [1, number_of_observations]
%       w - weights of size [d, 1]
%
%   Return:
%       g - resulting gradient vector of size [d, 1]


N = size(X,2);
g = 0;
for k = 1:N
    g = g - y(k)*X(:,k) ./ (exp(dot(X(:,k),w)*y(k))+1);
end
g = g / N;


