% part 1 Generating Raised cosine 
SNR_db=0:1:10;
T=1;
fs=10;
t1 =(-6*T:T/fs:6*T);
t2 =t1-0.1*T;
t3 =t1-0.2*T; 

[ht_1 , ht_2, ht_3]=pulse_generator(0.5);
figure(1)
subplot(1,3,1);
plot(t1,ht_1);
title('Pulse with error =0');
subplot(1,3,2);
plot(t2,ht_2);
title('Pulse with error =0.1T');
subplot(1,3,3);
plot(t3,ht_3);
title('Pulse with error =0.2T');



%Final part Ploting the Error based on SNR and for different values of Beta 


[ht1_1 , ht1_2, ht1_3]=pulse_generator(0);
[ht2_1 , ht2_2, ht2_3]=pulse_generator(0.5);
[ht3_1 , ht3_2, ht3_3]=pulse_generator(1);

[Error1_1]=Error_calculator(ht1_1);
[Error2_1]=Error_calculator(ht1_2);
[Error3_1]=Error_calculator(ht1_3);

[Error1_2]=Error_calculator(ht2_1);
[Error2_2]=Error_calculator(ht2_2);
[Error3_2]=Error_calculator(ht2_3);

[Error1_3]=Error_calculator(ht3_1);
[Error2_3]=Error_calculator(ht3_2);
[Error3_3]=Error_calculator(ht3_3);



figure(2)
semilogy(SNR_db,Error1_1,'-o',SNR_db,Error2_1,'-*',SNR_db,Error3_1,'-s')
grid on
title('The BER Performance of Binary PAM For \beta=0');
ylabel('Bit Error Rate')
xlabel('E_b/\eta in dB');
legend({'Ideal Sampling','Sampling Error =0.1T','Sampling Error =0.2T'},'FontSize',12)

figure(3)
semilogy(SNR_db,Error1_2,'-o',SNR_db,Error2_2,'-*',SNR_db,Error3_2,'-s')
grid on
title('The BER Performance of Binary PAM For \beta=0.5');
ylabel('Bit Error Rate')
xlabel('E_b/\eta in dB');
legend({'Ideal Sampling','Sampling Error =0.1T','Sampling Error =0.2T'},'FontSize',12)

figure(4)
semilogy(SNR_db,Error1_3,'-o',SNR_db,Error2_3,'-*',SNR_db,Error3_3,'-s')
grid on
title('The BER Performance of Binary PAM For \beta=1');
ylabel('Bit Error Rate')
xlabel('E_b/\eta in dB');
legend({'Ideal Sampling','Sampling Error =0.1T','Sampling Error =0.2T'},'FontSize',12)
    