function [ht_1 , ht_2, ht_3]=pulse_generator(beta)

T = 1;
fs = 10;

t1 =(-6*T:T/fs:6*T);
t2 =t1-0.1*T;
t3 =t1-0.2*T; 



ht_1 = (sinc(t1).*cos(pi*beta*(t1)))./(1-(2*beta*(t1)).^2);
ht_1(1/(2*beta)==t1) = (pi/4)*sinc(1/(2*beta));
ht_1(-1/(2*beta)==t1) = (pi/4)*sinc(1/(2*beta));
ht_2 = (sinc(t2).*cos(pi*beta*(t2)))./(1-(2*beta*(t2)).^2);
ht_2(1/(2*beta)==(t2)) = (pi/4)*sinc(1/(2*beta));
ht_2(-1/(2*beta) == (t2)) = (pi/4)*sinc(1/(2*beta));
ht_3 = (sinc(t3).*cos(pi*beta*(t3)))./(1-(2*beta*(t3)).^2);
ht_3(1/(2*beta)==(t3)) = (pi/4)*sinc(1/(2*beta));
ht_3(-1/(2*beta)==(t3)) = (pi/4)*sinc(1/(2*beta));


end