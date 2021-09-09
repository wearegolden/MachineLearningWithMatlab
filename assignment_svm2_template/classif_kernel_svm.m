function [ classif ] = classif_kernel_svm( X, model )
%CLASSIF_KERNEL_SVM performs classification on X by trained SVM classifier stored in model
% 
% Input:
% X         [n x m (double)] matrix containing feature points in columns
% model     [1 x 1 (struct)] structure with fields (.b, .fun, .sv, .y, .alpha, .options see my_kernel_svm.m for details)
% 
% Output:
% classif   [1 x m (double)] vector with labels for X obtained by classification 
% 
    m = size(X,2);
    b = model.b;
    classif = zeros(1,m);
    options = model.options;
    alpha = model.alpha;
    y = model.y.';
    sv = model.sv;
    for k=1:m
        if sum(alpha.*y.*getKernel( sv, X(:,k), options))  + b > 0
            classif(k) = 1;
        else
            classif(k) = -1;
        end
    end

end

