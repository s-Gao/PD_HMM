%viterbi_and_plot(A,B,pi,Observe);
states = Viterbi( A, B, pi, Observe );
figure;
plot(1:size(Observe,1),Observe(:,1));

for i=1:size(Observe,1)
   if states(i) == 1
       h = animatedline('Marker','.','Color','r','LineWidth',0.01);
       addpoints(h,i,0.20);       
   elseif states(i) == 2
           h = animatedline('Marker','.','Color','b','LineWidth',0.01);
           addpoints(h,i,0.25);
   else
       h = animatedline('Marker','.','Color','g','LineWidth',0.01);
       addpoints(h,i,0.30);
   end    
end
