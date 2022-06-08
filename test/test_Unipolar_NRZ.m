clear; clc
Z= randi([0 1],1,64);
for m=1:length(Z)
    if Z(m)==1
        XY(m)=1;
    else
        XY(m)=0;
    end
end
i=1;
T=0:0.01:length(Z);
for j=1:length(T)
    if T(j)<=i
    else
    i=i+1;
    end
    Y(j)=XY(i);
end
plot(T,Y);
axis([0 length(Z) -5 5]);
xlabel('Time');
ylabel('Amplitude');
title('Unipolar non-return To Zero');
