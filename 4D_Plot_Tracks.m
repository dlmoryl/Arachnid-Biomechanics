%plot the steps over time
data=readtable('Mar23_1070_steps.xlsx');
frames=size(data,2)-1;
R1=table2array(data(1,2:frames))*8;
R2=table2array(data(2,2:frames))*7;
R3=table2array(data(3,2:frames))*6;
R4=table2array(data(4,2:frames))*5;
L1=table2array(data(5,2:frames))*4;
L2=table2array(data(6,2:frames))*3;
L3=table2array(data(7,2:frames))*2;
L4=table2array(data(8,2:frames));
x=1:frames-1;
figure
scatter(x,R1, 's','filled')
axis([0 frames .5 8.5])
hold on
scatter(x,R2,'s','filled')
scatter(x,R3,'s','filled')
scatter(x,R4,'s','filled')
scatter(x,L1,'s','filled')
scatter(x,L2,'s','filled')
scatter(x,L3,'s','filled')
scatter(x,L4,'s','filled')
%legend('R1','R2','R3','R4','L1','L2','L3','L4') 
title('Steps throughout cycle')
xlabel('Frames')
hold off
