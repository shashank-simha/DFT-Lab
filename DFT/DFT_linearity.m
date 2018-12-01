clc;
close all;
clear all;

N = input('Enter the number of DFT points?');
x1=input('Enter the first sequence = ');
x2=input('Enter the second sequence = ');
a=input('Enter the first constant a = ');
b=input('Enter the second constant b = ');

n1=length(x1);
n2=length(x2);
c=zeros(N);

x1=[x1 zeros(1,N-n1)];
x2=[x2 zeros(1,N-n2)];
x3=a*x1
x4=b*x2
x5=x3+x4 

%generating DFT matrix
for k=1:N
     for n=1:N
         w=exp((-2*pi*i*(k-1)*(n-1))/N);         
         x(n)=w;
     end
     c(k,:)=x;  
end             
                

 r1=c*x1';   
 r2=c*x2';   
 R3=a*r1+b*r2 
 R4=c*x5'     
 
subplot(2,1,1)
stem(abs(R4));
title('LHS');
subplot(2,1,2)
stem(abs(R3));
title('RHS');
