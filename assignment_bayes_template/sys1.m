clc; clear;
Ke = 0.1;
Kt = 0.1;
La = 1e-3;
Ra = 0.1;
J = 0.1;
B = 0.1;

wcc = 1000*2*pi;
Kp = wcc*La;
Ki = wcc*Ra;


wsc = wcc/20;
Kps = wsc*J;
Kss = wsc*B;


tau_cc = 1/wcc
tau_sc = 1/wsc
%controller
z1 = -20;
z2 = -150;
K = 0.114;

% s = tf('s');
% Gp = Kt / ((s*La+Ra)*(s*J+B)+Kt*Ke);
% %controller = ((s*La+Ra)*(s*J+B)+Kt*Ke) / Kt;
% Gc = K*(s-z1)*(s-z2)/s;
% 
% % figure();
% % subplot(2,1,1);
% % bode(sys*controller);
% % subplot(2,1,2);
% % step(sys*controller);
% figure(1);
% %pole - x zero - o
% subplot(3,1,1);
% pzplot(Gp);
% subplot(3,1,2);
% pzplot(Gc);
% subplot(3,1,3);
% rlocus(Gp*Gc);
% 
% sys = Gc*Gp/(1+Gc*Gp);
% figure(2);
% subplot(2,1,1);
% bode(sys);
% subplot(2,1,2);
% step(sys);
