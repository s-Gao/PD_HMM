function [ ln_gamma, ln_xi ] = forward_backward_algorithm( A,B,pi,Observe )
%This is the function to caculate some variables that are needed in
%Baum-Welch algorithm using forward-backward algorithm

ln_alpha = forward_algorithm( A,B,pi,Observe );
ln_beta = backward_algorithm( A,B,pi,Observe );
ln_gamma = bsxfun(@plus,ln_alpha,ln_beta);
ln_gamma = bsxfun(@minus,ln_gamma,ln_sum_matrix(ln_gamma,2));


[m,n] = size(B);
l = size(Observe,1);
xi = zeros(l-1,m,m);
for t = 1:l-1
    %numerator
%     xi(t,:,:) = alpha(t,:)'*(normpdf(Observe(t+1),B(:,1),B(:,2))'.*beta(t+1,:)).*A;
    ln_xi(t,:,:) = bsxfun(@plus,ln_alpha(t,:)',bsxfun(@plus,log(selective_pdf(Observe(t+1,1),Observe(t+1,2),B))',ln_beta(t+1,:)))+log(A);
    %denominator
%     xi(t,:,:) = xi(t,:,:)/sum(xi(t,:));
    ln_xi(t,:,:) = ln_xi(t,:,:) - ln_sum_multi(ln_xi(t,:));
end

end

