function [ ln_alpha ] = forward_algorithm( A,B,pi,Observe )
%Observe size (N,2), in which the first column has all the valid data, the
%second column has some nan

%This function implements the forward algorithm
%Input is the model including A,B and pi, in which A is the state
%transition matrix, B is the output probability matrix and pi is the
%ininital state probability vector.
% A is a m*m matrix, m is the number of states, each row represents the
% transition from one state to all the other states, and each row sums to 1
% B is a m*n matrix, m is the number of states and n is the number of
% outputs, in this case, it is 2 including mu and sigma
% pi is a vector of length m representing the initial probabilities.
% Oberve is a vector of length l, representing how many outputs are there in the
% sequence
% alpha is the output of this function. It is a l*m matrix.

[m,n] = size(B);
if(m ~= size(A,1) || m~= size(A,2))
    disp('wrong input');
    return ;
end
l = size(Observe,1);
ln_alpha = zeros(l,m);
ln_alpha(1,:) = log(pi.*selective_pdf(Observe(1,1),Observe(1,2),B));
%
for t = 2:l
    log_vector = ln_sum_matrix(bsxfun(@plus,ln_alpha(t-1,:)',log(A)) ,1);%every column needs a log_sum, so log_vector is a row vector
    ln_alpha(t,:) = bsxfun(@plus,log_vector',log(selective_pdf(Observe(t,1),Observe(t,2),B))');
end



end


