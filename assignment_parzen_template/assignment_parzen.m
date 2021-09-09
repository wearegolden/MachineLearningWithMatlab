% Assigment: PARZEN WINDOW ESTIMATION

%% init
load data_33rpz_parzen.mat

%run('../../../../solutions/3rdparty/stprtool/stprpath.m')

%% Tasks, part 1
%% measurements
x = compute_measurement_lr_cont(trn.images);

% splitting the trainning data into classes
xA = x(find(trn.labels == 1));
xC = x(find(trn.labels == 2));

%% computing the histograms of training data
[bins_A centers_A] = hist(xA,20);
bins_A = bins_A / (sum(bins_A)*(centers_A(2)-centers_A(1)));

[bins_C centers_C] = hist(xC,20);
bins_C = bins_C / (sum(bins_C)*(centers_C(2)-centers_C(1)));

%% estimating conditional probability using Parzen window
x_range = min(xA):100:max(xA);
h = [100 500 1000 2000];
p1 = my_parzen(x_range, xA, h(1));
p2 = my_parzen(x_range, xA, h(2));
p3 = my_parzen(x_range, xA, h(3));
p4 = my_parzen(x_range, xA, h(4));

%% plots of the estimates
figure;
% h = 100
subplot(2,2,1);
bar(centers_A, bins_A);
hold on;
plot(x_range, p1, 'r', 'linewidth', 2);
title('h = 100');
xlabel('x');
ylabel('p(x|A)');
ylim([0 4.5e-4]);
grid on;
% h = 300
subplot(2,2,2);
bar(centers_A, bins_A);
hold on;
plot(x_range, p2, 'r', 'linewidth', 2);
title('h = 500');
xlabel('x');
ylabel('p(x|A)');
ylim([0 4.5e-4]);
grid on;
% h = 1000
subplot(2,2,3);
bar(centers_A, bins_A);
hold on;
plot(x_range, p3, 'r', 'linewidth', 2);
title('h = 1000');
xlabel('x');
ylabel('p(x|A)');
ylim([0 4.5e-4]);
grid on;
% h = 3000
subplot(2,2,4);
bar(centers_A, bins_A);
hold on;
plot(x_range, p4, 'r', 'linewidth', 2);
title('h = 2000');
xlabel('x');
ylabel('p(x|A)');
ylim([0 4.5e-4]);
grid on;
 %% Tasks, part 2
%% 10-fold cross-validation init
h_range = 100:50:1000;
num_folds = 10;

%% class A cross-validation
rand('seed', 42);   % needed only for upload system, to test the correctness of the code

[itrn,itst]=crossval(size(xA,2),num_folds);

Lh1 = compute_Lh(itrn, itst, xA, 100);
Lh2 = compute_Lh(itrn, itst, xA, 150);
Lh3 = compute_Lh(itrn, itst, xA, 200);
Lh4 = compute_Lh(itrn, itst, xA, 250);
Lh5 = compute_Lh(itrn, itst, xA, 300);
Lh6 = compute_Lh(itrn, itst, xA, 350);
Lh7 = compute_Lh(itrn, itst, xA, 400);
Lh8 = compute_Lh(itrn, itst, xA, 450);
Lh9 = compute_Lh(itrn, itst, xA, 500);
Lh10 = compute_Lh(itrn, itst, xA, 550);
Lh11 = compute_Lh(itrn, itst, xA, 600);
Lh12 = compute_Lh(itrn, itst, xA, 650);
Lh13 = compute_Lh(itrn, itst, xA, 700);
Lh14 = compute_Lh(itrn, itst, xA, 750);
Lh15 = compute_Lh(itrn, itst, xA, 800);
Lh16 = compute_Lh(itrn, itst, xA, 850);
Lh17 = compute_Lh(itrn, itst, xA, 900);
Lh18 = compute_Lh(itrn, itst, xA, 950);
Lh19 = compute_Lh(itrn, itst, xA, 1000);
%% optimal value of parameter h

h_bestA = fminbnd(@(zz) -compute_Lh(itrn,itst,xA,zz), 100, 1000); 
Lh_bestA = compute_Lh(itrn,itst,xA,h_bestA);

%% plots of optimal h
figure;
subplot(1,2,1);
plot(h_range, [Lh1 Lh2 Lh3 Lh4 Lh5 Lh6 Lh7 Lh8 Lh9 Lh10 Lh11 Lh12 Lh13 Lh14 Lh15 Lh16 Lh17 Lh18 Lh19]);
hold on;
plot(h_bestA, Lh_bestA,'or');
cur_ylim = get(gca, 'ylim');
plot([h_bestA h_bestA], [cur_ylim(1) Lh_bestA], '--r');
title('10-fold cross-validation');
xlabel('h');
ylabel('L(h)');
grid on;

p = my_parzen(x_range, xA, h_bestA);
subplot(1,2,2);
bar(centers_A, bins_A);
hold on;
plot(x_range, p, 'r', 'linewidth', 2);
grid on;
title('Best bandwidth h for class A');
xlabel('x');
ylabel('p(x|A)');

%% class C cross-validation
rand('seed', 42);   % needed only for upload system, to test the correctness of the code

[itrn,itst]=crossval(size(xC,2),num_folds);
Lh1 = compute_Lh(itrn, itst, xC, 100);
Lh2 = compute_Lh(itrn, itst, xC, 150);
Lh3 = compute_Lh(itrn, itst, xC, 200);
Lh4 = compute_Lh(itrn, itst, xC, 250);
Lh5 = compute_Lh(itrn, itst, xC, 300);
Lh6 = compute_Lh(itrn, itst, xC, 350);
Lh7 = compute_Lh(itrn, itst, xC, 400);
Lh8 = compute_Lh(itrn, itst, xC, 450);
Lh9 = compute_Lh(itrn, itst, xC, 500);
Lh10 = compute_Lh(itrn, itst, xC, 550);
Lh11 = compute_Lh(itrn, itst, xC, 600);
Lh12 = compute_Lh(itrn, itst, xC, 650);
Lh13 = compute_Lh(itrn, itst, xC, 700);
Lh14 = compute_Lh(itrn, itst, xC, 750);
Lh15 = compute_Lh(itrn, itst, xC, 800);
Lh16 = compute_Lh(itrn, itst, xC, 850);
Lh17 = compute_Lh(itrn, itst, xC, 900);
Lh18 = compute_Lh(itrn, itst, xC, 950);
Lh19 = compute_Lh(itrn, itst, xC, 1000);

%% optimal value of parameter h
h_bestC = fminbnd(@(zz) -compute_Lh(itrn,itst,xC,zz), 100, 1000); 
Lh_bestC = compute_Lh(itrn,itst,xC,h_bestC);

%% plots of optimal h
figure;
subplot(1,2,1);
plot(h_range, [Lh1 Lh2 Lh3 Lh4 Lh5 Lh6 Lh7 Lh8 Lh9 Lh10 Lh11 Lh12 Lh13 Lh14 Lh15 Lh16 Lh17 Lh18 Lh19]);
hold on;
plot(h_bestC, Lh_bestC,'or');
title('10-fold cross-validation');
xlabel('h');
ylabel('L(h)');
grid on;

p = my_parzen(x_range, xC, h_bestC);
subplot(1,2,2);
bar(centers_C, bins_C);
hold on;
plot(x_range, p, 'r', 'linewidth', 2);
grid on;
title('Best bandwidth h for class C');
xlabel('x');
ylabel('p(x|C)');

%% Bayesian classifier
rand('seed', 42); 
x_test = compute_measurement_lr_cont(tst.images);

% computing a priori probabilities

pA = estimate_prior(1,tst.labels);
pC = estimate_prior(2,tst.labels);

labels = classify_bayes_parzen(x_test, xA, xC, pA, pC, h_bestA, h_bestC);
% showing images
show_classification(tst.images, labels, 'AC'); 

% classification error
bayes_error = size(find(tst.labels ~= labels),2) / size(tst.labels,2)
