function [Error]=Error_calculator(hn)
rng(1)
N=10^6;
bits = randi([0,1],1,N);
count=0;
for i=1:1:length(bits)
    count=count+1;
    if(bits(i)==0)
    modulated_symbols(count)=-1;
    else
    modulated_symbols(count)=1;
    end
end
T=1;
Fs=10;
L=T*Fs;
temp0 = upsample(modulated_symbols,L); 
temp0 = temp0(1:end-(L-1)); 

transmitted_signal=conv(temp0,hn);



SNR_db=0:1:10;
n = 1./(10.^(SNR_db./10));



for i=1:1:11
noise(i,:)=((n(i)./2).^(0.5)).*randn(1,length(transmitted_signal));
received_signal(i,:)=noise(i,:)+transmitted_signal;
end




%sample_detecting
T_sampling = 6*L+1:L:(N+6-1)*L+1;
for i=1:1:11
samples(i,1:length(T_sampling))=received_signal(i,T_sampling);

end

threshold=0;
for i=1:1:11 
    row_sample=samples(i,:);
    for j=1:1:length(samples(1,:))
    if(row_sample(j)<threshold)
    detected_symbols(i,j)=-1;
    else if(row_sample(j)>threshold)
    detected_symbols(i,j)=1;
        end
    end  
    end  
end


%Error_calculating

count=0;
idx=0;
for i=1:1:11
    idx=idx+1;
for j=1:1:length(modulated_symbols)
if(modulated_symbols(j) ~= detected_symbols(i,j))
    count=count+1;
end

end
data_number_of_error(idx)=count;
count=0;
end

Error=data_number_of_error/N;

end