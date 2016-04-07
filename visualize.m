clear;
load('activityValue.mat');
Observe = activityValue;
B = zeros(3,2);
%initialization for sleep state emissions
%data from 0am - 5 am
B(1,1) = mean([Observe(841:1440);Observe(3716:4315);Observe(6594:7193);Observe(9432:10031)]);
B(1,2) = std([Observe(841:1440);Observe(3716:4315);Observe(6594:7193);Observe(9432:10031)]);
%initializations for on state
%data from 1 hour after medication to 3 hours after medication in the morning
B(2,1) = mean([Observe(2039:2278);Observe(4915:5154);Observe(7793:8032)]);
B(2,2) = std([Observe(2039:2278);Observe(4915:5154);Observe(7793:8032)]);
%initializations for off state
%data from 2 hour before medication the time of medication in the evening
B(3,1) = mean([Observe(241:480);Observe(3118:3355);Observe(5993:6233);Observe(8831:9071)]);
B(3,2) = std([Observe(241:480);Observe(3118:3355);Observe(5993:6233);Observe(8831:9071)]);
[A,B,pi,ln_gamma] = Baum_Welch(Observe,3,100,B);
states = Viterbi( A, B, pi, Observe );
figure(1);
plot(1:length(Observe),Observe);
for i=1:length(Observe)
    if states(i) == 1
        h = animatedline('Marker','.','Color','r','LineWidth',0.01);
        addpoints(h,i,0.20);
    elseif states(i) == 2
            h = animatedline('Marker','.','Color','b','LineWidth',0.01);
            addpoints(h,i,0.30);
    else
        h = animatedline('Marker','.','Color','g','LineWidth',0.01);
        addpoints(h,i,0.25);
    end
    
end

figure(2);
%plot(1:length(Observe),Observe);
for i=1:length(Observe)
    
    h = animatedline('Marker','.','Color','r','LineWidth',0.01);
    addpoints(h,i,ln_gamma(i,1));
    
end
figure(3);
%plot(1:length(Observe),Observe);
for i =1:length(Observe)
    h = animatedline('Marker','.','Color','b','LineWidth',0.01);
    addpoints(h,i,ln_gamma(i,2));
    
end
figure(4);
%plot(1:length(Observe),Observe);
for i =1:length(Observe)
    h = animatedline('Marker','.','Color','g','LineWidth',0.01);
    addpoints(h,i,ln_gamma(i,3));
    
end





clear;
load('tremorValue.mat');
Observe1 = tremorValue;
B1 = zeros(3,2);
B1(1,1) = mean([Observe1(5026:8626);Observe1(22263:25863);Observe1(39519:43119);Observe1(56536:60134);Observe1(:)]);
B1(1,2) = std([Observe1(5026:8626);Observe1(22263:25863);Observe1(39519:43119);Observe1(56536:60134);Observe1(:)]);
B1(2,1) = mean([Observe1(12205:13645);Observe1(29463:30903);Observe1(46719:48159)]);
B1(2,2) = std([Observe1(12205:13645);Observe1(29463:30903);Observe1(46719:48159)]);
B1(3,1) = mean([Observe1(1441:2886);Observe1(18685:20106);Observe1(35919:37359);Observe1(52939:54376)]);
B1(3,2) = std([Observe1(1441:2886);Observe1(18685:20106);Observe1(35919:37359);Observe1(52939:54376)]);
[A1,B1,pi1,ln_gamma1] = Baum_Welch(Observe1,3,100,B1);
states1 = Viterbi( A1, B1, pi1, Observe1 );
figure(5);
plot(1:length(Observe1),Observe1);
for i=1:length(Observe1)
    if states1(i) == 1
        h = animatedline('Marker','.','Color','r','LineWidth',0.01);
        addpoints(h,i,0.20);
    elseif states1(i) == 2
            h = animatedline('Marker','.','Color','b','LineWidth',0.01);
            addpoints(h,i,0.30);
    else
        h = animatedline('Marker','.','Color','g','LineWidth',0.01);
        addpoints(h,i,0.25);
    end
    
end

figure(6);
%plot(1:length(Observe1),Observe1);
for i=1:length(Observe1)
    
    h = animatedline('Marker','.','Color','r','LineWidth',0.01);
    addpoints(h,i,ln_gamma1(i,1));
    
end
figure(7);
%plot(1:length(Observe1),Observe1);
for i =1:length(Observe1)
    h = animatedline('Marker','.','Color','b','LineWidth',0.01);
    addpoints(h,i,ln_gamma1(i,2));
    
end
figure(8);
%plot(1:length(Observe1),Observe1);
for i =1:length(Observe1)
    h = animatedline('Marker','.','Color','g','LineWidth',0.01);
    addpoints(h,i,ln_gamma1(i,3));
    
end

