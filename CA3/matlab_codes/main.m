SNR_db=0:1:10;
[ht1_1 , ht1_2, ht1_3]=pulse_generator(0);
[ht2_1 , ht2_2, ht2_3]=pulse_generator(0.5);
[ht3_1 , ht3_2, ht3_3]=pulse_generator(1);

[Error_ML_1_1,Error_MAP_1_1]=Error_calculation(ht1_1);
[Error_ML_2_1,Error_MAP_2_1]=Error_calculation(ht1_2);
[Error_ML_3_1,Error_MAP_3_1]=Error_calculation(ht1_3);

[Error_ML_1_2,Error_MAP_1_2]=Error_calculation(ht2_1);
[Error_ML_2_2,Error_MAP_2_2]=Error_calculation(ht2_2);
[Error_ML_3_2,Error_MAP_3_2]=Error_calculation(ht2_3);

[Error_ML_1_3,Error_MAP_1_3]=Error_calculation(ht3_1);
[Error_ML_2_3,Error_MAP_2_3]=Error_calculation(ht3_2);
[Error_ML_3_3,Error_MAP_3_3]=Error_calculation(ht3_3);

figure(1)
semilogy(SNR_db,Error_ML_1_1,'-o',SNR_db,Error_ML_2_1,'-*',SNR_db,Error_ML_3_1,'-s')
grid on
title('The BER Performance of Quaternary PAM For ML receiver \beta=0');
ylabel('Bit Error Rate')
xlabel('E_b/\eta in dB');
legend({'Ideal Sampling','Sampling Error =0.1T','Sampling Error =0.2T'},'FontSize',12)

figure(2)
semilogy(SNR_db,Error_ML_1_2,'-o',SNR_db,Error_ML_2_2,'-*',SNR_db,Error_ML_3_2,'-s')
grid on
title('The BER Performance of Quaternary PAM For ML receiver \beta=0.5');
ylabel('Bit Error Rate')
xlabel('E_b/\eta in dB');
legend({'Ideal Sampling','Sampling Error =0.1T','Sampling Error =0.2T'},'FontSize',12)

figure(3)
semilogy(SNR_db,Error_ML_1_3,'-o',SNR_db,Error_ML_2_3,'-*',SNR_db,Error_ML_3_3,'-s')
grid on
title('The BER Performance of Quaternary PAM For ML receiver \beta=1');
ylabel('Bit Error Rate')
xlabel('E_b/\eta in dB');
legend({'Ideal Sampling','Sampling Error =0.1T','Sampling Error =0.2T'},'FontSize',12)
    

figure(4)
semilogy(SNR_db,Error_MAP_1_1,'-o',SNR_db,Error_MAP_2_1,'-*',SNR_db,Error_MAP_3_1,'-s')
grid on
title('The BER Performance of Quaternary PAM For MAP receiver \beta=0');
ylabel('Bit Error Rate')
xlabel('E_b/\eta in dB');
legend({'Ideal Sampling','Sampling Error =0.1T','Sampling Error =0.2T'},'FontSize',12)

figure(5)
semilogy(SNR_db,Error_MAP_1_2,'-o',SNR_db,Error_MAP_2_2,'-*',SNR_db,Error_MAP_3_2,'-s')
grid on
title('The BER Performance of Quaternary PAM For MAP receiver \beta=0.5');
ylabel('Bit Error Rate')
xlabel('E_b/\eta in dB');
legend({'Ideal Sampling','Sampling Error =0.1T','Sampling Error =0.2T'},'FontSize',12)

figure(6)
semilogy(SNR_db,Error_MAP_1_3,'-o',SNR_db,Error_MAP_2_3,'-*',SNR_db,Error_MAP_3_3,'-s')
grid on
title('The BER Performance of Quaternary PAM For MAP receiver \beta=1');
ylabel('Bit Error Rate')
xlabel('E_b/\eta in dB');
legend({'Ideal Sampling','Sampling Error =0.1T','Sampling Error =0.2T'},'FontSize',12)
    
figure(7)
semilogy(SNR_db,Error_MAP_1_1,'-o',SNR_db,Error_ML_1_1,'-*')
grid on
title('MAP vs ML receivers \beta=0');
ylabel('Bit Error Rate')
xlabel('E_b/\eta in dB');
legend({'MAP','ML'},'FontSize',12)
    