% RPZ assigment: Logistic regression


%% Init
%run('<path_to_stprtool>/stprpath.m');

%% Classification of letters A and C
%--------------------------------------------------------------------------
% Load training data and compute features
load ('data_33rpz_logreg.mat');

% Prepare the training data
[trainX, norm_params] = compute_measurements(trn.images);
trainX = [ones(1,1800);trainX];
% Training - gradient descent of the logistic loss function
% Start at a fixed point:
w_init = [-7; -8];
% or start at a random point:
%w_init = 20 * (rand(size(trainX, 1), 1) - 0.5);
epsilon = 1e-2;
[w, wt, Et] = logistic_loss_gradient_descent(trainX, trn.labels, w_init, epsilon);

% Plot the progress of the gradient descent
x = 1:1:20;
%plot(x,Et);
    
%
%plot_gradient_descent(trainX, trn.labels, @logistic_loss, w, wt, Et);

% plot aposteriori probabilities
thr = get_threshold(w);
x = -4:0.01:4;
N = size(trainX,2);
for k = 1:size(x,2)
    pA(k) = 1/(1+exp(-dot(w,[1,x(k)])));
    pC(k) = 1/(1+exp(dot(w,[1,x(k)])));
end
plot(x,pA,'b','linewidth', 2);
hold on;
plot(x,pC,'r','linewidth', 2);
plot(thr,0:0.1:1,'mo' ,'linewidth', 2);
legend('p(A|x)','p(C|x)');


% Prepare the test data
[testX, norm_params] = compute_measurements(tst.images);
testX = [ones(1,200);testX]; 
    
% Classify letter test data and calculate classification error
classifiedLabels = classify_images(testX, w);

testError = size(find(classifiedLabels ~= tst.labels),2) / size(tst.labels,2);
fprintf('Letter classification error: %.2f%%\n', testError * 100);

% Visualize classification results
%show_classification(tst.images, classifiedLabels, 'AC');


%% Classification of MNIST digits
%--------------------------------------------------------------------------
% Load training data
load('mnist_01_trn');

% prepare the training data
Xtrain = [ones(1,size(X,2));X];

%Xtrain = X;
% Training - gradient descent of the logistic loss function
w_init = rand(size(Xtrain, 1), 1);
epsilon = 1e-2;
[w, wtt, Et] = logistic_loss_gradient_descent(Xtrain, y, w_init, epsilon);

% Plot the progress of the gradient descent
% plotEt
    
% Load test data
load('mnist_01_tst');
Xtest = [ones(1,size(X,2));X];

% prepare the training data

% Classify MNIST test data and calculate classification error
ClassifiedLabels = classify_images(Xtest, w);
%testError = ???;
%fprintf('MNIST digit classification error: %.2f%%\n', testError * 100);

%Visualize classification results
show_mnist_classification(Xtest(2:end, :), ClassifiedLabels);
