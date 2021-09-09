function y = classify_images(X, w)
% y = classify_images(X, w)
%
%   Classification by logistic regression.
%
%   Parameters:
%       X - d-dimensional observations of size [d, number_of_observations]
%       w - weights of size [d, 1]
%
%   Return:
%       y - estimated labels of the observations of size [1, number_of_observations]
N = size(X,2);
for k = 1:N
    a = 1/(1+exp(-dot(w,X(:,k))));
    c = 1/(1+exp(dot(w,X(:,k))));
    if a>c
        y(k) = 1;
    else 
        y(k) = -1;
    end
end
