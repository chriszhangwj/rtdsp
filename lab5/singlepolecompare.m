% % b=[1/17,1/17];
% % a=[-5/17];
% % n=1024;
% % figure;
% % [h,w]=freqz(b,a,n);
% % plot(w*8000/(2*pi),20*log10(abs(h)));
% R=1000;
% C=10^(-6);
% % figure;
% 
% 
% [h,w] = freqs([1],[1000*10^-6 1]);
% M = mag2db (abs(h));
% Ph = angle (h);
% data = xlsread('singlepolegain.xlsx');
% 
% 
% plot(w, M, 'b'); % plots only the magnitudes
% 
% freqs = data(:,1); % These 2 lines depend on how your data is formatted
% gains = data(:,2); % These 2 lines depend on how your data is formatted
% 
% hold on % will add new content to the existing figure without erasing the previous content
% plot(freqs, gains, 'r');
% hold off 

%analogue
C=1e-6;
R=1000;
Ha=tf(1,[R*C 1]);
options=bodeoptions;
options.FreqUnits='Hz';
[maga,phasea,wouta]=bode(Ha,options);
maga=squeeze(maga);
phasea=squeeze(phasea);
wouta=squeeze(wouta);
fouta=wouta/(2*pi);
maga=20*log10(maga);

%digital
fs=8000;
b=[1/17,1/17];
a=[1 -15/17];
n=1024;
[h,w]=freqz(b,a,n,fs);

%actual
A=xlsread('allpassgain');
B=xlsread('allpassphase');
C=xlsread('singlepolegain');
D=xlsread('singlepolephase');
corrected_gain=C(:,2)-A(:,2);
corrected_phase=D(:,2)-B(:,2);

figure;
subplot(2,1,1);
plot(fouta,maga);
hold on;
plot(w,20*log10(abs(h)));
plot(A(:,1),corrected_gain);%actual magnitude response
hold off;
legend('Analogue filter','Desgined digital filter','Implemented digital filter');
xlim([0 4000]);
title('Magnitude response');
xlabel('Frequency(Hz)');
ylabel('Magnitude(dB)');
grid on;
grid minor;

subplot(2,1,2);
plot(fouta,phasea);
hold on;
plot(w,radtodeg(angle(h)));
plot(B(:,1),corrected_phase); %actual phase response
hold off;
legend('Analogue filter','Desgined digital filter','Implemented digital filter');
xlim([0 4000]);
title('Phase response');
xlabel('Frequency(Hz)');
ylabel('Phase(degree)');
grid on;
grid minor;







