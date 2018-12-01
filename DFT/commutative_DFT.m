clc;
clear all;
close all;

x1 = input('First Sequece');
x2 = input('Second Sequece');

disp(conv(x1,x2));
disp(conv(x2,x1));