ft=zeros(1,12801);
for k=1:10000
    bitrate=1;
    bits= randi([0 1],1,64);
    T = length(bits)/bitrate; % full time of bit sequence
    n = 200;
    N = n*length(bits);
    dt = T/N;
    t = 0:dt:T;
    x = zeros(1,length(t)); % output signal
    fs=1/dt;
    df=1/(12801*dt);
    f=- (0.5*fs-0.5*df) : df : (0.5*fs -0.5*df) ;
    for i = 0:length(bits)-1
      if bits(i+1) == 1
        x(i*n+1:(i+0.5)*n) = 1;
        x((i+0.5)*n+1:(i+1)*n) = -1;
      else
        x(i*n+1:(i+0.5)*n) = -1;
        x((i+0.5)*n+1:(i+1)*n) = 1;
      end
    end
    M = fftshift (fft (x))*dt ;
    ft=ft+M;
end
figure(1)
plot(t,x);
axis([0 length(bits) -5 5]);xlabel('Time');
ylabel('Amplitude');
title('Manchester line Code')
figure(2)
plot(abs(ft));
xlabel('frequancy axis');
ylabel('Amplitude');
title('Manchester line Code')