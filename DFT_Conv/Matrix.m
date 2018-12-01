clc;
close all;
clear all;

N=input('Enter the number of DFT points');
x=input('Enter the sequence: ');

n=length(x);
c=zeros(N);
x=[x zeros(1,N-n)];

%DFT matrix
for k=1:N
    for l=1:N
        w=exp((-2*pi*i*(k-1)*(l-1))/N);
        z(l)=w;
    end
    c(k,:)=z;
end

y = c*x';
disp(y);