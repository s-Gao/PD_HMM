function [ out ] = ln_sum_multi( input )
%this function caclutates the log_sum of a vectoc input
m = length(input);
out = input(1);
for i = 2:m
   out = add_lns(out,input(i));
end

