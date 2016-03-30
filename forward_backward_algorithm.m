function [ gamma, xi ] = forward_backward_algorithm( A,B,pi,Observe )
%This is the function to caculate some variables that are needed in
%Baum-Welch algorithm using forward-backward algorithm

alpha = forward_algorithm( A,B,pi,Observe );
beta = backward_algorithm( A,B,pi,Observe );
gamma = alpha.*beta;
gamma = bsxfun(@rdivide,gamma,sum(gamma,2));

[m,n] = size(B);
l = length(Observe);
xi = zeros(l-1,m,m);
for t = 1:l-1
    %numerator
    xi(t,:,:) = alpha(t,:)'*(normpdf(Observe(t+1),B(:,1),B(:,2))'.*beta(t+1,:)).*A;
    %denominator
    xi(t,:,:) = xi(t,:,:)/sum(xi(t,:));
end

end

