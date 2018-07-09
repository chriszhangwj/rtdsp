%digital
fs=8000;
b=[9.7564943933063919e-02 ,-3.4286742699734379e-01 ,4.9110053796258113e-01 ,-3.4286742699734346e-01 ,9.7564943933063752e-02 ];
a=[1.0000000000000000e+00 ,-3.6227382800818604e+00 ,5.0638877901317390e+00 ,-3.2346102598649420e+00 ,7.9841646815527823e-01];
n=1024;
[h,w]=freqz(b,a,n,fs);

%actual
A=xlsread('allpassgain');
B=xlsread('allpassphase');
C=xlsread('nontransgain');
D=xlsread('nontransphase');
corrected_gain=C(:,2)-A(:,2);
corrected_phase=D(:,2)-B(:,2);

figure;
subplot(2,1,1);
hold on;
plot(w,20*log10(abs(h)));
plot(A(:,1),corrected_gain);%actual magnitude response
hold off;
legend('Desgined digital filter','Implemented digital filter');
xlim([0 4000]);
title('Magnitude response');
xlabel('Frequency(Hz)');
ylabel('Magnitude(dB)');
grid on;
grid minor;

subplot(2,1,2);
hold on;
plot(w,radtodeg(angle(h)));
plot(B(:,1),corrected_phase); %actual phase response
hold off;
legend('Desgined digital filter','Implemented digital filter');
xlim([0 4000]);
title('Phase response');
xlabel('Frequency(Hz)');
ylabel('Phase(degree)');
grid on;
grid minor;





