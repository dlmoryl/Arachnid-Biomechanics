%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Dana Moryl Thesis Code- Forces
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
data=table2array(ForceLegPositions);
force1=0.098065261;
force2=0.049099913;
force3=0.087215152;
force4=0.056850679;

% Leg1_lengths=[0.6887,0.99,1.1954,0.1088,0.7535,0.6905,0.5182]; %L3 lengths
% Leg2_lengths=[0.8014,1.4791,0.9478,0.181,0.9552,0.9691,0.5264]; %R4 lengths
% Leg3_lengths=[0.6713,0.9662,1.2474,0.1265,0.9219,0.8241,0.5131]; %L2 lengths
% Leg4_lengths=[0.6713,0.9662,1.2474,0.1265,0.9219,0.8241,0.5131]; %L2 lengths

Leg1=zeros(3,8);
Leg2=zeros(3,8);
Leg3=zeros(3,8);
Leg4=zeros(3,8);

count=1;
for n=1:3:24
    Leg1(1,count)=data(1,n); %xvector
    Leg2(1,count)=data(2,n);
    Leg3(1,count)=data(3,n);
    Leg4(1,count)=data(4,n);
    
    Leg1(2,count)=data(1,n+1);%yvector
    Leg2(2,count)=data(2,n+1);
    Leg3(2,count)=data(3,n+1);
    Leg4(2,count)=data(4,n+1);
    
    Leg1(3,count)=data(1,n+2);%zvector
    Leg2(3,count)=data(2,n+2);
    Leg3(3,count)=data(3,n+2);
    Leg4(3,count)=data(4,n+2);
    
    count=count+1;
end

yz_angles=zeros(4,8);
lengths=zeros(4,8);

count=1;
for n=1:1:7
    yz_angles(1,count)=rad2deg(atan(abs(Leg1(3,n+1)-Leg1(3,n))/abs(Leg1(2,n+1)-Leg1(2,n))));
    yz_angles(2,count)=rad2deg(atan(abs(Leg2(3,n+1)-Leg2(3,n))/abs(Leg2(2,n+1)-Leg2(2,n))));
    yz_angles(3,count)=rad2deg(atan(abs(Leg3(3,n+1)-Leg3(3,n))/abs(Leg3(2,n+1)-Leg3(2,n))));
    yz_angles(4,count)=rad2deg(atan(abs(Leg4(3,n+1)-Leg4(3,n))/abs(Leg4(2,n+1)-Leg4(2,n))));
    lengths(1,count)=sqrt((Leg1(1,n+1)-Leg1(1,n))^2+(Leg1(2,n+1)-Leg1(2,n))^2+(Leg1(3,n+1)-Leg1(3,n))^2);
    lengths(2,count)=sqrt((Leg2(1,n+1)-Leg2(1,n))^2+(Leg2(2,n+1)-Leg2(2,n))^2+(Leg2(3,n+1)-Leg2(3,n))^2);
    lengths(3,count)=sqrt((Leg3(1,n+1)-Leg3(1,n))^2+(Leg3(2,n+1)-Leg3(2,n))^2+(Leg3(3,n+1)-Leg3(3,n))^2);
    lengths(4,count)=sqrt((Leg4(1,n+1)-Leg4(1,n))^2+(Leg4(2,n+1)-Leg4(2,n))^2+(Leg4(3,n+1)-Leg4(3,n))^2);
    
    count=count+1;
end

figure
scatter(Leg4(2,:),Leg4(3,:),'g','filled')
hold on
line(Leg4(2,:),Leg4(3,:),'linewidth',2)
hold off