clear;
load('activityValue.mat');
load('tremorValue.mat');
load('activityEpoch.mat');
load('tremorEpoch.mat');
load('activityTimestamp.mat');
load('tremorTimestamp.mat');


%insert some missing data by fitting a line
problem_index_activity = [];
for i = 1:size(activityValue,1)-1
    if(activityEpoch(i+1)-activityEpoch(i) ~= 30000)
        problem_index_activity = [problem_index_activity i+1];
    end
end
% for i = 1:size(activityValue,1)
%     if(any(tremorEpoch == activityEpoch(i))==0)
%         disp(i);
%     end
% end
dataInsertNum = zeros(length(problem_index_activity),1);
for i = 1:length(problem_index_activity)
   dataInsertNum(i) =  (activityEpoch(problem_index_activity(i)) - activityEpoch(problem_index_activity(i)-1))/30000 - 1; 
end
activityValue = [activityValue(1:problem_index_activity(1)-1);
                insertData(activityValue(problem_index_activity(1)-1),activityValue(problem_index_activity(1)),dataInsertNum(1));
                activityValue(problem_index_activity(1):problem_index_activity(2)-1);
                insertData(activityValue(problem_index_activity(2)-1),activityValue(problem_index_activity(2)),dataInsertNum(2));
                activityValue(problem_index_activity(2):problem_index_activity(3)-1);
                insertData(activityValue(problem_index_activity(3)-1),activityValue(problem_index_activity(3)),dataInsertNum(3));
                activityValue(problem_index_activity(3):problem_index_activity(4)-1);
                insertData(activityValue(problem_index_activity(4)-1),activityValue(problem_index_activity(4)),dataInsertNum(4));
                activityValue(problem_index_activity(4):problem_index_activity(5)-1);
                insertData(activityValue(problem_index_activity(5)-1),activityValue(problem_index_activity(5)),dataInsertNum(5));
                activityValue(problem_index_activity(5):problem_index_activity(6)-1);
                insertData(activityValue(problem_index_activity(6)-1),activityValue(problem_index_activity(6)),dataInsertNum(6));
                activityValue(problem_index_activity(6):problem_index_activity(7)-1);
                insertData(activityValue(problem_index_activity(7)-1),activityValue(problem_index_activity(7)),dataInsertNum(7));
                activityValue(problem_index_activity(7):problem_index_activity(8)-1);
                insertData(activityValue(problem_index_activity(8)-1),activityValue(problem_index_activity(8)),dataInsertNum(8));
                activityValue(problem_index_activity(8):end)];


problem_index_tremor = [];
for i = 1:size(tremorValue,1)-1
    if(tremorEpoch(i+1)-tremorEpoch(i) ~= 5000)
        problem_index_tremor = [problem_index_tremor i+1];
    end
end
dataInsertNum1 = zeros(length(problem_index_tremor),1);
for i = 1:length(problem_index_tremor)
    dataInsertNum1(i) = (tremorEpoch(problem_index_tremor(i)) - tremorEpoch(problem_index_tremor(i)-1))/5000 - 1;
    tremorTimestamp(problem_index_tremor(i)-1)
    tremorTimestamp(problem_index_tremor(i))
end
tremorValue = [tremorValue(1:problem_index_tremor(1)-1);
                insertData(tremorValue(problem_index_tremor(1)-1),tremorValue(problem_index_tremor(1)),dataInsertNum1(1));
                tremorValue(problem_index_tremor(1):problem_index_tremor(2)-1);
                insertData(tremorValue(problem_index_tremor(2)-1),tremorValue(problem_index_tremor(2)),dataInsertNum1(2));
                tremorValue(problem_index_tremor(2):problem_index_tremor(3)-1);
                insertData(tremorValue(problem_index_tremor(3)-1),tremorValue(problem_index_tremor(3)),dataInsertNum1(3));
                tremorValue(problem_index_tremor(3):problem_index_tremor(4)-1);
                insertData(tremorValue(problem_index_tremor(4)-1),tremorValue(problem_index_tremor(4)),dataInsertNum1(4));
                tremorValue(problem_index_tremor(4):problem_index_tremor(5)-1);
                insertData(tremorValue(problem_index_tremor(5)-1),tremorValue(problem_index_tremor(5)),dataInsertNum1(5));
                tremorValue(problem_index_tremor(5):problem_index_tremor(6)-1);
                insertData(tremorValue(problem_index_tremor(6)-1),tremorValue(problem_index_tremor(6)),dataInsertNum1(6));
                tremorValue(problem_index_tremor(6):problem_index_tremor(7)-1);
                insertData(tremorValue(problem_index_tremor(7)-1),tremorValue(problem_index_tremor(7)),dataInsertNum1(7));
                tremorValue(problem_index_tremor(7):problem_index_tremor(8)-1);
                insertData(tremorValue(problem_index_tremor(8)-1),tremorValue(problem_index_tremor(8)),dataInsertNum1(8));
                tremorValue(problem_index_tremor(8):problem_index_tremor(9)-1);
                insertData(tremorValue(problem_index_tremor(9)-1),tremorValue(problem_index_tremor(9)),dataInsertNum1(9));
                tremorValue(problem_index_tremor(9):problem_index_tremor(10)-1);
                insertData(tremorValue(problem_index_tremor(10)-1),tremorValue(problem_index_tremor(10)),dataInsertNum1(10));
                tremorValue(problem_index_tremor(10):problem_index_tremor(11)-1);
                insertData(tremorValue(problem_index_tremor(11)-1),tremorValue(problem_index_tremor(11)),dataInsertNum1(11));
                tremorValue(problem_index_tremor(11):problem_index_tremor(12)-1);
                insertData(tremorValue(problem_index_tremor(12)-1),tremorValue(problem_index_tremor(12)),dataInsertNum1(12));
                tremorValue(problem_index_tremor(12):problem_index_tremor(13)-1);
                insertData(tremorValue(problem_index_tremor(13)-1),tremorValue(problem_index_tremor(13)),dataInsertNum1(13));
                tremorValue(problem_index_tremor(13):problem_index_tremor(14)-1);
                insertData(tremorValue(problem_index_tremor(14)-1),tremorValue(problem_index_tremor(14)),dataInsertNum1(14));
                tremorValue(problem_index_tremor(14):end)];






% Inf_avoid_small_const = 1e-20;
% Observe = zeros(size(tremorValue,1),2) - 100;
% Observe(:,1) = tremorValue+Inf_avoid_small_const;
% for i = 1:size(activityValue,1)
%     Observe((6*i),2) = activityValue(i)+Inf_avoid_small_const;
% end
% Observe((Observe(:,2) == -100),2) = nan;

Inf_avoid_small_const = 1e-20;
Observe = zeros(size(tremorValue,1),2) - 100;
Observe(:,1) = tremorValue+Inf_avoid_small_const;
for i = 1:size(activityValue,1)
    Observe((6*i),2) = activityValue(i)+Inf_avoid_small_const;
end
Observe((Observe(:,2) == -100),2) = nan;

m = 3;
A = rand(m,m);
A = bsxfun(@rdivide, A, sum(A,2));

activities_in_one_hour = 120;
tremors_in_one_hour = 720;

%on state: 10:00 - 12:00, 1 hour after medication to 3 hours after
%medication
on_state_activity_index = [17*120:19*120 41*120:43*120 65*120:67*120 89*120:91*120];
on_state_tremor_index = [17*720:19*720 41*720:43*720 65*720:67*720 89*720:91*720];
on_state_tremor_activitySample_index = [17*720:6:19*720 41*720:6:43*720 65*720:6:67*720 89*720:6:91*720];
%off state: data from 2 hour before medication the time of medication in the evening
%19:00 - 21:00 
off_state_activity_index = [2*120:4*120 26*120:28*120 50*120:52*120 74*120:76*120];
off_state_tremor_index = [2*720:4*720 26*720:28*720 50*720:52*720 74*720:76*720];
off_state_tremor_activitySample_index = [2*720:6:4*720 26*720:6:28*720 50*720:6:52*720 74*720:6:76*720];
%sleepy state: 0:00 - 5:00
sleep_state_activity_index = [7*120:12*120 31*120:36*120 55*120:60*120 79*120:84*120];
sleep_state_tremor_index = [7*720:12*720 31*720:36*720 55*720:60*720 79*720:84*720];
sleep_state_tremor_activitySample_index = [7*720:6:12*720 31*720:6:36*720 55*720:6:60*720 79*720:6:84*720];


B = zeros(3,6);

B(1,1) = mean(tremorValue(on_state_tremor_index));
B(2,1) = mean(tremorValue(off_state_tremor_index));
B(3,1) = mean(tremorValue(sleep_state_tremor_index));
B(1,2) = mean(activityValue(on_state_activity_index));
B(2,2) = mean(activityValue(off_state_activity_index));
B(3,2) = mean(activityValue(sleep_state_activity_index));

B(1,3) = std(tremorValue(on_state_tremor_index))^2;
B(2,3) = std(tremorValue(off_state_tremor_index))^2;
B(3,3) = std(tremorValue(sleep_state_tremor_index))^2;
B(1,6) = std(activityValue(on_state_activity_index))^2;
B(2,6) = std(activityValue(off_state_activity_index))^2;
B(3,6) = std(activityValue(sleep_state_activity_index))^2;

tempMatrix = cov(tremorValue(on_state_tremor_activitySample_index), activityValue(on_state_activity_index));
B(1,4) = tempMatrix(1,2);
B(1,5) = B(1,4);
tempMatrix = cov(tremorValue(off_state_tremor_activitySample_index), activityValue(off_state_activity_index));
B(2,4) = tempMatrix(1,2);
B(2,5) = B(2,4);
tempMatrix = cov(tremorValue(sleep_state_tremor_activitySample_index), activityValue(sleep_state_activity_index));
B(3,4) = tempMatrix(1,2);
B(3,5) = B(3,4);
pi = rand(m,1);
pi = bsxfun(@rdivide, pi, sum(pi));
Observe = Observe(6:6:end,:);
[A,B,pi,ln_gamma] = Baum_Welch(Observe,3,100,A,B,pi);




