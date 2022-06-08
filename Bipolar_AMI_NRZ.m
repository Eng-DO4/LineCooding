clear;
clc;
close all;
bin_sig = randi([0,1],[1,64]);

j=0;
for i = 1:length(bin_sig)
    if bin_sig(i)== 0
        bp_ami(i)= 0;
    else
        if mod(j,2)== 0
            bp_ami(i)= 1;
        else
            bp_ami(i)= -1;
        end
    j=j+1;
    end
end

figure(1)
stairs(bp_ami,'linewidth',1.5)
title('Bipolar AMI')
xlabel('Time axis')
ylabel('Amplitude')
ts=0.001;
fmax=1/ts;
df=fmax/length(bin_sig);
f=-0.5*fmax:df:0.5*fmax-df;
bp_ami_fft_shift = fftshift(fft(bp_ami))/fmax;

figure(2)
plot(f,abs(bp_ami_fft_shift))
title('Spectrum of AMI')
xlabel('Frequency axis')
ylabel('Amplitude')

figure(3)
plot(f,abs(bp_ami_fft_shift).^2)
title('PSD of AMI')
xlabel('Frequency axis')
ylabel('Amplitude')