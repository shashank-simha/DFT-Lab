clc;
clear all;
close all;

N = input('Enter the numerator co-efficients: ');
D = input('Enter the denominator co-efficients: ');
S = input('Enter the number of samples: ');

imp = [1, zeros(1, S-1)];

h = filter(N,D,imp);

disp('Impulse response of second order diff eqn:');
disp(h);

n = 0:1:S-1;
figure('Name', '');
xlabel('Sampling time');
ylabel('Amplitude');
title('Impulse response of second order diff eqn');
stem(n,h);