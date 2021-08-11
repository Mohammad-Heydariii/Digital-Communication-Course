function [average_len]=average_length(k,Mychain)
Mychain=Mychain(1:end - mod(length(Mychain),k));
Mychain=reshape(Mychain,k,[])';
sample=unique(Mychain,'row');
Mychain_size=numel(Mychain)/k;
sample_size=numel(sample)/k;
probability=zeros(sample_size,1);
for i=1:sample_size
    probability(i)=sum(sum(Mychain==sample(i,:),2)==k);
end
probability=probability/Mychain_size;
sample=mat2cell(sample,ones(sample_size,1));
[~,average_len]=huffmandict(sample,probability);
end