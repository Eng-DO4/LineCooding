clear;
close all;
clc;

a = randi([0,1],[1,64]);
N = length(a);
figure(1)
stairs(a)
axis([-2 N+2 -1.5 1.5])
xlabel('time')
ylabel('Amp')
title('binary signal')

j=0;
for i=1:N
    if a(i)==0
        ami_sig(i)=0;
    else
        if mod(j,2)==0
            ami_sig(i)=1;
        else
            ami_sig(i)=-1;
        end
        j=j+1;
    end
end

figure(2)
stairs(ami_sig)
axis([-2 N+2 -1.5 1.5])
xlabel('time')
ylabel('Amp')
title('ami signal')


ts = ;
t =  :  : ;
df = ;
fs = ;
if (rem(N,2)==0)
    f = -0.5*fs : df : 0.5*fs-df;
else
    f = -0.5*(fs-df) : df : 0.5*(fs-df);
end
