function Z = lift_dimension(X)
    
% Lifts the dimensionality of the feature space from 2 to 5 dimensions
%
%   Parameters:
%       X - training samples in the original space (2xN matrix)
%
%   Returns:
%       Z - training samples in the lifted feature space (5xN vector)
    N = size(X,2);
    Z = [];
    for k = 1:N
        Z = [Z, [X(1,k); X(2,k); X(1,k)^2; X(1,k)*X(2,k); X(2,k)^2]];
    end



end