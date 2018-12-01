clc;
clear all;
close all;

x1 = input('First Sequece');
x2 = input('Second Sequece');
x3 = input('Third Sequece');

z = x2+x3;
disp(conv(x1,z));
disp(conv(x1,x2)+conv(x1,x3));