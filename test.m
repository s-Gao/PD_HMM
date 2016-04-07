clear;
m =3;
num_states = 3;
% A = ones(m,m)/m;%sum to 1
A = rand(m,m);
A = bsxfun(@rdivide, A, sum(A,2));
B = zeros(m,2);
%initialization for sleep state emissions
%data from 0am - 5 am
B(1,1) = 0.004504352724992;
B(1,2) = 0.007392590248755;
%initializations for on state
%data from 1 hour after medication to 3 hours after medication in the
%morning
B(2,1) = 0.047343900985211;
B(2,2) = 0.058855490356601;
%initializations for off state
%data from 2 hour before medication the time of medication in the evening
B(3,1) = 0.016555671959282;
B(3,2) = 0.023216098360503;

pi = ones(m,1)/m;
load('activityValue.mat');
Observe = activityValue;

mean1 = mean([Observe(841:1140);Observe(3716:4315);Observe(6594:7193);Observe(9432:10031)]);
std1 = std([Observe(841:1140);Observe(3716:4315);Observe(6594:7193);Observe(9432:10031)]);

mean2 = mean([Observe(2039:2278);Observe(4915:5154);Observe(7793:8032)]);
std2 = std([Observe(2039:2278);Observe(4915:5154);Observe(7793:8032)]);

mean3 = mean([Observe(241:480);Observe(3118:3355);Observe(5993:6233);Observe(8831:9071)]);
std3 = std([Observe(241:480);Observe(3118:3355);Observe(5993:6233);Observe(8831:9071)]);
