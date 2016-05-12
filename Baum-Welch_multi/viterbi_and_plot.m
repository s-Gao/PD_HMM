function viterbi_and_plot( A,B,pi,Observe)
%UNTITLED ????????????
%   ????????
states = Viterbi( A, B, pi, Observe );

plot(1:size(Observe,1),Observe(:,1));
plot(1:size(Observe,1),Observe(:,2));

for state=1:length(pi)
    h = animatedline('Marker','.','Color','r','LineWidth',0.01);
    x =  find(Observe==state)
    y = ones(size(x)).*(state+3)*0.05
    addpoints(h,x,y)  
end
for i=1:length(Observe)
   if states(i) == 1
       h = animatedline('Marker','.','Color','r','LineWidth',0.01);
       addpoints(h,i,0.30);       
   elseif states(i) == 2
           h = animatedline('Marker','.','Color','b','LineWidth',0.01);
           addpoints(h,i,0.25);
   else
       h = animatedline('Marker','.','Color','g','LineWidth',0.01);
       addpoints(h,i,0.20);
   end    
end
hist(Observe(find(states==1),1),100)
figure;
hist(Observe(find(states==2),1),100)
figure;
hist(Observe(find(states==3),1),100)

figure;
hist(Observe(find(states==1),2),100)
figure;
hist(Observe(find(states==2),2),100)
figure;
hist(Observe(find(states==3),2),100)

% figure;
% %plot(1:length(Observe),Observe);
% for i=1:length(Observe)
%     
%     h = animatedline('Marker','.','Color','r','LineWidth',0.01);
%     addpoints(h,i,ln_gamma(i,1));
%     
% end
% figure;
% %plot(1:length(Observe),Observe);
% for i =1:length(Observe)
%     h = animatedline('Marker','.','Color','b','LineWidth',0.01);
%     addpoints(h,i,ln_gamma(i,2));
%     
% end
% figure;
% %plot(1:length(Observe),Observe);
% for i =1:length(Observe)
%     h = animatedline('Marker','.','Color','g','LineWidth',0.01);
%     addpoints(h,i,ln_gamma(i,3));
%     
% end

end

