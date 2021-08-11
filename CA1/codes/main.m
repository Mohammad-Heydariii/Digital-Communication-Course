
% question 11
transition_states1=[1/2 1/2 ;8/10 2/10];
count=0;
Hx=entropy(1000000,transition_states1);
mc=dtmc(transition_states1);
rng(1); % For reproducibility
numSteps = 10000;
chain = simulate(mc,numSteps);
for i=1:10
   count=count+1;
Gk(count)=entropy(i,transition_states1);
length(count)=average_length(i,chain)/i;
bazde(count)=(Hx*i)/average_length(i,chain);
Hx_new(count)=Hx
end
k=1:1:10
figure(1)
plot(k,Gk,k,length)
title('GK & average_Length');
xlabel('K');
legend('G(k)','H normalize(average_length)')

figure(2)
plot(k,bazde,k,Gk)                 %figure H(X) & code functionality in same plot
title('Bazde & G(k)');
xlabel('K');
legend('Bazde','G(k)')


% question 12


prob1 = [0.01 0.29 0.7];
probsX2 = prob1 .* prob1';
prob2 = reshape(probsX2 ,[] , 1);
probsX3 = prob2 .* prob1;
prob3 = reshape(probsX3, [] , 1);
chain1=randsrc(1,10000,[1,2,3 ; prob1])
chain2=randsrc(1,10000,[1,2,3,4,5,6,7,8,9, ; prob2'])
chain3=randsrc(1,10000,[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27 ; prob3'])

for k = 1 : 10
    DMS_G_k_x(k) = sum(-prob1 .* log2(prob1));
    DMS_G_k_xx(k) = sum(-prob2 .* log2(prob2));
    DMS_G_k_xxx(k) = sum(-prob3 .* log2(prob3));
end
DMS_G_k_x
DMS_G_k_xx
DMS_G_k_xxx
count=0;
for i=1:10
   count=count+1;
length_x(count)=average_length(i,chain1)/i;
length_xx(count)=average_length(i,chain2)/i;
length_xxx(count)=average_length(i,chain3)/i;

bazde_x(count)=(DMS_G_k_x(1)*i)/average_length(i,chain1);
bazde_xx(count)=(DMS_G_k_xx(1)*i)/average_length(i,chain2);
bazde_xxx(count)=(DMS_G_k_xxx(1)*i)/average_length(i,chain3);

end
k=1:1:10
figure(3)
plot(k,bazde_x)  
title('bazde X');
xlabel('K');

figure(4)
plot(k,length_x)  
title('length X');
xlabel('K');

figure(5)
plot(k,bazde_xx)  
title('bazde XX');
xlabel('K');

figure(6)
plot(k,length_xx)  
title('length XX');
xlabel('K');

figure(7)
plot(k,bazde_xxx)  
title('bazde XXX');
xlabel('K');

figure(8)
plot(k,length_xxx)  
title('length XXX');
xlabel('K');




