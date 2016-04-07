function [ A,B,pi,ln_gamma ] = Baum_Welch(Observe,num_states, num_iter,B_init)
%this function implements the Baum_Welch algorithm when the each state is
%presumably a Gaussian distribution
l = length(Observe);
m = num_states;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

A = rand(m,m);
A = bsxfun(@rdivide, A, sum(A,2));
% B = zeros(m,2);
% %initialization for sleep state emissions
% %data from 0am - 5 am
% B(1,1) = 0.004504352724992;
% B(1,2) = 0.007392590248755;
% %initializations for on state
% %data from 1 hour after medication to 3 hours after medication in the
% %morning
% B(2,1) = 0.047343900985211;
% B(2,2) = 0.058855490356601;
% %initializations for off state
% %data from 2 hour before medication the time of medication in the evening
% B(3,1) = 0.016555671959282;
% B(3,2) = 0.023216098360503;
B = B_init;

pi = rand(m,1);
pi = bsxfun(@rdivide, pi, sum(pi));


for i = 1:num_iter
    disp(i);
%     [gamma,xi] = forward_backward_algorithm(A,B,pi,Observe);
    [ln_gamma,ln_xi] = forward_backward_algorithm(A,B,pi,Observe);
    
    %update of A based on MLE
%     temp = sum(xi,1);
    temp = zeros(m,m);
    for j = 1:m
            for k= 1:m
                temp(j,k) = ln_xi(1,j,k);
            end  
    end
    %temp(:,:) = ln_xi(1,:,:);
    for p = 2:size(ln_xi,1)
        for j = 1:m
            for k= 1:m
                if(ln_xi(p,j,k) < -1000 || isnan(ln_xi(p,j,k)) )
                    continue;
                end
                temp(j,k) = add_lns(temp(j,k),ln_xi(p,j,k));
            end  
        end
    end
    A = temp;
%     A(:,:) = temp(1,:,:);
%     A = bsxfun(@rdivide,A,sum(gamma,1)');
    A = bsxfun(@minus,A,ln_sum_matrix(ln_gamma,1)');
    A = exp(A);
    A = bsxfun(@rdivide, A, sum(A,2));
    %update of B based on MLE
    %update of mu
%     B(:,1) = (sum(bsxfun(@times,gamma,Observe),1)./sum(gamma,1))';
    B(:,1) =   ln_sum_matrix(bsxfun(@plus, ln_gamma, log(Observe)),1)-ln_sum_matrix(ln_gamma,1);
    B(:,1) = exp(B(:,1));
    %update of sigma
%     B(:,2) = sqrt((Observe'*Observe -2*sum(Observe)*B(:,1))/l + B(:,1).^2);
    %B(:,2) =  (1/2)*(ln_sum_multi(log(Observe)+log(Observe))   )
    B(:,2) = sqrt((Observe'*Observe -2*sum(Observe)*B(:,1))/l + B(:,1).^2);
end


end

