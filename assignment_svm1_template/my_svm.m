function [ w, b, sv_idx ] = my_svm( X, y, C, options )
%MY_SVM Solves linear soft-margin SVM dual task and outputs w, b and support vectors indices
%   
% Input:
% X         [n x m (double)] matrix containing feature points in columns
% y         [1 x m (double)] vector with labels (-1, 1) for feature points in X
% C         [1 x 1 (double)] number with regularization constant C
% options   [1x1 (struct)] (optional) structure that holds options for gsmo QP solver fields .verb (verbosity of QP solver), .tmax (maximal number of iterations, default is inf)
% 
% Output:
% w         [n x 1 (double)] normal vector of the separating hyperplane
% b         [1 x 1 (double)] number, the bias term
% sv_idx    [p x 1 (double)] vector with indices of support vectors 

    % Add options field if absent on input
    if nargin < 4
        options.verb = true;
    end;

    % Prepare input for QP solver
    N = numel(y);
    % H is a matrix [N x N] and its elements are H(i, j) = y_i*y_j*x_i'*x_j
    H = (y.'*y).*(X.'*X);
    f = ones(N,1);
    % a is a vector [N x 1] containing class identifiers y_i
    a = y.';
    b = 0;
    % LB is a vector [N x 1] lower bound for constraints on alpha
    UB = zeros(N,1);
    % UB is a vector [N x 1] upper bound for constraints on alpha
    LB = -C*ones(N,1);
    
    % Solve QP task
    [alpha, fval, stat, Nabla] = gsmo(H, f, a, b, LB, UB, zeros(N, 1), [], options);
   
    % Check the exit flag 
    if (~stat.exitflag)
        w = nan(size(X, 1), 1);
        b = nan(1);
        sv_idx = [];
        warning('my_svm: Exitflag not set. Solution not found.'); 
        return;
    end;
    
    % Get support vector indices
    sv_idx = find(alpha<0);
    
    m = size(X,2);
    n = size(X,1);
    % Transform solution of dual task to primal one
    w = zeros(n,1);
    for k = 1:m
        w = w -alpha(k).*y(k).*X(:,k);
    end
    b = 0;
    d = 0;
    for i = 1:size(sv_idx,1)
        for j = 1:m
            d = d + alpha(j)*y(j)*dot(X(:,sv_idx(i)),X(:,j));
        end
        b = b + y(sv_idx(i)) + d;
        d = 0;
    end
    b = b/size(sv_idx,1);
    %b = y(sv_idx.') + alpha(sv_idx).'.*y(sv_idx.').*
        
    
    
end

