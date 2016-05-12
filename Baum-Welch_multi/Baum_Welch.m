function [ A,B,pi,ln_gamma ] = Baum_Welch(Observe,num_states, num_iter,A_init,B_init,pi_init)
%this function implements the Baum_Welch algorithm when the each state is
%presumably a Gaussian distribution
l = size(Observe,1);
m = num_states;
A = A_init;
B = B_init;
pi = pi_init;


for i = 1:num_iter
    disp(i);
    [ln_gamma,ln_xi] = forward_backward_algorithm(A,B,pi,Observe);
    ln_gamma(find(ln_gamma == -Inf)) = -1000;
    %update of A based on MLE
    temp = zeros(m,m);
    for j = 1:m
            for k= 1:m
                temp(j,k) = ln_xi(1,j,k);
            end  
    end
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
    A = bsxfun(@minus,A,ln_sum_matrix(ln_gamma,1)');
    A = exp(A);
    A = bsxfun(@rdivide, A, sum(A,2));
    %update of B based on MLE
    %update of mu
%     index_Observe_nonNaN = 6:6:size(Observe,1);
%     B(:,1) =   ln_sum_matrix(bsxfun(@plus, ln_gamma, log(Observe(:,1))),1)-ln_sum_matrix(ln_gamma,1);
%     B(:,1) = exp(B(:,1));
%     B(:,2) =   ln_sum_matrix(bsxfun(@plus, ln_gamma(index_Observe_nonNaN,:), log(Observe(index_Observe_nonNaN,2))),1)-ln_sum_matrix(ln_gamma,1);
%     B(:,2) = exp(B(:,2));
%     %update of sigma
%     index_Observe_2 = 6:6:size(Observe,1);
%     %ln_gamma_both_Observe = zeros(size(ln_gamma,1)/6,2);
%     
%     B(:,3) =   ln_sum_matrix(bsxfun(@plus, ln_gamma, log(bsxfun(@minus,Observe(:,1),B(:,1)').^2)),1)-ln_sum_matrix(ln_gamma,1);
%     B(:,3) = exp(B(:,3));
%     B(:,6) =   ln_sum_matrix(bsxfun(@plus, ln_gamma(index_Observe_2,:), log(bsxfun(@minus,Observe(index_Observe_2,2),B(:,2)').^2)),1)-ln_sum_matrix(ln_gamma(index_Observe_2,:),1);
%     B(:,6) = exp(B(:,6));
%     %B(:,4) =   ln_sum_matrix(bsxfun(@plus, ln_gamma(index_Observe_2,:), log(bsxfun(@minus,Observe(index_Observe_2,1),B(:,1)'))+log(bsxfun(@minus,Observe(index_Observe_2,2),B(:,2)'))  ),1)-ln_sum_matrix(ln_gamma(index_Observe_2,:),1);
%     %B(:,4) = exp(B(:,4));
%     B(:,4) =   sum(bsxfun(@times, exp(ln_gamma(index_Observe_2,:)), bsxfun(@minus,Observe(index_Observe_2,1),B(:,1)').*bsxfun(@minus,Observe(index_Observe_2,2),B(:,2)')),1)./sum(exp(ln_gamma(index_Observe_2,:)),1);
%     B(:,5) = B(:,4);

    %update of mu
    B(:,1) =   ln_sum_matrix(bsxfun(@plus, ln_gamma, log(Observe(:,1))),1)-ln_sum_matrix(ln_gamma,1);
    B(:,1) = exp(B(:,1));
    B(:,2) =   ln_sum_matrix(bsxfun(@plus, ln_gamma, log(Observe(:,2))),1)-ln_sum_matrix(ln_gamma,1);
    B(:,2) = exp(B(:,2));
    B(:,3) =   ln_sum_matrix(bsxfun(@plus, ln_gamma, log(bsxfun(@minus,Observe(:,1),B(:,1)').^2)),1)-ln_sum_matrix(ln_gamma,1);
    B(:,3) = exp(B(:,3));
    B(:,6) =   ln_sum_matrix(bsxfun(@plus, ln_gamma, log(bsxfun(@minus,Observe(:,2),B(:,2)').^2)),1)-ln_sum_matrix(ln_gamma,1);
    B(:,6) = exp(B(:,6));
    B(:,4) =   sum(bsxfun(@times, exp(ln_gamma), bsxfun(@minus,Observe(:,1),B(:,1)').*bsxfun(@minus,Observe(:,2),B(:,2)')),1)./sum(exp(ln_gamma),1);
    B(:,5) = B(:,4);


    %update of sigma
    
%     disp(B(1,3:6))
%     disp(B(2,3:6))
%     disp(B(3,3:6))
%     for j = 1:size(B,1)
%         temp = nearestSPD(vec2mat(B(j,3:6),2)*1e5);
%         B(j,3:6) = temp(:)*1e-5;
%     end
%     disp(B(1,3:6))
%     disp(B(2,3:6))
%     disp(B(3,3:6))
end

end

