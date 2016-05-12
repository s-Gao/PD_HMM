function [ states ] = Viterbi( A, B, pi, Observe )
m = size(A,1);
l = size(Observe,1);

log_delta = zeros(l,m);
sai = zeros(l,m);
log_delta(1,:) = log(pi.*selective_pdf(Observe(1,1),Observe(1,2),B));

for t = 2:l
    log_delta(t,:) = max(  bsxfun(@plus,bsxfun(@plus,log_delta(t-1,:)',log(A)),log(selective_pdf(Observe(t,1),Observe(t,2),B))'),[], 1);
    [~,sai(t,:)] = max(bsxfun(@plus,log_delta(t-1,:)',log(A)),[],1);
end

states = zeros(l,1);
[~,states(l)] = max(log_delta(l,:));

for s = 1:(l-1)
    states(l-s) = sai(l-s+1,states(l-s+1));
end

end

