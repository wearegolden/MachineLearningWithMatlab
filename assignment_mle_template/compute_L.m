function L = compute_L(x, D, sigmas)
    L = -sum((x - D.Mean).^2)./(2*sigmas.^2)-size(x,2)*sum(log(sqrt(2*pi)*sigmas));
end