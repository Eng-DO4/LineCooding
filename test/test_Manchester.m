clear; clc
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
T=0:0.01:length(Z);
for j=1:length(T)
    if T(j)<=L
        Y(j)=XY(i);
    else 
        Y(j)=XY(i);
        i=i+1;
        L=L+0.5;
    end
end
plot(T,Y);
axis([0 length(Z) -5 5]);xlabel('Time');
ylabel('Amplitude');title('Manchester line Code')