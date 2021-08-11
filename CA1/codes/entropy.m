function [G,P]=entropy(k,transition_matrix)
equations_matrix = [transpose(transition_matrix)-eye(size(transition_matrix , 1)) ; zeros(1,size(transition_matrix , 1))+1 ];
P = linsolve(equations_matrix , [zeros(size(transition_matrix,1) , 1);1]);
H_S1=-sum(P.*log2(P));
H_S2_given_S1=-sum(sum(log2(transition_matrix).*(transition_matrix .*P)));
G=(H_S1+k*H_S2_given_S1)/k;
end
