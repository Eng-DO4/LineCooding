clear; clc
%generate data then prepare
data=randi([0,1],[1,64]);
test_discontinuty_data = diff(data)~=0;

%prepare AMI NRZ data
sgn=1;
AMI_NRZ=zeros([1,64]);
for i=1:64
    AMI_NRZ(i)=data(i)*sgn;
    if data(i)==1
        sgn=-1*sgn;
    end
end
test_discontinuty_AMI = diff(AMI_NRZ)~=0;

%generate P NRZ data
P_NRZ=data;
for i=1:64
    if data(i)==0
        P_NRZ(i)=-1;
    end    
end
test_discontinuty_P=diff(P_NRZ)~=0;

%prepare x_axis to plot
bit=1:64;

%prepare data then plot
bit_data = repmat(bit([true,test_discontinuty_data]),2,1);
bit_data=bit_data(2:end);
data_doubled=repmat(data([true,test_discontinuty_data]),2,1);
data_doubled=data_doubled(1:end-1);
subplot(3,1,1)
plot(bit_data,data_doubled)
title('data')

%prepare AMI then plot
bit_AMI=repmat(bit([true,test_discontinuty_AMI]),2,1);
bit_AMI=bit_AMI(2:end);
AMI_doubled=repmat(AMI_NRZ([true,test_discontinuty_AMI]),2,1);
AMI_doubled=AMI_doubled(1:end-1);
subplot(3,1,2)
plot(bit_AMI,AMI_doubled,'r')
title('AMI NRZ')

%prepare polar then plot
bit_P=repmat(bit([true,test_discontinuty_P]),2,1);
bit_P=bit_P(2:end);
P_doubled=repmat(P_NRZ([true,test_discontinuty_P]),2,1);
P_doubled=P_doubled(1:end-1);
subplot(3,1,3)
plot(bit_P,P_doubled,'K')
title('P NRZ')
