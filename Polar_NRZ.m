ft= zeros(1,100002);
for k= 1:150
    n=randi([0,1] , [1,100]);
    for i = 1:length(n)
        if n(i)==1
            n(i)=1;
        else
            n(i)=-1;
        end
    end
    bitrate=1;
    i=1;
    ts=0.001;
    T=length(n);
    N=ceil(T/ts);
    t=0:ts:(T*bitrate)+ts;
    df=(1000)/length(t);
    fs=1/ts;
    if (rem(N,2)==0) %even example:(8/2=4---> reminder=0 --> 8 is even)
        f=- (0.5 * fs) : df : (0.5*fs - df) ; % frequency vector if x/f is even
    else %odd example:(9/2=4.5---> reminder!=0 -->9 is odd)
        f=- (0.5*fs-0.5*df) : df : (0.5*fs -0.5*df) ;% frequency vector if x/f is odd
    end
    for j=1:length(t)
        if t(j)<=bitrate
            y(j)=n(i);
        else
            y(j)=n(i);
            i=i+1;
            bitrate=bitrate+1;
        end
    end
    M = fftshift (fft (y))*ts ; % *1/N periodic signal, *ts for non periodic signal
    ft=ft+M;
end
figure(1)
subplot(3,1,1);
plot(t,y,'r');
axis([0 100 -(1.5) (1.5)]);
xlabel('Time axis');
ylabel('Amplitude');
title('polar NRZ');
subplot(3,1,2);
plot(f,(abs(ft))./150);
xlabel('frequancy axis');
ylabel('Amplitude');
title('polar NRZ');
subplot(3,1,3);
plot(f,(abs(ft).^2)./150);
xlabel('frequancy axis');
ylabel('Amplitude');
title('polar NRZ PSD');
