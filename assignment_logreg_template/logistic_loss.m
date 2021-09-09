function loss = logistic_loss(X, y, w)
% loss = logistic_loss(X, y, w)
%
%   Evaluates the logistic loss function.
%
%   Parameters:
%       X - d-dimensional observations of size [d, number_of_observations]
%       y - labels of the observations of size [1, number_of_observations]
%       w - weights of size [d, 1]
%
%   Return:
%       loss - calculated loss (scalar)


N = size(X,2);
loss = 0;
for k = 1:N
    loss = loss + log( 1 + exp( -dot(X(:,k),w)*y(k)));
end
loss = loss/N;
