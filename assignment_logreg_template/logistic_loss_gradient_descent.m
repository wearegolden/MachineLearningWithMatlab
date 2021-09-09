function [w, wt, Et] = logistic_loss_gradient_descent(X, y, w_init, epsilon)
% [w, wt, Et] = logistic_loss_gradient_descent(X, y, w_init, epsilon)
%
%   Performs gradient descent optimization of the logistic loss function.
%
%   Parameters:
%       X - d-dimensional observations of size [d, number_of_observations]
%       y - labels of the observations of size [1, number_of_observations]
%       w_init - initial weights of size [d, 1]
%       epsilon - parameter of termination condition: norm(w_new - w_prev) <= epsilon
%
%   Return:
%       w - resulting weights
%       wt - progress of weights (of size [d, number_of_accepted_candidates])
%       Et - progress of logistic loss (of size [1, number_of_accepted_candidates])

wt = w_init;
w = w_init;
step_size = 1;

E = logistic_loss(X, y, w);
g = logistic_loss_gradient(X, y, w);
Et = [E];

while size(wt,2) == 1
    E_new = logistic_loss(X, y, w-step_size*g);
    g_new = logistic_loss_gradient(X, y, w-step_size*g);
    if E_new < E
        w = w - step_size*g;
        wt = [wt, w];
        g = g_new;
        Et = [Et, E_new];
        step_size = step_size*2;
    else
        step_size = step_size/2;
    end
    
end
    
while  norm(wt(:,end) - wt(:,end-1)) > epsilon
    E_new = logistic_loss(X, y, w-step_size*g);
    g_new = logistic_loss_gradient(X, y, w-step_size*g);
    
    if E_new < E
        w = w - step_size*g;
        wt = [wt, w];
        g = g_new;
        E = E_new;
        Et = [Et, E];
        step_size = step_size*2;
    else
        step_size = step_size/2;
    end
end



