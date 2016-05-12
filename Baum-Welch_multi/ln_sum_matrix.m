function [ output ] = ln_sum_matrix( input_matrix,dimension )
%implements the log_sum for specific dimension
%if dimension=1, the log_sum is performed on every column
%if dimension=2, the log_sum is performed on every row
if dimension == 1
    output = zeros(size(input_matrix,2),1);
    for i= 1: size(input_matrix,2)
        output(i) = ln_sum_multi(input_matrix(:,i));
    end
    
end
if dimension == 2
    output = zeros(size(input_matrix,1),1);
    for i= 1:size(input_matrix,1)
        output(i) = ln_sum_multi(input_matrix(i,:)); 
    end
    
    
end


end

