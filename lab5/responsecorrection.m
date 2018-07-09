% A=xlsread('allpassgain');
% B=xlsread('allpassphase');
% % figure;
% % plot(A(:,1),A(:,2));
% % figure;
% % plot(B(:,1),B(:,2));
% C=xlsread('singlepolegain');
% D=xlsread('singlepolephase');
% % figure;
% % plot(A(:,1),C(:,2));
% % figure;
% % plot(B(:,1),D(:,2));
% 
% corrected_gain=C(:,2)-A(:,2);
% corrected_phase=D(:,2)-B(:,2);
% 
% figure;
% plot(A(:,1),corrected_gain);
% grid on;
% grid minor;
% title('Corrected magnitude response');
% xlabel('Frequency(Hz)');
% ylabel('Magnitude(dB)');
% hline = refline([0 -3]);
% hline.Color = 'r';
% xlim([0 200]);
% ylim([-5 0]);
% 
% 
% figure;
% plot(B(:,1),corrected_phase);
% grid on;
% grid minor;
% title('Corrected phase response');
% xlabel('Frequency(Hz)');
% ylabel('Phase(degree)');


% 
order=[2,4,6,8,10,12,14,16,18,20];
cycles_nontrans_no=[397,655,913,1171,1429,1687,1945,2203,2461,2719];
plot(order,cycles_nontrans_no);
title('Instruction cycles against filter order');
xlabel('Order');
ylabel('Number of instruction cycles')
grid on;
grid minor;
hold on;
cycles_nontrans_o2=[146,210,274,338,402,466,530,594,658,722];
plot(order,cycles_nontrans_o2);
legend('No optimisation','-O2');

figure;
cycles_trans_no=[174,286,398,510,622,734,846,958,1070,1182];
hold on;
grid on;
grid minor;
plot(order,cycles_trans_no);
title('Instruction cycles against order');
xlabel('Order');
ylabel('Number of instruction cycles')
cycles_trans_o2=[114,178,242,306,370,434,498,562,626,690];
plot(order,cycles_trans_o2);
legend('No optimisation','-O2');



figure;
order=[2,4,6,8,10,12,14,16,18,20];
cycles_nontrans_no=[397,655,913,1171,1429,1687,1945,2203,2461,2719];
cycles_trans_no=[174,286,398,510,622,734,846,958,1070,1182];
plot(order,cycles_nontrans_no);
hold on;
plot(order,cycles_trans_no);
grid on;
grid minor;
title('Comparison of instruction cycles(no optimisation)');
xlabel('Order');
ylabel('Number of instruction cycles');
legend('Non-tranposed','Transposed');


figure;
order=[2,4,6,8,10,12,14,16,18,20];
cycles_nontrans_no=[146,210,274,338,402,466,530,594,658,722];
cycles_trans_no=[114,178,242,306,370,434,498,562,626,690];
plot(order,cycles_nontrans_no);
hold on;
plot(order,cycles_trans_no);
grid on;
grid minor;
title('Comparison of instruction cycles(-O2)');
xlabel('Order');
ylabel('Number of instruction cycles');
legend('Non-tranposed','Transposed');
