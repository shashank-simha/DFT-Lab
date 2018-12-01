clc;
clear all;
close all;

rp = input('Enter pass band ripple: ');
rs = input('Enter stop band ripple: ');
fp = input('Enter pass band frequency LPF and HPF: ');
fs = input('Stop band frequency LPF and HPF: ');
fp1 = input('Enter pass band frequency for BPF and BSF: ');
fs1 = input('Stop band frequency BPF and BSF: ');
f = input('sampling frequency: ');
fprintf('Enter your choice of window function \n1.Rectangular\n2.triangular\n3.kaiser\n')
c = input('');
wp = 2.*fp./f;
ws = 2.*fs./f;
wp1 = 2.*fp1./f;
ws1 = 2.*fs1./f;

num = 20*log10(sqrt(rp*rs))-13;
den = 14.6*(fs-fp)./f;
n = ceil(num/den);
n1 = n+1;

if(rem(n,2)~=0)
    n1 = n;
    n = n-1;
end
if (c==1)
    y = rectwin(n1);
    disp('rect window response');
end
if (c==2)
    y = triang(n1);
    disp('Triangular window response');
end
if (c==3)
    y = kaiser(n1);
    disp('Kaiser window response');
end

fprintf('Enter your choice for type of filters\n1. LPF and HPF\n2. BPF and BSF\n')
d = input('')

if (d==1)
    b0 = fir1(n,wp,y);
    [h,om0] = freqz(b0,1,256);
    m0 = 20*log10(abs(h));
    subplot(2,1,1);
    plot(om0/pi,m0)

    b = fir1(n,wp,'high',y);
    [h,om] = freqz(b,1,256);
    m = 20*log10(abs(h));
    subplot(2,1,2)
    plot(om/pi,m)
end

if (d==2)
    wn=[wp1 ws1]
    b1 = fir1(n,wn,'bandpass',y);
    [h,om1] = freqz(b1,1,256);
    m1 = 20*log10(abs(h));
    subplot(2,1,1)
    plot(om1/pi,m1)

     b2 = fir1(n,wn,'stop',y);
     [h,om2] = freqz(b2,1,256);
     m2 = 20*log10(abs(h));
     subplot(2,1,2)
     plot(om2/pi,m2)
end
