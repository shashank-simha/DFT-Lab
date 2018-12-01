clc;
clear all;

N = input('Enter n')
w = zeros(N,N)
x = [1;2;3;4]

for k=1:N
  for n=1:N
    w(k,n) = exp((k-1) * (-1i*(2*pi/N)) *  (n-1)) 
  end
end

y = w*x
disp(y);