clc;
close all;
clear all;

N=input('Enter the number of DFT points');
x1=input('Enter the sequence: ');

n2=length(x1);
c=zeros(N);
x1=[x1 zeros(1,N-n2)];

%DFT matrix
for k=1:N
    for n=1:N
        w=exp((-2*pi*i*(k-1)*(n-1))/N);
        x(n)=w;
    end
    c(k,:)=x;
end

r=c*x1';
a1=input('Enter the amount of shift in frequency domain: ');

for n=1:N
    w=exp((2*pi*i*(n-1)*(a1))/N);
    x2(n)=w;
end

r1=x2.*x1;

subplot(2,2,1);
stem(abs(r));
grid on;
title('orginal dft magnitude plot');

subplot(2,2,2);
stem(angle(r));
grid on;
title('orginal DFT angle');

disp(r);

for k=1:N
    for n=1:N
        w=exp((-2*pi*i*(k-1)*(n-1))/N);
        x(n)=w;
    end
    c(k,:)=x;
end

disp('DFT is:');
r2=c*r1';
disp(r2);

subplot(2,2,3);
stem(abs(r2));
grid on;
title('shifted DFT magnitude');

 subplot(2,2,4);
 stem(angle(r2));
 grid on;
 title('shifed DFT angle');
