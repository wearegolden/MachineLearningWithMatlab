function label = classify_2normal(imgs, q)
% label = classify_2normal(imgs, q)
%
%   Classify images using continuous measurement and strategy q.
%
%   Parameters:
%       images - test set images, <h x w x n>
%       q - strategy
%               q.t1 q.t2 - two descision thresholds 
%               q.decision - 3 decisions for intervals (-inf, t1>, (t1, t2>, (t2, inf)
%                            shape <1 x 3>
%
%   Return:
%       label - image labels, <1 x n>
measurements_cont = compute_measurement_lr_cont(imgs);
for k = 1: size(measurements_cont,2)
    if measurements_cont(k)<q.t1
        label(k) = q.decision(1);
    elseif measurements_cont(k)>=q.t2
        label(k) = q.decision(3);
    else    
        label(k) = q.decision(2);
    end
end
