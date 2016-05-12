function [ res ] = selective_pdf( o1,o2,B )
%o1 would definitely be a number while o2 could be an NaN.
if(isnan(o2))
    res = normpdf(o1,B(:,1),sqrt(B(:,3)));
else 
    res = zeros(size(B,1),1);
    for i = 1:length(res)
        res(i) = mvnpdf([o1;o2],B(i,1:2)',vec2mat(B(i,3:6),2));
    end
end

end

