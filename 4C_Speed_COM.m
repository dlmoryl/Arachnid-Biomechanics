%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Dana Moryl Thesis Code-Speed, Duty Factors, COM
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Legs are labelled front to back, left side=L, right side = R

%%Input Data From Excel  
data=readtable('Mar23_1070.xlsx'); %input Excel data
foot_data=readtable('Mar23_1070_steps.xlsx');
COM_data=DavidTracker41120CenterofMassManualS15;
frames=(size(data,2)-1)/3;
%data=table2array(data(1:71,2:frames*3+1));   %For Mar15_1970 only
data=table2array(data(1:64,1:frames*3+1));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Adjustable variables
lim=.2; %limit of acceptance of foot being on ground
fps=60; %frames per second of camera
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%separate data into frames, and coordinate systems
xvector=zeros(65,frames);
yvector=zeros(65,frames);
zvector=zeros(65,frames);

count=1;
for n=1:3:frames*3-2
    xvector(1:64,count)=data(1:64,n);
    yvector(1:64,count)=data(1:64,n+1);
    zvector(1:64,count)=data(1:64,n+2);

    count=count+1;
end

%Duty Factor and Gait Period Calculations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
R1_tarsus=table2array(foot_data(1,2:frames));
R2_tarsus=table2array(foot_data(2,2:frames));
R3_tarsus=table2array(foot_data(3,2:frames));
R4_tarsus=table2array(foot_data(4,2:frames));
L1_tarsus=table2array(foot_data(5,2:frames));
L2_tarsus=table2array(foot_data(6,2:frames));
L3_tarsus=table2array(foot_data(7,2:frames));
L4_tarsus=table2array(foot_data(8,2:frames));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Area under feet calculations
z_switch=[R1_tarsus R2_tarsus R3_tarsus R4_tarsus L1_tarsus L2_tarsus L3_tarsus L4_tarsus];
count=1;
for n=1:1:frames-1
    z_switch(count)=R1_tarsus(n);
    z_switch(count+1)=R2_tarsus(n);
    z_switch(count+2)=R3_tarsus(n);
    z_switch(count+3)=R4_tarsus(n);
    z_switch(count+4)=L1_tarsus(n);
    z_switch(count+5)=L2_tarsus(n);
    z_switch(count+6)=L3_tarsus(n);
    z_switch(count+7)=L4_tarsus(n);
    count=count+8;
end

H_vector_x=zeros(1,frames*8-8);
H_vector_y=zeros(1,frames*8-8);
          %Returns only the position of the feet in x and y over all frames
count=1;
for n=2:1:frames-1
    for z=8:8:64
        H_vector_x(count)=xvector(z,n);
        H_vector_y(count)=yvector(z,n);
        count=count+1;
    end
end
H_vector_x=H_vector_x.*z_switch;
H_vector_y=H_vector_y.*z_switch;

A=zeros(1,frames);
%                          %Plot the feet as a gif, calculate area under feet
filename='Spider_Area.gif';
f=figure;
feet_COM=zeros(2,frames); 
index = 1; 
index1 = 1; 
index2 = 1; 
x_foot_new = zeros(1);
y_foot_new = zeros(1); 
for n=1:8:frames*8-16
    x_foot=H_vector_x(n:n+8);
    y_foot=H_vector_y(n:n+8);
    while index < 9
        if x_foot(index) ~= 0 
            x_foot_new(index1) = x_foot(index);
            index1 = index1 + 1; 
            y_foot_new(index2) = y_foot(index);
            index2 = index2 + 1; 
        end 
        index = index + 1;
    end 
  
    feet_COM(1,n)=mean(x_foot_new);
    feet_COM(2,n)=mean(y_foot_new);
    scatter(x_foot_new, y_foot_new,'filled', 'g')
    grid on
    axis equal                    %axes set equal/tight for gif development
   % axis tight
    %axis([4 20 2 6])
    hold on
    p=boundary(x_foot_new.',y_foot_new.');
    plot(x_foot_new(p), y_foot_new(p))
    A(n)=polyarea(x_foot_new(p),y_foot_new(p));
    
    hold off
    drawnow
    index = 1; 
    index1 = 1;
    index2 = 1; 
    x_foot_new = zeros(1);
    y_foot_new = zeros(1); 
    frame = getframe(f);                                %turn plot to image
    im = frame2im(frame); 
    [imind,cm] = rgb2ind(im,256); 
   
    if n == 1                                      %write as gif
        imwrite(imind,cm,filename,'gif', 'Loopcount',inf); 
    else 
        imwrite(imind,cm,filename,'gif','WriteMode','append'); 
    end 
    
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%COM and speed calculations
COMxz=zeros(2,frames-1);
COMxy=zeros(2,frames-1);
% count=1;             
% for n=1:3:frames*3-2                
%     COMxz(1,count)=data(71,n);                    %For Mar 15_1970 only
%     COMxz(2,count)=data(71,n+2);
%     COMxy(1,count)=data(71,n);
%     COMxy(2,count)=data(71,n+1);
%     count=count+1;
% end

COMxy(1,:)=transpose(table2array(COM_data(1:2:198,3)));
COMxy(2,:)=transpose(table2array(COM_data(1:2:198,2)));
speed=zeros(1,frames);
count=1;
for n=2:1:frames-1
    speed(count)=abs((COMxy(1,n)-COMxy(1,n-1)))*fps;
    count=count+1;
end
speed_avged=zeros(1,(frames-1)/3);
count=1;
for n=1:3:frames-1
    speed_avged(count)=mean(speed(n:n+2));
    count=count+1;
end
    
%Plot Position of COM and Speed throughout trial
figure
plot(COMxz(1,:),COMxz(2,:),'k')
xlabel('Position in X Direction (cm)')
ylabel('Position in Z Direction (cm)')
title('Center of Mass Position Throughout Trial in XZ')

figure
plot(COMxy(1,:),COMxy(2,:),'k')
xlabel('Position in X Direction (cm)')
ylabel('Position in Y Direction (cm)')
title('Center of Mass Position Throughout Trial in XY')

% figure
% plot(1:frames, COMxz(2,:))
% xlabel('Frame')
% ylabel('Position in Z Direction')
% title('Height of Center of Mass Position Throughout Trial') 

figure
plot(1:3:frames-1,speed_avged,'k')
xlabel('Frames)')
ylabel('Speed of Spider in cm/s')
title('Speed of Spider Throughout Trial')

avg_speed=mean(speed);
stdev_speed=std(speed);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plot area under feet along with spider COM
filename='Spider_Area_COM.gif';
f=figure;
feet_COM=zeros(2,frames);
x_foot_new = zeros(1);
y_foot_new = zeros(1);
count=1;
for n=1:8:frames*8-16
    x_foot=H_vector_x(n:n+8);
    y_foot=H_vector_y(n:n+8);
    while index < 9
        if x_foot(index) ~= 0 
            x_foot_new(index1) = x_foot(index);
            index1 = index1 + 1; 
            y_foot_new(index2) = y_foot(index);
            index2 = index2 + 1; 
        end 
        index = index + 1;
    end 
    
    feet_COM(1,count)=mean(x_foot_new);
    feet_COM(2,count)=mean(y_foot_new);
    scatter(x_foot_new, y_foot_new,'filled', 'k')
    grid on
    axis equal                    %axes set equal/tight for gif development
    %axis tight
   % axis([4 20 2 6])
    hold on
    scatter(x_foot_new,y_foot_new,'k')
    scatter(COMxy(1,count),COMxy(2,count), 'filled', 'g')
    scatter(feet_COM(1,count),feet_COM(2,count),'filled','r','s')
    p=boundary(transpose(x_foot_new),transpose(y_foot_new));
    plot(x_foot_new(p), y_foot_new(p))
    A(n)=polyarea(x_foot_new(p),y_foot_new(p));
    hold off
    drawnow
    count=count+1;
     index = 1; 
    index1 = 1;
    index2 = 1; 
    x_foot_new = zeros(1);
    y_foot_new = zeros(1); 
    frame = getframe(f);                                %turn plot to image
    im = frame2im(frame); 
    [imind,cm] = rgb2ind(im,256); 
   
    if n == 1                                                 %write as gif
        imwrite(imind,cm,filename,'gif', 'Loopcount',inf); 
    else 
        imwrite(imind,cm,filename,'gif','WriteMode','append'); 
    end 
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Difference from COM of spider vs COM of the shape under feet
COM_dif=zeros(2,frames-1);
for n=1:1:frames-1
    COM_dif(1,n)=feet_COM(1,n)-COMxy(1,n);
    COM_dif(2,n)=feet_COM(2,n)-COMxy(2,n);
end

avg_COM_dif_x=mean(COM_dif(1,:));
avg_COM_dif_y=mean(COM_dif(2,:));
stdev_COM_dif_x=std(COM_dif(1,:));
stdev_COM_dif_y=std(COM_dif(2,:));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 
