% to clear the memory
clear;

% randomize the bits btw 0,1 values
n=randi([0,1],1,64);
N=length(n);

% make it Unipolar_NRZ
for i = 1:length(n)
    if n(i)==1
        n(i)=1;
    else
        n(i)=0;
    end
end

% plot the Unipolar_NRZ
figure(1)
stairs(n,'r');
axis([0 N -(1.5) (1.5)]);
xlabel('Time axis');
ylabel('Amplitude');
title('Unipolar NRZ');

% spectrum
ts=0.01;
t=0:ts:N;
df=1/N*ts;
fmax=1/ts;
f=-0.5*fmax:df: 0.5*fmax-df;
M = fftshift(fft(n)*ts) ; % *1/N periodic signal, *ts for non periodic signal

% bitrate=1;
% i=1;
% N=ceil(n_len/ts);

% if (rem(N,2)==0) %even example:(8/2=4---> reminder=0 --> 8 is even)
%     f= -(0.5 * fs) : df : (0.5*fs - df) ; % frequency vector if x/f is even
% else             %odd example:(9/2=4.5---> reminder!=0 -->9 is odd)
%     f= -0.5*(fs-df) : df : 0.5*(fs-df) ;  % frequency vector if x/f is odd
% end

% for j=1:length(t)
%     if t(j)<=bitrate
%         y(j)=n(i);
%     else
%         y(j)=n(i);
%         i=i+1;
%         bitrate=bitrate+1;
%     end
% end


figure(2)
plot(f,abs(M));
xlabel('frequancy axis');
ylabel('Amplitude');
title('Unipolar NRZ');

figure(3)
plot(f,abs(M).^2);
xlabel('frequancy axis');
ylabel('Amplitude');
title('Unipolar NRZ PSD');
