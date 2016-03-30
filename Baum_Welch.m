function [ A,B,pi ] = Baum_Welch(Observe,num_states, num_iter)
%this function implements the Baum_Welch algorithm when the each state is
%presumably a Gaussian distribution
l = length(Observe);
m = num_states;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A = ones(m,m);%sum to 1
B = ones(m,2);
pi = ones(m,1);

for i = 1:num_iter
    disp(i);
    [gamma,xi] = forward_backward_algorithm(A,B,pi,Observe);
    %update of A based on MLE
    temp = sum(xi,1);
    A(:,:) = temp(1,:,:);
    A = bsxfun(@rdivide,A,sum(gamma,1)');
    %update of B based on MLE
    %update of mu
    B(:,1) = (sum(bsxfun(@times,gamma,Observe),1)./sum(gamma,1))';
    %update of sigma
    B(:,2) = sqrt((Observe'*Observe -2*sum(Observe)*B(:,1))/l + B(:,1).^2);
end


end

