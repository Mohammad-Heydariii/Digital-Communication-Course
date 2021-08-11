function [Error_ML,Error_MAP]=Error_calculation(hn)
N=10^6;
rng(1);
bits = rand(1,N);

count=0;
for i=1:1:length(bits)
    count=count+1;
    if(0<bits(i) && bits(i)<0.1)
    modulated_symbols(count)=-3;
    end
    if(0.1<=bits(i) && bits(i)<0.5)
    modulated_symbols(count)=-1;
        end
    if(0.5<=bits(i) && bits(i)<0.9)
    modulated_symbols(count)=1;
        end
    if(0.9<=bits(i) && bits(i)<1)
    modulated_symbols(count)=3;
        end
end
T=1;
Fs=10;
L=T*Fs;
temp0 = upsample(modulated_symbols,L); 
temp0 = temp0(1:end-(L-1)); 

transmitted_signal=conv(temp0,hn);



SNR_db=0:1:10;
Es=var(modulated_symbols)
n = Es./(10.^(SNR_db./10));



for i=1:1:11
noise(i,:)=((n(i)./2).^(0.5)).*randn(1,length(transmitted_signal));
received_signal(i,:)=noise(i,:)+transmitted_signal;
end




%sample_detecting
T_sampling = 6*L+1:L:(N+6-1)*L+1;
for i=1:1:11
samples(i,1:length(T_sampling))=received_signal(i,T_sampling);

end

% ML Detection

delta1_ML =-2;
delta2_ML = 0;
delta3_ML = 2;
for i=1:1:11 
    row_sample=samples(i,:);
    for j=1:1:length(samples(1,:))
    if(row_sample(j)<delta1_ML)
    detected_symbols_ML(i,j)=-3;
    end
    if(delta1_ML<=row_sample(j) && row_sample(j)<delta2_ML)
    detected_symbols_ML(i,j)=-1;
        end
    if(delta2_ML<=row_sample(j) && row_sample(j)<delta3_ML)
    detected_symbols_ML(i,j)=1;
        end
   if(delta3_ML<=row_sample(j))
    detected_symbols_ML(i,j)=3;
   end
    end  
end



count=0;
idx=0;
for i=1:1:11
    idx=idx+1;
for j=1:1:length(modulated_symbols)
if(modulated_symbols(j) ~= detected_symbols_ML(i,j))
    count=count+1;
end

end
data_number_of_error_ML(idx)=count;
count=0;
end


% MAP Detection
N0=n/2;
 
delta1_MAP =-N0*log(2)-2;
delta2_MAP = 0;
delta3_MAP = +N0*log(2)+2;
for i=1:1:11 
    row_sample=samples(i,:);
    for j=1:1:length(samples(1,:))
    if(row_sample(j)<delta1_MAP(i))
    detected_symbols_MAP(i,j)=-3;
    end
    if(delta1_MAP(i)<=row_sample(j) && row_sample(j)<delta2_MAP)
    detected_symbols_MAP(i,j)=-1;
        end
    if(delta2_MAP<=row_sample(j) && row_sample(j)<delta3_MAP(i))
    detected_symbols_MAP(i,j)=1;
        end
   if(delta3_MAP(i)<=row_sample(j))
    detected_symbols_MAP(i,j)=3;
   end
    end  
end



count=0;
idx=0;
for i=1:1:11
    idx=idx+1;
for j=1:1:length(modulated_symbols)
if(modulated_symbols(j) ~= detected_symbols_MAP(i,j))
    count=count+1;
end

end
data_number_of_error_MAP(idx)=count;
count=0;
end

Error_ML=data_number_of_error_ML/N;
Error_MAP=data_number_of_error_MAP/N;
end