function [ ln_beta ] = backward_algorithm( A,B,pi,Observe )
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
% beta is the output of this function. It is a l*m matrix.
[m,n] = size(B);
if(m ~= size(A,1) || m~= size(A,2))
    disp('wrong input');
    return ;
end
l = length(Observe);
ln_beta = zeros(l,m);
ln_beta(l,:) = log(ones(1,m));

t = l-1;
while t>0
ln_beta(t,:) = ln_sum_matrix(bsxfun(@plus, bsxfun(@plus,log(normpdf(Observe(t+1),B(:,1),B(:,2))),ln_beta(t+1,:)'),log(A)),1 );
%beta(t,:) = normpdf(Observe(t+1),B(:,1),B(:,2))'.*beta(t+1,:) * A;
t = t-1;
end

