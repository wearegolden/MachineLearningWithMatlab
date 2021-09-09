function labels = classify_discrete(img, q)
% label = classify_discrete(imgs, q)
%
%   Classify images using discrete measurement and strategy q.
%
%   Parameters:
%       images - test set images, <h x w x n>
%       q - strategy <1 × 21> vector of 1 or 2
%
%   Return:
%       label - image labels, <1 x n>
measurements_discrete = compute_measurement_lr_discrete(img) + 11;
for k = 1: size(measurements_discrete,1)
    labels(k) = q(measurements_discrete(k));
end

end
