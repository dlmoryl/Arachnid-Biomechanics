%%Input Data From Excel  
data_pitch=DavidTracker41120PitchS4; %input data
data_yaw=DavidTracker41020yawS4;
frames=(size(data_yaw,1)-7);

pitch_pt1=zeros(2,frames);
pitch_pt2=zeros(2,frames);
yaw_pt1=zeros(2,frames);
yaw_pt2=zeros(2,frames);

pitch_pt1(1,:)=table2array(data_pitch(1:frames,2)); %separate into 2 points
pitch_pt1(2,:)=table2array(data_pitch(1:frames,3));
pitch_pt2(1,:)=table2array(data_pitch(1:frames,6));
pitch_pt2(2,:)=table2array(data_pitch(1:frames,7));

yaw_pt1(1,:)=table2array(data_yaw(1:frames,2));
yaw_pt1(2,:)=table2array(data_yaw(1:frames,3));
yaw_pt2(1,:)=table2array(data_yaw(1:frames,6));
yaw_pt2(2,:)=table2array(data_yaw(1:frames,7));

pitch_angles=zeros(1,frames);
yaw_angles=zeros(1,frames);

for n=1:1:frames  %calculate the angles
    pitch_angles(n)=atan(abs(pitch_pt2(2,n)-pitch_pt1(2,n))/abs(pitch_pt2(1,n)-pitch_pt1(1,n)));
    yaw_angles(n)=atan(abs(yaw_pt2(2,n)-yaw_pt1(2,n))/abs(yaw_pt2(1,n)-yaw_pt1(1,n)));
end

pitch_angles=rad2deg(pitch_angles);
yaw_angles=90-rad2deg(yaw_angles); %rotate 90 due to point choice

avg_pitch=mean(pitch_angles);
avg_yaw=mean(yaw_angles);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plot pitch, yaw, and roll
% figure
% plot(1:frames,pitch_angles,'k')
% xlabel('Frame')
% ylabel('Pitch Angle in Degrees')
% title('Pitch Angle of Spider Throughout Trial')
% 
% figure
% plot(yaw_angles,'k')
% xlabel('Frame')
% ylabel('Yaw Angle in Degrees')
% title('Yaw Angle of Spider Throughout Trial')

figure
plot(pitch_angles, 'b')
hold on 
plot(yaw_angles, 'g')
xlabel('Frame')
ylabel('Angle in Degrees')
title('Pitch and Yaw Throughout Trial')
legend('Pitch','Yaw')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
