clc; clear;

%r=0.1:0.01:0.2 interest on a loan is vectorized
A=input('insert a number A:');
n=input('insert a number n:');
k=input('insert a number k:');
r=input('insert a number r:');
%keyboad;
P = (r*A*(1+(r/n))^(n*k))/(n*(((1+(r/n))^(n*k))-1));
%P = r*A.*(1+r/n).^(n*k) ./ (n*((1+r/n).^(n*k)-1));

disp(P)
%disp(P.');
%disp(P.'*n*k-A); %overpayment
