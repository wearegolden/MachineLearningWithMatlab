function labels = classify_bayes_parzen(x_test, xA, xC, pA, pC, h_bestA, h_bestC)
% labels = classify_bayes_parzen(x_test, xA, xC, pA, pC, h_bestA, h_bestC)
%
%   Classifies data using bayesian classifier with densities estimated by
%   Parzen window estimator.
%
%   Parameters:
%       x_test - data (measurements) to be classified
%       xA, xC - training data for Parzen window for class A and C
%       pA, PC - prior probabilities
%       h_bestA, h_bestC - optimal values of the kernel bandwidth
%
%   Returns:
%       labels - classification labels for x_test
 range = min(x_test):1:max(x_test);
 dA = my_parzen(range, xA, h_bestA);
 [dAMean dASigma] = mle_normal(dA);
 dC = my_parzen(range, xC, h_bestC);
 [dCMean dCSigma] = mle_normal(dC);
 
 W = [1 0 ; 0 1];
 q = find_strategy_discrete(dA, pA,dC, pC,W);
% q2 = find_strategy_2normal(dAMean,dASigma, dCMean,dCSigma, pA);
 for k = 1: size(x_test,2)
    labels(k) = q(x_test(k)-min(x_test)+1);
 end
 
 labels(labels == 1) = 3;
 labels(labels == 2) = 4;
labels(labels == 3) = 2;
labels(labels == 4) = 1;
%  for k = 1: size(x_test,2)
%     if (x_test(k))<q2.t1
%         labels(k) = q2.decision(1);
%     elseif x_test(k)>=q2.t2
%         labels(k) = q2.decision(3);
%     else    
%         labels(k) = q2.decision(2);
%     end
% end
end
