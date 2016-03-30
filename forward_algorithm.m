function [ alpha ] = forward_algorithm( A,B,pi,Observe )
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
if(m ~= size(A,1) || m~= size(A,2))d
    disp('wrong input');
    return ;
end
l = length(Observe);
alpha = zeros(l,m);
alpha(1,:) = pi.*normpdf(Observe(1),B(:,1),B(:,2));
for t = 2:l
    alpha(t,:) = (alpha(t-1,:)*A)'.*normpdf(Observe(t),B(:,1),B(:,2));
    alpha(t,:)
    pause;
end



end


