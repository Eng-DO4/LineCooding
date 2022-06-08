ft=zeros(1,640001);
for k=1:10
Z= randi([0 1],1,64);
XY=[];
for m=1:64
if Z(m)==0
h=[-1 1];
else
h=[1 -1];
end
XY=[XY h];
end
i=1;
L=0.5;
T=0:0.0001:length(Z);
df=100/640001;
ts=0.01;
fs=1/ts;
f=- (0.5*fs-0.5*df) : df : (0.5*fs -0.5*df) ;
for j=1:length(T)
if T(j)<=L;
Y(j)=XY(i);
else
Y(j)=XY(i);
i=i+1;
L=L+0.5;
end
end
M = fftshift (fft (Y))*ts ;
ft=ft+M;
end 
figure(1)
stairs(Z);
axis([0 length(Z) -5 5]);xlabel('Time');
ylabel('Amplitude');title('Manchester line Code')
figure(2)
plot(f,abs(ft)./150);
xlabel('frequancy axis');
ylabel('Amplitude');
title('Manchester line Code');
figure(3)
plot(f,(abs(ft).^2)./150);
xlabel('frequancy axis');
ylabel('Amplitude');
title('Manchester line Code');