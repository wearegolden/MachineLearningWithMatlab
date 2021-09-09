function [w, b] = perceptron(X, y, maxIterations)
    
% Implements the perceptron algorithm
% (http://en.wikipedia.org/wiki/Perceptron)
%   
%   Parameters:
%       X - training samples (DxN matrix)
%       y - training labels (1xN vector, contains either 1 or 2)
%
%   Returns:
%       w - weights vector (Dx1 vector)
%       b - bias (offset) term (1 double)
    D = size(X,1); 
    N = size(X,2);
    w = zeros(D,1);
    b = 0;
    v = [w;b];
    
    y(find(y == 2)) = -1;
    X(:,find(y == -1)) = -X(:,find(y == -1)) ;
    z = [X; y];
    i = 0;
    while(1)
        for k = 1:N
            if dot(z(:,k),v) <= 0
                v_new = v + z(:,k);
                break;
            end
        end
        if (k == N && dot(z(:,k),v) > 0) || i>=maxIterations
            break;
        end
        v = v_new;
        i = i+1;
    end
    w = v(1:D,1);
    b = v(D+1,1);
    if i == maxIterations
        w = NaN;
        b = NaN;
    end
end