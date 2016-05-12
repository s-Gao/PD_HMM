function [ res ] = insertData( left,right,num )
res = zeros(num,1);
part = (right - left)/(num+1);
for i = 1:num
    res(i) = left+part*i;
end
end

