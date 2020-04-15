%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Dana Moryl Thesis Code-Angles
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Legs are labelled front to back, left side=L, right side = R

%%Input Data From Excel  
data=readtable('Mar5_15800.xlsx'); %input Excel data
frames=(size(data,2)-1)/3;
data=table2array(data(1:64,2:frames*3+1));
                         %separate data into frames, and coordinate systems
xvector=zeros(65,frames);
yvector=zeros(65,frames);
zvector=zeros(65,frames);

xy_slope=zeros(65,frames);
xz_slope=zeros(65,frames);
yz_slope=zeros(65,frames);

xy_angles=zeros(65,frames);
xz_angles=zeros(65,frames);
yz_angles=zeros(65,frames);


count=1;
for n=1:3:frames*3-2                %Separate data into x, y, and z vectors
    xvector(1:64,count)=data(1:64,n);
    %xvector=xvector/x_mark;                              %USE IF NOT IN CM
    yvector(1:64,count)=data(1:64,n+1);
    %yvector=yvector/y_mark;
    zvector(1:64,count)=data(1:64,n+2);
    %zvector=zvector/z_mark;
    
    count=count+1;
end

%Set centers appropriate for the individual axes of spider
xcenter=zeros(1,frames);
ycenter=zeros(1,frames);
zcenter=zeros(1,frames);

% count=1;                    %This gives the baseline coordinates for spider
% for n=1:3:frames*3-2 
%     xcenter(1,count)=data(65,n); 
%     xcenter(2,count)=data(65,n+1);
%     ycenter(1,count)=data(66,n+1);
%     ycenter(2,count)=data(66,n);
%     zcenter(1,count)=data(67,n+2);
%     zcenter(2,count)=data(67,n);
%     count=count+1;
% end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Calculate slopes and angles per system
for n=1:1:frames
    for z=1:1:64 
        xy_slope(z,n)=(yvector(z+1,n)-yvector(z,n))/(xvector(z+1,n)-xvector(z,n));
        if abs(xy_slope(z,n))==inf
            xy_slope(z,n)=0;
        end
        xz_slope(z,n)=(zvector(z+1,n)-zvector(z,n))/(xvector(z+1,n)-xvector(z,n));
        if abs(xz_slope(z,n))==inf
            xz_slope(z,n)=0;
        end
        yz_slope(z,n)=(yvector(z+1,n)-yvector(z,n))/(zvector(z+1,n)-zvector(z,n));
        if abs(yz_slope(z,n))==inf
            yz_slope(z,n)=0;
        end
    end
end
xy_slope(isnan(xy_slope))=0;
xz_slope(isnan(xz_slope))=0;
yz_slope(isnan(yz_slope))=0;
for n=1:1:frames
    for z=1:1:63
        xy_angles(z,n)=atan(abs(xy_slope(z+1,n)-xy_slope(z,n))/(1+abs(xy_slope(z+1,n)*xy_slope(z,n))));
        xz_angles(z,n)=atan(abs(xz_slope(z+1,n)-xz_slope(z,n))/(1+abs(xz_slope(z+1,n)*xz_slope(z,n))));
        yz_angles(z,n)=atan(abs(yz_slope(z+1,n)-yz_slope(z,n))/(1+abs(yz_slope(z+1,n)*yz_slope(z,n))));
        
        xy_angles(z,n)=rad2deg(xy_angles(z,n));
        xz_angles(z,n)=rad2deg(xz_angles(z,n));
        yz_angles(z,n)=rad2deg(yz_angles(z,n));
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Initiate matrices for speed of calculations
R1_AB_data=zeros(3,frames);
R1_BC_data=zeros(3,frames);
R1_CD_data=zeros(3,frames);
R1_DE_data=zeros(3,frames);
R1_EF_data=zeros(3,frames);
R1_FG_data=zeros(3,frames);
R1_GH_data=zeros(3,frames);
R2_AB_data=zeros(3,frames);
R2_BC_data=zeros(3,frames);
R2_CD_data=zeros(3,frames);
R2_DE_data=zeros(3,frames);
R2_EF_data=zeros(3,frames);
R2_FG_data=zeros(3,frames);
R2_GH_data=zeros(3,frames);
R3_AB_data=zeros(3,frames);
R3_BC_data=zeros(3,frames);
R3_CD_data=zeros(3,frames);
R3_DE_data=zeros(3,frames);
R3_EF_data=zeros(3,frames);
R3_FG_data=zeros(3,frames);
R3_GH_data=zeros(3,frames);
R4_AB_data=zeros(3,frames);
R4_BC_data=zeros(3,frames);
R4_CD_data=zeros(3,frames);
R4_DE_data=zeros(3,frames);
R4_EF_data=zeros(3,frames);
R4_FG_data=zeros(3,frames);
R4_GH_data=zeros(3,frames);

L1_AB_data=zeros(3,frames);
L1_BC_data=zeros(3,frames);
L1_CD_data=zeros(3,frames);
L1_DE_data=zeros(3,frames);
L1_EF_data=zeros(3,frames);
L1_FG_data=zeros(3,frames);
L1_GH_data=zeros(3,frames);
L2_AB_data=zeros(3,frames);
L2_BC_data=zeros(3,frames);
L2_CD_data=zeros(3,frames);
L2_DE_data=zeros(3,frames);
L2_EF_data=zeros(3,frames);
L2_FG_data=zeros(3,frames);
L2_GH_data=zeros(3,frames);
L3_AB_data=zeros(3,frames);
L3_BC_data=zeros(3,frames);
L3_CD_data=zeros(3,frames);
L3_DE_data=zeros(3,frames);
L3_EF_data=zeros(3,frames);
L3_FG_data=zeros(3,frames);
L3_GH_data=zeros(3,frames);
L4_AB_data=zeros(3,frames);
L4_BC_data=zeros(3,frames);
L4_CD_data=zeros(3,frames);
L4_DE_data=zeros(3,frames);
L4_EF_data=zeros(3,frames);
L4_FG_data=zeros(3,frames);
L4_GH_data=zeros(3,frames);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Separate data by leg/joint
for n= 1:1:frames
R1_AB_data(1,n)=xy_angles(1,n);
R1_AB_data(2,n)=xz_angles(1,n);
R1_AB_data(3,n)=yz_angles(1,n);
R1_BC_data(1,n)=xy_angles(2,n);
R1_BC_data(2,n)=xz_angles(2,n);
R1_BC_data(3,n)=yz_angles(2,n);
R1_CD_data(1,n)=xy_angles(3,n);
R1_CD_data(2,n)=xz_angles(3,n);
R1_CD_data(3,n)=yz_angles(3,n);
R1_DE_data(1,n)=xy_angles(4,n);
R1_DE_data(2,n)=xz_angles(4,n);
R1_DE_data(3,n)=yz_angles(4,n);
R1_EF_data(1,n)=xy_angles(5,n);
R1_EF_data(2,n)=xz_angles(5,n);
R1_EF_data(3,n)=yz_angles(5,n);
R1_FG_data(1,n)=xy_angles(6,n);
R1_FG_data(2,n)=xz_angles(6,n);
R1_FG_data(3,n)=yz_angles(6,n);
R1_GH_data(1,n)=xy_angles(7,n);
R1_GH_data(2,n)=xz_angles(7,n);
R1_GH_data(3,n)=yz_angles(7,n);

R2_AB_data(1,n)=xy_angles(9,n);
R2_AB_data(2,n)=xz_angles(9,n);
R2_AB_data(3,n)=yz_angles(9,n);
R2_BC_data(1,n)=xy_angles(10,n);
R2_BC_data(2,n)=xz_angles(10,n);
R2_BC_data(3,n)=yz_angles(10,n);
R2_CD_data(1,n)=xy_angles(11,n);
R2_CD_data(2,n)=xz_angles(11,n);
R2_CD_data(3,n)=yz_angles(11,n);
R2_DE_data(1,n)=xy_angles(12,n);
R2_DE_data(2,n)=xz_angles(12,n);
R2_DE_data(3,n)=yz_angles(12,n);
R2_EF_data(1,n)=xy_angles(13,n);
R2_EF_data(2,n)=xz_angles(13,n);
R2_EF_data(3,n)=yz_angles(13,n);
R2_FG_data(1,n)=xy_angles(14,n);
R2_FG_data(2,n)=xz_angles(14,n);
R2_FG_data(3,n)=yz_angles(14,n);
R2_GH_data(1,n)=xy_angles(15,n);
R2_GH_data(2,n)=xz_angles(15,n);
R2_GH_data(3,n)=yz_angles(15,n);

R3_AB_data(1,n)=xy_angles(17,n);
R3_AB_data(2,n)=xz_angles(17,n);
R3_AB_data(3,n)=yz_angles(17,n);
R3_BC_data(1,n)=xy_angles(18,n);
R3_BC_data(2,n)=xz_angles(18,n);
R3_BC_data(3,n)=yz_angles(18,n);
R3_CD_data(1,n)=xy_angles(19,n);
R3_CD_data(2,n)=xz_angles(19,n);
R3_CD_data(3,n)=yz_angles(19,n);
R3_DE_data(1,n)=xy_angles(20,n);
R3_DE_data(2,n)=xz_angles(20,n);
R3_DE_data(3,n)=yz_angles(20,n);
R3_EF_data(1,n)=xy_angles(21,n);
R3_EF_data(2,n)=xz_angles(21,n);
R3_EF_data(3,n)=yz_angles(21,n);
R3_FG_data(1,n)=xy_angles(22,n);
R3_FG_data(2,n)=xz_angles(22,n);
R3_FG_data(3,n)=yz_angles(22,n);
R3_GH_data(1,n)=xy_angles(23,n);
R3_GH_data(2,n)=xz_angles(23,n);
R3_GH_data(3,n)=yz_angles(23,n);

R4_AB_data(1,n)=xy_angles(25,n);
R4_AB_data(2,n)=xz_angles(25,n);
R4_AB_data(3,n)=yz_angles(25,n);
R4_BC_data(1,n)=xy_angles(26,n);
R4_BC_data(2,n)=xz_angles(26,n);
R4_BC_data(3,n)=yz_angles(26,n);
R4_CD_data(1,n)=xy_angles(27,n);
R4_CD_data(2,n)=xz_angles(27,n);
R4_CD_data(3,n)=yz_angles(27,n);
R4_DE_data(1,n)=xy_angles(28,n);
R4_DE_data(2,n)=xz_angles(28,n);
R4_DE_data(3,n)=yz_angles(28,n);
R4_EF_data(1,n)=xy_angles(29,n);
R4_EF_data(2,n)=xz_angles(29,n);
R4_EF_data(3,n)=yz_angles(29,n);
R4_FG_data(1,n)=xy_angles(30,n);
R4_FG_data(2,n)=xz_angles(30,n);
R4_FG_data(3,n)=yz_angles(30,n);
R4_GH_data(1,n)=xy_angles(31,n);
R4_GH_data(2,n)=xz_angles(31,n);
R4_GH_data(3,n)=yz_angles(31,n);

L1_AB_data(1,n)=xy_angles(33,n);
L1_AB_data(2,n)=xz_angles(33,n);
L1_AB_data(3,n)=yz_angles(33,n);
L1_BC_data(1,n)=xy_angles(34,n);
L1_BC_data(2,n)=xz_angles(34,n);
L1_BC_data(3,n)=yz_angles(34,n);
L1_CD_data(1,n)=xy_angles(35,n);
L1_CD_data(2,n)=xz_angles(35,n);
L1_CD_data(3,n)=yz_angles(35,n);
L1_DE_data(1,n)=xy_angles(36,n);
L1_DE_data(2,n)=xz_angles(36,n);
L1_DE_data(3,n)=yz_angles(36,n);
L1_EF_data(1,n)=xy_angles(37,n);
L1_EF_data(2,n)=xz_angles(37,n);
L1_EF_data(3,n)=yz_angles(37,n);
L1_FG_data(1,n)=xy_angles(38,n);
L1_FG_data(2,n)=xz_angles(38,n);
L1_FG_data(3,n)=yz_angles(38,n);
L1_GH_data(1,n)=xy_angles(39,n);
L1_GH_data(2,n)=xz_angles(39,n);
L1_GH_data(3,n)=yz_angles(39,n);

L2_AB_data(1,n)=xy_angles(41,n);
L2_AB_data(2,n)=xz_angles(41,n);
L2_AB_data(3,n)=yz_angles(41,n);
L2_BC_data(1,n)=xy_angles(42,n);
L2_BC_data(2,n)=xz_angles(42,n);
L2_BC_data(3,n)=yz_angles(42,n);
L2_CD_data(1,n)=xy_angles(43,n);
L2_CD_data(2,n)=xz_angles(43,n);
L2_CD_data(3,n)=yz_angles(43,n);
L2_DE_data(1,n)=xy_angles(44,n);
L2_DE_data(2,n)=xz_angles(44,n);
L2_DE_data(3,n)=yz_angles(44,n);
L2_EF_data(1,n)=xy_angles(45,n);
L2_EF_data(2,n)=xz_angles(45,n);
L2_EF_data(3,n)=yz_angles(45,n);
L2_FG_data(1,n)=xy_angles(46,n);
L2_FG_data(2,n)=xz_angles(46,n);
L2_FG_data(3,n)=yz_angles(46,n);
L2_GH_data(1,n)=xy_angles(47,n);
L2_GH_data(2,n)=xz_angles(47,n);
L2_GH_data(3,n)=yz_angles(47,n);

L3_AB_data(1,n)=xy_angles(49,n);
L3_AB_data(2,n)=xz_angles(49,n);
L3_AB_data(3,n)=yz_angles(49,n);
L3_BC_data(1,n)=xy_angles(50,n);
L3_BC_data(2,n)=xz_angles(50,n);
L3_BC_data(3,n)=yz_angles(50,n);
L3_CD_data(1,n)=xy_angles(51,n);
L3_CD_data(2,n)=xz_angles(51,n);
L3_CD_data(3,n)=yz_angles(51,n);
L3_DE_data(1,n)=xy_angles(52,n);
L3_DE_data(2,n)=xz_angles(52,n);
L3_DE_data(3,n)=yz_angles(52,n);
L3_EF_data(1,n)=xy_angles(53,n);
L3_EF_data(2,n)=xz_angles(53,n);
L3_EF_data(3,n)=yz_angles(53,n);
L3_FG_data(1,n)=xy_angles(54,n);
L3_FG_data(2,n)=xz_angles(54,n);
L3_FG_data(3,n)=yz_angles(54,n);
L3_GH_data(1,n)=xy_angles(55,n);
L3_GH_data(2,n)=xz_angles(55,n);
L3_GH_data(3,n)=yz_angles(55,n);

L4_AB_data(1,n)=xy_angles(57,n);
L4_AB_data(2,n)=xz_angles(57,n);
L4_AB_data(3,n)=yz_angles(57,n);
L4_BC_data(1,n)=xy_angles(58,n);
L4_BC_data(2,n)=xz_angles(58,n);
L4_BC_data(3,n)=yz_angles(58,n);
L4_CD_data(1,n)=xy_angles(59,n);
L4_CD_data(2,n)=xz_angles(59,n);
L4_CD_data(3,n)=yz_angles(59,n);
L4_DE_data(1,n)=xy_angles(60,n);
L4_DE_data(2,n)=xz_angles(60,n);
L4_DE_data(3,n)=yz_angles(60,n);
L4_EF_data(1,n)=xy_angles(61,n);
L4_EF_data(2,n)=xz_angles(61,n);
L4_EF_data(3,n)=yz_angles(61,n);
L4_FG_data(1,n)=xy_angles(62,n);
L4_FG_data(2,n)=xz_angles(62,n);
L4_FG_data(3,n)=yz_angles(62,n);
L4_GH_data(1,n)=xy_angles(63,n);
L4_GH_data(2,n)=xz_angles(63,n);
L4_GH_data(3,n)=yz_angles(63,n);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Calculate the maxes of the data
max_R1_AB_xy=max(abs(R1_AB_data(1,:)));
max_R1_AB_xz=max(abs(R1_AB_data(2,:)));
max_R1_AB_yz=max(abs(R1_AB_data(3,:)));
max_R1_BC_xy=max(abs(R1_BC_data(1,:)));
max_R1_BC_xz=max(abs(R1_BC_data(2,:)));
max_R1_BC_yz=max(abs(R1_BC_data(3,:)));
max_R1_CD_xy=max(abs(R1_CD_data(1,:)));
max_R1_CD_xz=max(abs(R1_CD_data(2,:)));
max_R1_CD_yz=max(abs(R1_CD_data(3,:)));
max_R1_DE_xy=max(abs(R1_DE_data(1,:)));
max_R1_DE_xz=max(abs(R1_DE_data(2,:)));
max_R1_DE_yz=max(abs(R1_DE_data(3,:)));
max_R1_EF_xy=max(abs(R1_EF_data(1,:)));
max_R1_EF_xz=max(abs(R1_EF_data(2,:)));
max_R1_EF_yz=max(abs(R1_EF_data(3,:)));
max_R1_FG_xy=max(abs(R1_FG_data(1,:)));
max_R1_FG_xz=max(abs(R1_FG_data(2,:)));
max_R1_FG_yz=max(abs(R1_FG_data(3,:)));
max_R1_GH_xy=max(abs(R1_GH_data(1,:)));
max_R1_GH_xz=max(abs(R1_GH_data(2,:)));
max_R1_GH_yz=max(abs(R1_GH_data(3,:)));

max_R2_AB_xy=max(abs(R2_AB_data(1,:)));
max_R2_AB_xz=max(abs(R2_AB_data(2,:)));
max_R2_AB_yz=max(abs(R2_AB_data(3,:)));
max_R2_BC_xy=max(abs(R2_BC_data(1,:)));
max_R2_BC_xz=max(abs(R2_BC_data(2,:)));
max_R2_BC_yz=max(abs(R2_BC_data(3,:)));
max_R2_CD_xy=max(abs(R2_CD_data(1,:)));
max_R2_CD_xz=max(abs(R2_CD_data(2,:)));
max_R2_CD_yz=max(abs(R2_CD_data(3,:)));
max_R2_DE_xy=max(abs(R2_DE_data(1,:)));
max_R2_DE_xz=max(abs(R2_DE_data(2,:)));
max_R2_DE_yz=max(abs(R2_DE_data(3,:)));
max_R2_EF_xy=max(abs(R2_EF_data(1,:)));
max_R2_EF_xz=max(abs(R2_EF_data(2,:)));
max_R2_EF_yz=max(abs(R2_EF_data(3,:)));
max_R2_FG_xy=max(abs(R2_FG_data(1,:)));
max_R2_FG_xz=max(abs(R2_FG_data(2,:)));
max_R2_FG_yz=max(abs(R2_FG_data(3,:)));
max_R2_GH_xy=max(abs(R2_GH_data(1,:)));
max_R2_GH_xz=max(abs(R2_GH_data(2,:)));
max_R2_GH_yz=max(abs(R2_GH_data(3,:)));

max_R3_AB_xy=max(abs(R3_AB_data(1,:)));
max_R3_AB_xz=max(abs(R3_AB_data(2,:)));
max_R3_AB_yz=max(abs(R3_AB_data(3,:)));
max_R3_BC_xy=max(abs(R3_BC_data(1,:)));
max_R3_BC_xz=max(abs(R3_BC_data(2,:)));
max_R3_BC_yz=max(abs(R3_BC_data(3,:)));
max_R3_CD_xy=max(abs(R3_CD_data(1,:)));
max_R3_CD_xz=max(abs(R3_CD_data(2,:)));
max_R3_CD_yz=max(abs(R3_CD_data(3,:)));
max_R3_DE_xy=max(abs(R3_DE_data(1,:)));
max_R3_DE_xz=max(abs(R3_DE_data(2,:)));
max_R3_DE_yz=max(abs(R3_DE_data(3,:)));
max_R3_EF_xy=max(abs(R3_EF_data(1,:)));
max_R3_EF_xz=max(abs(R3_EF_data(2,:)));
max_R3_EF_yz=max(abs(R3_EF_data(3,:)));
max_R3_FG_xy=max(abs(R3_FG_data(1,:)));
max_R3_FG_xz=max(abs(R3_FG_data(2,:)));
max_R3_FG_yz=max(abs(R3_FG_data(3,:)));
max_R3_GH_xy=max(abs(R3_GH_data(1,:)));
max_R3_GH_xz=max(abs(R3_GH_data(2,:)));
max_R3_GH_yz=max(abs(R3_GH_data(3,:)));

max_R4_AB_xy=max(abs(R4_AB_data(1,:)));
max_R4_AB_xz=max(abs(R4_AB_data(2,:)));
max_R4_AB_yz=max(abs(R4_AB_data(3,:)));
max_R4_BC_xy=max(abs(R4_BC_data(1,:)));
max_R4_BC_xz=max(abs(R4_BC_data(2,:)));
max_R4_BC_yz=max(abs(R4_BC_data(3,:)));
max_R4_CD_xy=max(abs(R4_CD_data(1,:)));
max_R4_CD_xz=max(abs(R4_CD_data(2,:)));
max_R4_CD_yz=max(abs(R4_CD_data(3,:)));
max_R4_DE_xy=max(abs(R4_DE_data(1,:)));
max_R4_DE_xz=max(abs(R4_DE_data(2,:)));
max_R4_DE_yz=max(abs(R4_DE_data(3,:)));
max_R4_EF_xy=max(abs(R4_EF_data(1,:)));
max_R4_EF_xz=max(abs(R4_EF_data(2,:)));
max_R4_EF_yz=max(abs(R4_EF_data(3,:)));
max_R4_FG_xy=max(abs(R4_FG_data(1,:)));
max_R4_FG_xz=max(abs(R4_FG_data(2,:)));
max_R4_FG_yz=max(abs(R4_FG_data(3,:)));
max_R4_GH_xy=max(abs(R4_GH_data(1,:)));
max_R4_GH_xz=max(abs(R4_GH_data(2,:)));
max_R4_GH_yz=max(abs(R4_GH_data(3,:)));

max_L1_AB_xy=max(abs(L1_AB_data(1,:)));
max_L1_AB_xz=max(abs(L1_AB_data(2,:)));
max_L1_AB_yz=max(abs(L1_AB_data(3,:)));
max_L1_BC_xy=max(abs(L1_BC_data(1,:)));
max_L1_BC_xz=max(abs(L1_BC_data(2,:)));
max_L1_BC_yz=max(abs(L1_BC_data(3,:)));
max_L1_CD_xy=max(abs(L1_CD_data(1,:)));
max_L1_CD_xz=max(abs(L1_CD_data(2,:)));
max_L1_CD_yz=max(abs(L1_CD_data(3,:)));
max_L1_DE_xy=max(abs(L1_DE_data(1,:)));
max_L1_DE_xz=max(abs(L1_DE_data(2,:)));
max_L1_DE_yz=max(abs(L1_DE_data(3,:)));
max_L1_EF_xy=max(abs(L1_EF_data(1,:)));
max_L1_EF_xz=max(abs(L1_EF_data(2,:)));
max_L1_EF_yz=max(abs(L1_EF_data(3,:)));
max_L1_FG_xy=max(abs(L1_FG_data(1,:)));
max_L1_FG_xz=max(abs(L1_FG_data(2,:)));
max_L1_FG_yz=max(abs(L1_FG_data(3,:)));
max_L1_GH_xy=max(abs(L1_GH_data(1,:)));
max_L1_GH_xz=max(abs(L1_GH_data(2,:)));
max_L1_GH_yz=max(abs(L1_GH_data(3,:)));

max_L2_AB_xy=max(abs(L2_AB_data(1,:)));
max_L2_AB_xz=max(abs(L2_AB_data(2,:)));
max_L2_AB_yz=max(abs(L2_AB_data(3,:)));
max_L2_BC_xy=max(abs(L2_BC_data(1,:)));
max_L2_BC_xz=max(abs(L2_BC_data(2,:)));
max_L2_BC_yz=max(abs(L2_BC_data(3,:)));
max_L2_CD_xy=max(abs(L2_CD_data(1,:)));
max_L2_CD_xz=max(abs(L2_CD_data(2,:)));
max_L2_CD_yz=max(abs(L2_CD_data(3,:)));
max_L2_DE_xy=max(abs(L2_DE_data(1,:)));
max_L2_DE_xz=max(abs(L2_DE_data(2,:)));
max_L2_DE_yz=max(abs(L2_DE_data(3,:)));
max_L2_EF_xy=max(abs(L2_EF_data(1,:)));
max_L2_EF_xz=max(abs(L2_EF_data(2,:)));
max_L2_EF_yz=max(abs(L2_EF_data(3,:)));
max_L2_FG_xy=max(abs(L2_FG_data(1,:)));
max_L2_FG_xz=max(abs(L2_FG_data(2,:)));
max_L2_FG_yz=max(abs(L2_FG_data(3,:)));
max_L2_GH_xy=max(abs(L2_GH_data(1,:)));
max_L2_GH_xz=max(abs(L2_GH_data(2,:)));
max_L2_GH_yz=max(abs(L2_GH_data(3,:)));

max_L3_AB_xy=max(abs(L3_AB_data(1,:)));
max_L3_AB_xz=max(abs(L3_AB_data(2,:)));
max_L3_AB_yz=max(abs(L3_AB_data(3,:)));
max_L3_BC_xy=max(abs(L3_BC_data(1,:)));
max_L3_BC_xz=max(abs(L3_BC_data(2,:)));
max_L3_BC_yz=max(abs(L3_BC_data(3,:)));
max_L3_CD_xy=max(abs(L3_CD_data(1,:)));
max_L3_CD_xz=max(abs(L3_CD_data(2,:)));
max_L3_CD_yz=max(abs(L3_CD_data(3,:)));
max_L3_DE_xy=max(abs(L3_DE_data(1,:)));
max_L3_DE_xz=max(abs(L3_DE_data(2,:)));
max_L3_DE_yz=max(abs(L3_DE_data(3,:)));
max_L3_EF_xy=max(abs(L3_EF_data(1,:)));
max_L3_EF_xz=max(abs(L3_EF_data(2,:)));
max_L3_EF_yz=max(abs(L3_EF_data(3,:)));
max_L3_FG_xy=max(abs(L3_FG_data(1,:)));
max_L3_FG_xz=max(abs(L3_FG_data(2,:)));
max_L3_FG_yz=max(abs(L3_FG_data(3,:)));
max_L3_GH_xy=max(abs(L3_GH_data(1,:)));
max_L3_GH_xz=max(abs(L3_GH_data(2,:)));
max_L3_GH_yz=max(abs(L3_GH_data(3,:)));

max_L4_AB_xy=max(abs(L4_AB_data(1,:)));
max_L4_AB_xz=max(abs(L4_AB_data(2,:)));
max_L4_AB_yz=max(abs(L4_AB_data(3,:)));
max_L4_BC_xy=max(abs(L4_BC_data(1,:)));
max_L4_BC_xz=max(abs(L4_BC_data(2,:)));
max_L4_BC_yz=max(abs(L4_BC_data(3,:)));
max_L4_CD_xy=max(abs(L4_CD_data(1,:)));
max_L4_CD_xz=max(abs(L4_CD_data(2,:)));
max_L4_CD_yz=max(abs(L4_CD_data(3,:)));
max_L4_DE_xy=max(abs(L4_DE_data(1,:)));
max_L4_DE_xz=max(abs(L4_DE_data(2,:)));
max_L4_DE_yz=max(abs(L4_DE_data(3,:)));
max_L4_EF_xy=max(abs(L4_EF_data(1,:)));
max_L4_EF_xz=max(abs(L4_EF_data(2,:)));
max_L4_EF_yz=max(abs(L4_EF_data(3,:)));
max_L4_FG_xy=max(abs(L4_FG_data(1,:)));
max_L4_FG_xz=max(abs(L4_FG_data(2,:)));
max_L4_FG_yz=max(abs(L4_FG_data(3,:)));
max_L4_GH_xy=max(abs(L4_GH_data(1,:)));
max_L4_GH_xz=max(abs(L4_GH_data(2,:)));
max_L4_GH_yz=max(abs(L4_GH_data(3,:)));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%min angles for joint
min_R1_AB_xy=min(abs(R1_AB_data(1,:)));
min_R1_AB_xz=min(abs(R1_AB_data(2,:)));
min_R1_AB_yz=min(abs(R1_AB_data(3,:)));
min_R1_BC_xy=min(abs(R1_BC_data(1,:)));
min_R1_BC_xz=min(abs(R1_BC_data(2,:)));
min_R1_BC_yz=min(abs(R1_BC_data(3,:)));
min_R1_CD_xy=min(abs(R1_CD_data(1,:)));
min_R1_CD_xz=min(abs(R1_CD_data(2,:)));
min_R1_CD_yz=min(abs(R1_CD_data(3,:)));
min_R1_DE_xy=min(abs(R1_DE_data(1,:)));
min_R1_DE_xz=min(abs(R1_DE_data(2,:)));
min_R1_DE_yz=min(abs(R1_DE_data(3,:)));
min_R1_EF_xy=min(abs(R1_EF_data(1,:)));
min_R1_EF_xz=min(abs(R1_EF_data(2,:)));
min_R1_EF_yz=min(abs(R1_EF_data(3,:)));
min_R1_FG_xy=min(abs(R1_FG_data(1,:)));
min_R1_FG_xz=min(abs(R1_FG_data(2,:)));
min_R1_FG_yz=min(abs(R1_FG_data(3,:)));
min_R1_GH_xy=min(abs(R1_GH_data(1,:)));
min_R1_GH_xz=min(abs(R1_GH_data(2,:)));
min_R1_GH_yz=min(abs(R1_GH_data(3,:)));

min_R2_AB_xy=min(abs(R2_AB_data(1,:)));
min_R2_AB_xz=min(abs(R2_AB_data(2,:)));
min_R2_AB_yz=min(abs(R2_AB_data(3,:)));
min_R2_BC_xy=min(abs(R2_BC_data(1,:)));
min_R2_BC_xz=min(abs(R2_BC_data(2,:)));
min_R2_BC_yz=min(abs(R2_BC_data(3,:)));
min_R2_CD_xy=min(abs(R2_CD_data(1,:)));
min_R2_CD_xz=min(abs(R2_CD_data(2,:)));
min_R2_CD_yz=min(abs(R2_CD_data(3,:)));
min_R2_DE_xy=min(abs(R2_DE_data(1,:)));
min_R2_DE_xz=min(abs(R2_DE_data(2,:)));
min_R2_DE_yz=min(abs(R2_DE_data(3,:)));
min_R2_EF_xy=min(abs(R2_EF_data(1,:)));
min_R2_EF_xz=min(abs(R2_EF_data(2,:)));
min_R2_EF_yz=min(abs(R2_EF_data(3,:)));
min_R2_FG_xy=min(abs(R2_FG_data(1,:)));
min_R2_FG_xz=min(abs(R2_FG_data(2,:)));
min_R2_FG_yz=min(abs(R2_FG_data(3,:)));
min_R2_GH_xy=min(abs(R2_GH_data(1,:)));
min_R2_GH_xz=min(abs(R2_GH_data(2,:)));
min_R2_GH_yz=min(abs(R2_GH_data(3,:)));

min_R3_AB_xy=min(abs(R3_AB_data(1,:)));
min_R3_AB_xz=min(abs(R3_AB_data(2,:)));
min_R3_AB_yz=min(abs(R3_AB_data(3,:)));
min_R3_BC_xy=min(abs(R3_BC_data(1,:)));
min_R3_BC_xz=min(abs(R3_BC_data(2,:)));
min_R3_BC_yz=min(abs(R3_BC_data(3,:)));
min_R3_CD_xy=min(abs(R3_CD_data(1,:)));
min_R3_CD_xz=min(abs(R3_CD_data(2,:)));
min_R3_CD_yz=min(abs(R3_CD_data(3,:)));
min_R3_DE_xy=min(abs(R3_DE_data(1,:)));
min_R3_DE_xz=min(abs(R3_DE_data(2,:)));
min_R3_DE_yz=min(abs(R3_DE_data(3,:)));
min_R3_EF_xy=min(abs(R3_EF_data(1,:)));
min_R3_EF_xz=min(abs(R3_EF_data(2,:)));
min_R3_EF_yz=min(abs(R3_EF_data(3,:)));
min_R3_FG_xy=min(abs(R3_FG_data(1,:)));
min_R3_FG_xz=min(abs(R3_FG_data(2,:)));
min_R3_FG_yz=min(abs(R3_FG_data(3,:)));
min_R3_GH_xy=min(abs(R3_GH_data(1,:)));
min_R3_GH_xz=min(abs(R3_GH_data(2,:)));
min_R3_GH_yz=min(abs(R3_GH_data(3,:)));

min_R4_AB_xy=min(abs(R4_AB_data(1,:)));
min_R4_AB_xz=min(abs(R4_AB_data(2,:)));
min_R4_AB_yz=min(abs(R4_AB_data(3,:)));
min_R4_BC_xy=min(abs(R4_BC_data(1,:)));
min_R4_BC_xz=min(abs(R4_BC_data(2,:)));
min_R4_BC_yz=min(abs(R4_BC_data(3,:)));
min_R4_CD_xy=min(abs(R4_CD_data(1,:)));
min_R4_CD_xz=min(abs(R4_CD_data(2,:)));
min_R4_CD_yz=min(abs(R4_CD_data(3,:)));
min_R4_DE_xy=min(abs(R4_DE_data(1,:)));
min_R4_DE_xz=min(abs(R4_DE_data(2,:)));
min_R4_DE_yz=min(abs(R4_DE_data(3,:)));
min_R4_EF_xy=min(abs(R4_EF_data(1,:)));
min_R4_EF_xz=min(abs(R4_EF_data(2,:)));
min_R4_EF_yz=min(abs(R4_EF_data(3,:)));
min_R4_FG_xy=min(abs(R4_FG_data(1,:)));
min_R4_FG_xz=min(abs(R4_FG_data(2,:)));
min_R4_FG_yz=min(abs(R4_FG_data(3,:)));
min_R4_GH_xy=min(abs(R4_GH_data(1,:)));
min_R4_GH_xz=min(abs(R4_GH_data(2,:)));
min_R4_GH_yz=min(abs(R4_GH_data(3,:)));

min_L1_AB_xy=min(abs(L1_AB_data(1,:)));
min_L1_AB_xz=min(abs(L1_AB_data(2,:)));
min_L1_AB_yz=min(abs(L1_AB_data(3,:)));
min_L1_BC_xy=min(abs(L1_BC_data(1,:)));
min_L1_BC_xz=min(abs(L1_BC_data(2,:)));
min_L1_BC_yz=min(abs(L1_BC_data(3,:)));
min_L1_CD_xy=min(abs(L1_CD_data(1,:)));
min_L1_CD_xz=min(abs(L1_CD_data(2,:)));
min_L1_CD_yz=min(abs(L1_CD_data(3,:)));
min_L1_DE_xy=min(abs(L1_DE_data(1,:)));
min_L1_DE_xz=min(abs(L1_DE_data(2,:)));
min_L1_DE_yz=min(abs(L1_DE_data(3,:)));
min_L1_EF_xy=min(abs(L1_EF_data(1,:)));
min_L1_EF_xz=min(abs(L1_EF_data(2,:)));
min_L1_EF_yz=min(abs(L1_EF_data(3,:)));
min_L1_FG_xy=min(abs(L1_FG_data(1,:)));
min_L1_FG_xz=min(abs(L1_FG_data(2,:)));
min_L1_FG_yz=min(abs(L1_FG_data(3,:)));
min_L1_GH_xy=min(abs(L1_GH_data(1,:)));
min_L1_GH_xz=min(abs(L1_GH_data(2,:)));
min_L1_GH_yz=min(abs(L1_GH_data(3,:)));

min_L2_AB_xy=min(abs(L2_AB_data(1,:)));
min_L2_AB_xz=min(abs(L2_AB_data(2,:)));
min_L2_AB_yz=min(abs(L2_AB_data(3,:)));
min_L2_BC_xy=min(abs(L2_BC_data(1,:)));
min_L2_BC_xz=min(abs(L2_BC_data(2,:)));
min_L2_BC_yz=min(abs(L2_BC_data(3,:)));
min_L2_CD_xy=min(abs(L2_CD_data(1,:)));
min_L2_CD_xz=min(abs(L2_CD_data(2,:)));
min_L2_CD_yz=min(abs(L2_CD_data(3,:)));
min_L2_DE_xy=min(abs(L2_DE_data(1,:)));
min_L2_DE_xz=min(abs(L2_DE_data(2,:)));
min_L2_DE_yz=min(abs(L2_DE_data(3,:)));
min_L2_EF_xy=min(abs(L2_EF_data(1,:)));
min_L2_EF_xz=min(abs(L2_EF_data(2,:)));
min_L2_EF_yz=min(abs(L2_EF_data(3,:)));
min_L2_FG_xy=min(abs(L2_FG_data(1,:)));
min_L2_FG_xz=min(abs(L2_FG_data(2,:)));
min_L2_FG_yz=min(abs(L2_FG_data(3,:)));
min_L2_GH_xy=min(abs(L2_GH_data(1,:)));
min_L2_GH_xz=min(abs(L2_GH_data(2,:)));
min_L2_GH_yz=min(abs(L2_GH_data(3,:)));

min_L3_AB_xy=min(abs(L3_AB_data(1,:)));
min_L3_AB_xz=min(abs(L3_AB_data(2,:)));
min_L3_AB_yz=min(abs(L3_AB_data(3,:)));
min_L3_BC_xy=min(abs(L3_BC_data(1,:)));
min_L3_BC_xz=min(abs(L3_BC_data(2,:)));
min_L3_BC_yz=min(abs(L3_BC_data(3,:)));
min_L3_CD_xy=min(abs(L3_CD_data(1,:)));
min_L3_CD_xz=min(abs(L3_CD_data(2,:)));
min_L3_CD_yz=min(abs(L3_CD_data(3,:)));
min_L3_DE_xy=min(abs(L3_DE_data(1,:)));
min_L3_DE_xz=min(abs(L3_DE_data(2,:)));
min_L3_DE_yz=min(abs(L3_DE_data(3,:)));
min_L3_EF_xy=min(abs(L3_EF_data(1,:)));
min_L3_EF_xz=min(abs(L3_EF_data(2,:)));
min_L3_EF_yz=min(abs(L3_EF_data(3,:)));
min_L3_FG_xy=min(abs(L3_FG_data(1,:)));
min_L3_FG_xz=min(abs(L3_FG_data(2,:)));
min_L3_FG_yz=min(abs(L3_FG_data(3,:)));
min_L3_GH_xy=min(abs(L3_GH_data(1,:)));
min_L3_GH_xz=min(abs(L3_GH_data(2,:)));
min_L3_GH_yz=min(abs(L3_GH_data(3,:)));

min_L4_AB_xy=min(abs(L4_AB_data(1,:)));
min_L4_AB_xz=min(abs(L4_AB_data(2,:)));
min_L4_AB_yz=min(abs(L4_AB_data(3,:)));
min_L4_BC_xy=min(abs(L4_BC_data(1,:)));
min_L4_BC_xz=min(abs(L4_BC_data(2,:)));
min_L4_BC_yz=min(abs(L4_BC_data(3,:)));
min_L4_CD_xy=min(abs(L4_CD_data(1,:)));
min_L4_CD_xz=min(abs(L4_CD_data(2,:)));
min_L4_CD_yz=min(abs(L4_CD_data(3,:)));
min_L4_DE_xy=min(abs(L4_DE_data(1,:)));
min_L4_DE_xz=min(abs(L4_DE_data(2,:)));
min_L4_DE_yz=min(abs(L4_DE_data(3,:)));
min_L4_EF_xy=min(abs(L4_EF_data(1,:)));
min_L4_EF_xz=min(abs(L4_EF_data(2,:)));
min_L4_EF_yz=min(abs(L4_EF_data(3,:)));
min_L4_FG_xy=min(abs(L4_FG_data(1,:)));
min_L4_FG_xz=min(abs(L4_FG_data(2,:)));
min_L4_FG_yz=min(abs(L4_FG_data(3,:)));
min_L4_GH_xy=min(abs(L4_GH_data(1,:)));
min_L4_GH_xz=min(abs(L4_GH_data(2,:)));
min_L4_GH_yz=min(abs(L4_GH_data(3,:)));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Average angles for each joint
avg_R1_AB_xy=mean(abs(R1_AB_data(1,:)));
avg_R1_AB_xz=mean(abs(R1_AB_data(2,:)));
avg_R1_AB_yz=mean(abs(R1_AB_data(3,:)));
avg_R1_BC_xy=mean(abs(R1_BC_data(1,:)));
avg_R1_BC_xz=mean(abs(R1_BC_data(2,:)));
avg_R1_BC_yz=mean(abs(R1_BC_data(3,:)));
avg_R1_CD_xy=mean(abs(R1_CD_data(1,:)));
avg_R1_CD_xz=mean(abs(R1_CD_data(2,:)));
avg_R1_CD_yz=mean(abs(R1_CD_data(3,:)));
avg_R1_DE_xy=mean(abs(R1_DE_data(1,:)));
avg_R1_DE_xz=mean(abs(R1_DE_data(2,:)));
avg_R1_DE_yz=mean(abs(R1_DE_data(3,:)));
avg_R1_EF_xy=mean(abs(R1_EF_data(1,:)));
avg_R1_EF_xz=mean(abs(R1_EF_data(2,:)));
avg_R1_EF_yz=mean(abs(R1_EF_data(3,:)));
avg_R1_FG_xy=mean(abs(R1_FG_data(1,:)));
avg_R1_FG_xz=mean(abs(R1_FG_data(2,:)));
avg_R1_FG_yz=mean(abs(R1_FG_data(3,:)));
avg_R1_GH_xy=mean(abs(R1_GH_data(1,:)));
avg_R1_GH_xz=mean(abs(R1_GH_data(2,:)));
avg_R1_GH_yz=mean(abs(R1_GH_data(3,:)));

avg_R2_AB_xy=mean(abs(R2_AB_data(1,:)));
avg_R2_AB_xz=mean(abs(R2_AB_data(2,:)));
avg_R2_AB_yz=mean(abs(R2_AB_data(3,:)));
avg_R2_BC_xy=mean(abs(R2_BC_data(1,:)));
avg_R2_BC_xz=mean(abs(R2_BC_data(2,:)));
avg_R2_BC_yz=mean(abs(R2_BC_data(3,:)));
avg_R2_CD_xy=mean(abs(R2_CD_data(1,:)));
avg_R2_CD_xz=mean(abs(R2_CD_data(2,:)));
avg_R2_CD_yz=mean(abs(R2_CD_data(3,:)));
avg_R2_DE_xy=mean(abs(R2_DE_data(1,:)));
avg_R2_DE_xz=mean(abs(R2_DE_data(2,:)));
avg_R2_DE_yz=mean(abs(R2_DE_data(3,:)));
avg_R2_EF_xy=mean(abs(R2_EF_data(1,:)));
avg_R2_EF_xz=mean(abs(R2_EF_data(2,:)));
avg_R2_EF_yz=mean(abs(R2_EF_data(3,:)));
avg_R2_FG_xy=mean(abs(R2_FG_data(1,:)));
avg_R2_FG_xz=mean(abs(R2_FG_data(2,:)));
avg_R2_FG_yz=mean(abs(R2_FG_data(3,:)));
avg_R2_GH_xy=mean(abs(R2_GH_data(1,:)));
avg_R2_GH_xz=mean(abs(R2_GH_data(2,:)));
avg_R2_GH_yz=mean(abs(R2_GH_data(3,:)));

avg_R3_AB_xy=mean(abs(R3_AB_data(1,:)));
avg_R3_AB_xz=mean(abs(R3_AB_data(2,:)));
avg_R3_AB_yz=mean(abs(R3_AB_data(3,:)));
avg_R3_BC_xy=mean(abs(R3_BC_data(1,:)));
avg_R3_BC_xz=mean(abs(R3_BC_data(2,:)));
avg_R3_BC_yz=mean(abs(R3_BC_data(3,:)));
avg_R3_CD_xy=mean(abs(R3_CD_data(1,:)));
avg_R3_CD_xz=mean(abs(R3_CD_data(2,:)));
avg_R3_CD_yz=mean(abs(R3_CD_data(3,:)));
avg_R3_DE_xy=mean(abs(R3_DE_data(1,:)));
avg_R3_DE_xz=mean(abs(R3_DE_data(2,:)));
avg_R3_DE_yz=mean(abs(R3_DE_data(3,:)));
avg_R3_EF_xy=mean(abs(R3_EF_data(1,:)));
avg_R3_EF_xz=mean(abs(R3_EF_data(2,:)));
avg_R3_EF_yz=mean(abs(R3_EF_data(3,:)));
avg_R3_FG_xy=mean(abs(R3_FG_data(1,:)));
avg_R3_FG_xz=mean(abs(R3_FG_data(2,:)));
avg_R3_FG_yz=mean(abs(R3_FG_data(3,:)));
avg_R3_GH_xy=mean(abs(R3_GH_data(1,:)));
avg_R3_GH_xz=mean(abs(R3_GH_data(2,:)));
avg_R3_GH_yz=mean(abs(R3_GH_data(3,:)));

avg_R4_AB_xy=mean(abs(R4_AB_data(1,:)));
avg_R4_AB_xz=mean(abs(R4_AB_data(2,:)));
avg_R4_AB_yz=mean(abs(R4_AB_data(3,:)));
avg_R4_BC_xy=mean(abs(R4_BC_data(1,:)));
avg_R4_BC_xz=mean(abs(R4_BC_data(2,:)));
avg_R4_BC_yz=mean(abs(R4_BC_data(3,:)));
avg_R4_CD_xy=mean(abs(R4_CD_data(1,:)));
avg_R4_CD_xz=mean(abs(R4_CD_data(2,:)));
avg_R4_CD_yz=mean(abs(R4_CD_data(3,:)));
avg_R4_DE_xy=mean(abs(R4_DE_data(1,:)));
avg_R4_DE_xz=mean(abs(R4_DE_data(2,:)));
avg_R4_DE_yz=mean(abs(R4_DE_data(3,:)));
avg_R4_EF_xy=mean(abs(R4_EF_data(1,:)));
avg_R4_EF_xz=mean(abs(R4_EF_data(2,:)));
avg_R4_EF_yz=mean(abs(R4_EF_data(3,:)));
avg_R4_FG_xy=mean(abs(R4_FG_data(1,:)));
avg_R4_FG_xz=mean(abs(R4_FG_data(2,:)));
avg_R4_FG_yz=mean(abs(R4_FG_data(3,:)));
avg_R4_GH_xy=mean(abs(R4_GH_data(1,:)));
avg_R4_GH_xz=mean(abs(R4_GH_data(2,:)));
avg_R4_GH_yz=mean(abs(R4_GH_data(3,:)));

avg_L1_AB_xy=mean(abs(L1_AB_data(1,:)));
avg_L1_AB_xz=mean(abs(L1_AB_data(2,:)));
avg_L1_AB_yz=mean(abs(L1_AB_data(3,:)));
avg_L1_BC_xy=mean(abs(L1_BC_data(1,:)));
avg_L1_BC_xz=mean(abs(L1_BC_data(2,:)));
avg_L1_BC_yz=mean(abs(L1_BC_data(3,:)));
avg_L1_CD_xy=mean(abs(L1_CD_data(1,:)));
avg_L1_CD_xz=mean(abs(L1_CD_data(2,:)));
avg_L1_CD_yz=mean(abs(L1_CD_data(3,:)));
avg_L1_DE_xy=mean(abs(L1_DE_data(1,:)));
avg_L1_DE_xz=mean(abs(L1_DE_data(2,:)));
avg_L1_DE_yz=mean(abs(L1_DE_data(3,:)));
avg_L1_EF_xy=mean(abs(L1_EF_data(1,:)));
avg_L1_EF_xz=mean(abs(L1_EF_data(2,:)));
avg_L1_EF_yz=mean(abs(L1_EF_data(3,:)));
avg_L1_FG_xy=mean(abs(L1_FG_data(1,:)));
avg_L1_FG_xz=mean(abs(L1_FG_data(2,:)));
avg_L1_FG_yz=mean(abs(L1_FG_data(3,:)));
avg_L1_GH_xy=mean(abs(L1_GH_data(1,:)));
avg_L1_GH_xz=mean(abs(L1_GH_data(2,:)));
avg_L1_GH_yz=mean(abs(L1_GH_data(3,:)));

avg_L2_AB_xy=mean(abs(L2_AB_data(1,:)));
avg_L2_AB_xz=mean(abs(L2_AB_data(2,:)));
avg_L2_AB_yz=mean(abs(L2_AB_data(3,:)));
avg_L2_BC_xy=mean(abs(L2_BC_data(1,:)));
avg_L2_BC_xz=mean(abs(L2_BC_data(2,:)));
avg_L2_BC_yz=mean(abs(L2_BC_data(3,:)));
avg_L2_CD_xy=mean(abs(L2_CD_data(1,:)));
avg_L2_CD_xz=mean(abs(L2_CD_data(2,:)));
avg_L2_CD_yz=mean(abs(L2_CD_data(3,:)));
avg_L2_DE_xy=mean(abs(L2_DE_data(1,:)));
avg_L2_DE_xz=mean(abs(L2_DE_data(2,:)));
avg_L2_DE_yz=mean(abs(L2_DE_data(3,:)));
avg_L2_EF_xy=mean(abs(L2_EF_data(1,:)));
avg_L2_EF_xz=mean(abs(L2_EF_data(2,:)));
avg_L2_EF_yz=mean(abs(L2_EF_data(3,:)));
avg_L2_FG_xy=mean(abs(L2_FG_data(1,:)));
avg_L2_FG_xz=mean(abs(L2_FG_data(2,:)));
avg_L2_FG_yz=mean(abs(L2_FG_data(3,:)));
avg_L2_GH_xy=mean(abs(L2_GH_data(1,:)));
avg_L2_GH_xz=mean(abs(L2_GH_data(2,:)));
avg_L2_GH_yz=mean(abs(L2_GH_data(3,:)));

avg_L3_AB_xy=mean(abs(L3_AB_data(1,:)));
avg_L3_AB_xz=mean(abs(L3_AB_data(2,:)));
avg_L3_AB_yz=mean(abs(L3_AB_data(3,:)));
avg_L3_BC_xy=mean(abs(L3_BC_data(1,:)));
avg_L3_BC_xz=mean(abs(L3_BC_data(2,:)));
avg_L3_BC_yz=mean(abs(L3_BC_data(3,:)));
avg_L3_CD_xy=mean(abs(L3_CD_data(1,:)));
avg_L3_CD_xz=mean(abs(L3_CD_data(2,:)));
avg_L3_CD_yz=mean(abs(L3_CD_data(3,:)));
avg_L3_DE_xy=mean(abs(L3_DE_data(1,:)));
avg_L3_DE_xz=mean(abs(L3_DE_data(2,:)));
avg_L3_DE_yz=mean(abs(L3_DE_data(3,:)));
avg_L3_EF_xy=mean(abs(L3_EF_data(1,:)));
avg_L3_EF_xz=mean(abs(L3_EF_data(2,:)));
avg_L3_EF_yz=mean(abs(L3_EF_data(3,:)));
avg_L3_FG_xy=mean(abs(L3_FG_data(1,:)));
avg_L3_FG_xz=mean(abs(L3_FG_data(2,:)));
avg_L3_FG_yz=mean(abs(L3_FG_data(3,:)));
avg_L3_GH_xy=mean(abs(L3_GH_data(1,:)));
avg_L3_GH_xz=mean(abs(L3_GH_data(2,:)));
avg_L3_GH_yz=mean(abs(L3_GH_data(3,:)));

avg_L4_AB_xy=mean(abs(L4_AB_data(1,:)));
avg_L4_AB_xz=mean(abs(L4_AB_data(2,:)));
avg_L4_AB_yz=mean(abs(L4_AB_data(3,:)));
avg_L4_BC_xy=mean(abs(L4_BC_data(1,:)));
avg_L4_BC_xz=mean(abs(L4_BC_data(2,:)));
avg_L4_BC_yz=mean(abs(L4_BC_data(3,:)));
avg_L4_CD_xy=mean(abs(L4_CD_data(1,:)));
avg_L4_CD_xz=mean(abs(L4_CD_data(2,:)));
avg_L4_CD_yz=mean(abs(L4_CD_data(3,:)));
avg_L4_DE_xy=mean(abs(L4_DE_data(1,:)));
avg_L4_DE_xz=mean(abs(L4_DE_data(2,:)));
avg_L4_DE_yz=mean(abs(L4_DE_data(3,:)));
avg_L4_EF_xy=mean(abs(L4_EF_data(1,:)));
avg_L4_EF_xz=mean(abs(L4_EF_data(2,:)));
avg_L4_EF_yz=mean(abs(L4_EF_data(3,:)));
avg_L4_FG_xy=mean(abs(L4_FG_data(1,:)));
avg_L4_FG_xz=mean(abs(L4_FG_data(2,:)));
avg_L4_FG_yz=mean(abs(L4_FG_data(3,:)));
avg_L4_GH_xy=mean(abs(L4_GH_data(1,:)));
avg_L4_GH_xz=mean(abs(L4_GH_data(2,:)));
avg_L4_GH_yz=mean(abs(L4_GH_data(3,:)));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%standard deviation 

stdev_R1_AB_xy=std(abs(R1_AB_data(1,:)));
stdev_R1_AB_xz=std(abs(R1_AB_data(2,:)));
stdev_R1_AB_yz=std(abs(R1_AB_data(3,:)));
stdev_R1_BC_xy=std(abs(R1_BC_data(1,:)));
stdev_R1_BC_xz=std(abs(R1_BC_data(2,:)));
stdev_R1_BC_yz=std(abs(R1_BC_data(3,:)));
stdev_R1_CD_xy=std(abs(R1_CD_data(1,:)));
stdev_R1_CD_xz=std(abs(R1_CD_data(2,:)));
stdev_R1_CD_yz=std(abs(R1_CD_data(3,:)));
stdev_R1_DE_xy=std(abs(R1_DE_data(1,:)));
stdev_R1_DE_xz=std(abs(R1_DE_data(2,:)));
stdev_R1_DE_yz=std(abs(R1_DE_data(3,:)));
stdev_R1_EF_xy=std(abs(R1_EF_data(1,:)));
stdev_R1_EF_xz=std(abs(R1_EF_data(2,:)));
stdev_R1_EF_yz=std(abs(R1_EF_data(3,:)));
stdev_R1_FG_xy=std(abs(R1_FG_data(1,:)));
stdev_R1_FG_xz=std(abs(R1_FG_data(2,:)));
stdev_R1_FG_yz=std(abs(R1_FG_data(3,:)));
stdev_R1_GH_xy=std(abs(R1_GH_data(1,:)));
stdev_R1_GH_xz=std(abs(R1_GH_data(2,:)));
stdev_R1_GH_yz=std(abs(R1_GH_data(3,:)));

stdev_R2_AB_xy=std(abs(R2_AB_data(1,:)));
stdev_R2_AB_xz=std(abs(R2_AB_data(2,:)));
stdev_R2_AB_yz=std(abs(R2_AB_data(3,:)));
stdev_R2_BC_xy=std(abs(R2_BC_data(1,:)));
stdev_R2_BC_xz=std(abs(R2_BC_data(2,:)));
stdev_R2_BC_yz=std(abs(R2_BC_data(3,:)));
stdev_R2_CD_xy=std(abs(R2_CD_data(1,:)));
stdev_R2_CD_xz=std(abs(R2_CD_data(2,:)));
stdev_R2_CD_yz=std(abs(R2_CD_data(3,:)));
stdev_R2_DE_xy=std(abs(R2_DE_data(1,:)));
stdev_R2_DE_xz=std(abs(R2_DE_data(2,:)));
stdev_R2_DE_yz=std(abs(R2_DE_data(3,:)));
stdev_R2_EF_xy=std(abs(R2_EF_data(1,:)));
stdev_R2_EF_xz=std(abs(R2_EF_data(2,:)));
stdev_R2_EF_yz=std(abs(R2_EF_data(3,:)));
stdev_R2_FG_xy=std(abs(R2_FG_data(1,:)));
stdev_R2_FG_xz=std(abs(R2_FG_data(2,:)));
stdev_R2_FG_yz=std(abs(R2_FG_data(3,:)));
stdev_R2_GH_xy=std(abs(R2_GH_data(1,:)));
stdev_R2_GH_xz=std(abs(R2_GH_data(2,:)));
stdev_R2_GH_yz=std(abs(R2_GH_data(3,:)));

stdev_R3_AB_xy=std(abs(R3_AB_data(1,:)));
stdev_R3_AB_xz=std(abs(R3_AB_data(2,:)));
stdev_R3_AB_yz=std(abs(R3_AB_data(3,:)));
stdev_R3_BC_xy=std(abs(R3_BC_data(1,:)));
stdev_R3_BC_xz=std(abs(R3_BC_data(2,:)));
stdev_R3_BC_yz=std(abs(R3_BC_data(3,:)));
stdev_R3_CD_xy=std(abs(R3_CD_data(1,:)));
stdev_R3_CD_xz=std(abs(R3_CD_data(2,:)));
stdev_R3_CD_yz=std(abs(R3_CD_data(3,:)));
stdev_R3_DE_xy=std(abs(R3_DE_data(1,:)));
stdev_R3_DE_xz=std(abs(R3_DE_data(2,:)));
stdev_R3_DE_yz=std(abs(R3_DE_data(3,:)));
stdev_R3_EF_xy=std(abs(R3_EF_data(1,:)));
stdev_R3_EF_xz=std(abs(R3_EF_data(2,:)));
stdev_R3_EF_yz=std(abs(R3_EF_data(3,:)));
stdev_R3_FG_xy=std(abs(R3_FG_data(1,:)));
stdev_R3_FG_xz=std(abs(R3_FG_data(2,:)));
stdev_R3_FG_yz=std(abs(R3_FG_data(3,:)));
stdev_R3_GH_xy=std(abs(R3_GH_data(1,:)));
stdev_R3_GH_xz=std(abs(R3_GH_data(2,:)));
stdev_R3_GH_yz=std(abs(R3_GH_data(3,:)));

stdev_R4_AB_xy=std(abs(R4_AB_data(1,:)));
stdev_R4_AB_xz=std(abs(R4_AB_data(2,:)));
stdev_R4_AB_yz=std(abs(R4_AB_data(3,:)));
stdev_R4_BC_xy=std(abs(R4_BC_data(1,:)));
stdev_R4_BC_xz=std(abs(R4_BC_data(2,:)));
stdev_R4_BC_yz=std(abs(R4_BC_data(3,:)));
stdev_R4_CD_xy=std(abs(R4_CD_data(1,:)));
stdev_R4_CD_xz=std(abs(R4_CD_data(2,:)));
stdev_R4_CD_yz=std(abs(R4_CD_data(3,:)));
stdev_R4_DE_xy=std(abs(R4_DE_data(1,:)));
stdev_R4_DE_xz=std(abs(R4_DE_data(2,:)));
stdev_R4_DE_yz=std(abs(R4_DE_data(3,:)));
stdev_R4_EF_xy=std(abs(R4_EF_data(1,:)));
stdev_R4_EF_xz=std(abs(R4_EF_data(2,:)));
stdev_R4_EF_yz=std(abs(R4_EF_data(3,:)));
stdev_R4_FG_xy=std(abs(R4_FG_data(1,:)));
stdev_R4_FG_xz=std(abs(R4_FG_data(2,:)));
stdev_R4_FG_yz=std(abs(R4_FG_data(3,:)));
stdev_R4_GH_xy=std(abs(R4_GH_data(1,:)));
stdev_R4_GH_xz=std(abs(R4_GH_data(2,:)));
stdev_R4_GH_yz=std(abs(R4_GH_data(3,:)));

stdev_L1_AB_xy=std(abs(L1_AB_data(1,:)));
stdev_L1_AB_xz=std(abs(L1_AB_data(2,:)));
stdev_L1_AB_yz=std(abs(L1_AB_data(3,:)));
stdev_L1_BC_xy=std(abs(L1_BC_data(1,:)));
stdev_L1_BC_xz=std(abs(L1_BC_data(2,:)));
stdev_L1_BC_yz=std(abs(L1_BC_data(3,:)));
stdev_L1_CD_xy=std(abs(L1_CD_data(1,:)));
stdev_L1_CD_xz=std(abs(L1_CD_data(2,:)));
stdev_L1_CD_yz=std(abs(L1_CD_data(3,:)));
stdev_L1_DE_xy=std(abs(L1_DE_data(1,:)));
stdev_L1_DE_xz=std(abs(L1_DE_data(2,:)));
stdev_L1_DE_yz=std(abs(L1_DE_data(3,:)));
stdev_L1_EF_xy=std(abs(L1_EF_data(1,:)));
stdev_L1_EF_xz=std(abs(L1_EF_data(2,:)));
stdev_L1_EF_yz=std(abs(L1_EF_data(3,:)));
stdev_L1_FG_xy=std(abs(L1_FG_data(1,:)));
stdev_L1_FG_xz=std(abs(L1_FG_data(2,:)));
stdev_L1_FG_yz=std(abs(L1_FG_data(3,:)));
stdev_L1_GH_xy=std(abs(L1_GH_data(1,:)));
stdev_L1_GH_xz=std(abs(L1_GH_data(2,:)));
stdev_L1_GH_yz=std(abs(L1_GH_data(3,:)));

stdev_L2_AB_xy=std(abs(L2_AB_data(1,:)));
stdev_L2_AB_xz=std(abs(L2_AB_data(2,:)));
stdev_L2_AB_yz=std(abs(L2_AB_data(3,:)));
stdev_L2_BC_xy=std(abs(L2_BC_data(1,:)));
stdev_L2_BC_xz=std(abs(L2_BC_data(2,:)));
stdev_L2_BC_yz=std(abs(L2_BC_data(3,:)));
stdev_L2_CD_xy=std(abs(L2_CD_data(1,:)));
stdev_L2_CD_xz=std(abs(L2_CD_data(2,:)));
stdev_L2_CD_yz=std(abs(L2_CD_data(3,:)));
stdev_L2_DE_xy=std(abs(L2_DE_data(1,:)));
stdev_L2_DE_xz=std(abs(L2_DE_data(2,:)));
stdev_L2_DE_yz=std(abs(L2_DE_data(3,:)));
stdev_L2_EF_xy=std(abs(L2_EF_data(1,:)));
stdev_L2_EF_xz=std(abs(L2_EF_data(2,:)));
stdev_L2_EF_yz=std(abs(L2_EF_data(3,:)));
stdev_L2_FG_xy=std(abs(L2_FG_data(1,:)));
stdev_L2_FG_xz=std(abs(L2_FG_data(2,:)));
stdev_L2_FG_yz=std(abs(L2_FG_data(3,:)));
stdev_L2_GH_xy=std(abs(L2_GH_data(1,:)));
stdev_L2_GH_xz=std(abs(L2_GH_data(2,:)));
stdev_L2_GH_yz=std(abs(L2_GH_data(3,:)));

stdev_L3_AB_xy=std(abs(L3_AB_data(1,:)));
stdev_L3_AB_xz=std(abs(L3_AB_data(2,:)));
stdev_L3_AB_yz=std(abs(L3_AB_data(3,:)));
stdev_L3_BC_xy=std(abs(L3_BC_data(1,:)));
stdev_L3_BC_xz=std(abs(L3_BC_data(2,:)));
stdev_L3_BC_yz=std(abs(L3_BC_data(3,:)));
stdev_L3_CD_xy=std(abs(L3_CD_data(1,:)));
stdev_L3_CD_xz=std(abs(L3_CD_data(2,:)));
stdev_L3_CD_yz=std(abs(L3_CD_data(3,:)));
stdev_L3_DE_xy=std(abs(L3_DE_data(1,:)));
stdev_L3_DE_xz=std(abs(L3_DE_data(2,:)));
stdev_L3_DE_yz=std(abs(L3_DE_data(3,:)));
stdev_L3_EF_xy=std(abs(L3_EF_data(1,:)));
stdev_L3_EF_xz=std(abs(L3_EF_data(2,:)));
stdev_L3_EF_yz=std(abs(L3_EF_data(3,:)));
stdev_L3_FG_xy=std(abs(L3_FG_data(1,:)));
stdev_L3_FG_xz=std(abs(L3_FG_data(2,:)));
stdev_L3_FG_yz=std(abs(L3_FG_data(3,:)));
stdev_L3_GH_xy=std(abs(L3_GH_data(1,:)));
stdev_L3_GH_xz=std(abs(L3_GH_data(2,:)));
stdev_L3_GH_yz=std(abs(L3_GH_data(3,:)));

stdev_L4_AB_xy=std(abs(L4_AB_data(1,:)));
stdev_L4_AB_xz=std(abs(L4_AB_data(2,:)));
stdev_L4_AB_yz=std(abs(L4_AB_data(3,:)));
stdev_L4_BC_xy=std(abs(L4_BC_data(1,:)));
stdev_L4_BC_xz=std(abs(L4_BC_data(2,:)));
stdev_L4_BC_yz=std(abs(L4_BC_data(3,:)));
stdev_L4_CD_xy=std(abs(L4_CD_data(1,:)));
stdev_L4_CD_xz=std(abs(L4_CD_data(2,:)));
stdev_L4_CD_yz=std(abs(L4_CD_data(3,:)));
stdev_L4_DE_xy=std(abs(L4_DE_data(1,:)));
stdev_L4_DE_xz=std(abs(L4_DE_data(2,:)));
stdev_L4_DE_yz=std(abs(L4_DE_data(3,:)));
stdev_L4_EF_xy=std(abs(L4_EF_data(1,:)));
stdev_L4_EF_xz=std(abs(L4_EF_data(2,:)));
stdev_L4_EF_yz=std(abs(L4_EF_data(3,:)));
stdev_L4_FG_xy=std(abs(L4_FG_data(1,:)));
stdev_L4_FG_xz=std(abs(L4_FG_data(2,:)));
stdev_L4_FG_yz=std(abs(L4_FG_data(3,:)));
stdev_L4_GH_xy=std(abs(L4_GH_data(1,:)));
stdev_L4_GH_xz=std(abs(L4_GH_data(2,:)));
stdev_L4_GH_yz=std(abs(L4_GH_data(3,:)));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plot R1 joints (Can be changed to analyze any joint set)
R1_avgs=[avg_R1_AB_xy,avg_R1_AB_xz, avg_R1_AB_yz; avg_R1_BC_xy,avg_R1_BC_xz, avg_R1_BC_yz;
    avg_R1_CD_xy,avg_R1_CD_xz, avg_R1_CD_yz; avg_R1_DE_xy,avg_R1_DE_xz, avg_R1_DE_yz;
    avg_R1_EF_xy,avg_R1_EF_xz, avg_R1_EF_yz; avg_R1_FG_xy,avg_R1_FG_xz,avg_R1_FG_yz;
    avg_R1_GH_xy, avg_R1_GH_xz, avg_R1_GH_yz];
R1_std=[stdev_R1_AB_xy,stdev_R1_AB_xz, stdev_R1_AB_yz; stdev_R1_BC_xy,stdev_R1_BC_xz, stdev_R1_BC_yz;
    stdev_R1_CD_xy,stdev_R1_CD_xz, stdev_R1_CD_yz; stdev_R1_DE_xy,stdev_R1_DE_xz, stdev_R1_DE_yz;
    stdev_R1_EF_xy,stdev_R1_EF_xz, stdev_R1_EF_yz; stdev_R1_FG_xy,stdev_R1_FG_xz, stdev_R1_FG_yz;
    stdev_R1_GH_xy, stdev_R1_GH_xz, stdev_R1_GH_yz];
R1_errhigh=R1_std;
x=[1,1,1;2,2,2;3,3,3;4,4,4;5,5,5;6,6,6;7,7,7];
figure
bars=bar(x,R1_avgs,'grouped', 'BarWidth',1);
hold on
bars(1).FaceColor=[1 1 0];
bars(2).FaceColor=[0 .75 0];
bars(3).FaceColor=[0 .75 .75];

ngroups = size(R1_avgs, 1);
nbars = size(R1_avgs, 2);
% Calculating the width for each bar group
groupwidth = min(0.8, nbars/(nbars + 1.5));

for i = 1:nbars
    x = (1:ngroups) - groupwidth/2 + (2*i-1) * groupwidth / (2*nbars);
    errorbar(x, R1_avgs(:,i), R1_errhigh(:,i), 'k','LineStyle','none');
end

xlabel('Joints')
ylabel('Absolute Value of Angle')
title('R1 Average Angles Per Joint')
name={'AB','BC','CD','DE','EF','FG','GH'};
set(gca,'xticklabel',name)
legend('xy','xz','yz')
hold off
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%R2 Heights throughout trial
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plot R2 joints
R2_avgs=[avg_R2_AB_xy,avg_R2_AB_xz, avg_R2_AB_yz; avg_R2_BC_xy,avg_R2_BC_xz, avg_R2_BC_yz;
    avg_R2_CD_xy,avg_R2_CD_xz, avg_R2_CD_yz; avg_R2_DE_xy,avg_R2_DE_xz, avg_R2_DE_yz;
    avg_R2_EF_xy,avg_R2_EF_xz, avg_R2_EF_yz; avg_R2_FG_xy,avg_R2_FG_xz,avg_R2_FG_yz;
    avg_R2_GH_xy, avg_R2_GH_xz, avg_R2_GH_yz];
R2_std=[stdev_R2_AB_xy,stdev_R2_AB_xz, stdev_R2_AB_yz; stdev_R2_BC_xy,stdev_R2_BC_xz, stdev_R2_BC_yz;
    stdev_R2_CD_xy,stdev_R2_CD_xz, stdev_R2_CD_yz; stdev_R2_DE_xy,stdev_R2_DE_xz, stdev_R2_DE_yz;
    stdev_R2_EF_xy,stdev_R2_EF_xz, stdev_R2_EF_yz; stdev_R2_FG_xy,stdev_R2_FG_xz, stdev_R2_FG_yz;
    stdev_R2_GH_xy, stdev_R2_GH_xz, stdev_R2_GH_yz];
R2_errhigh=R2_std;
x=[1,1,1;2,2,2;3,3,3;4,4,4;5,5,5;6,6,6;7,7,7];
figure
bars=bar(x,R2_avgs,'grouped', 'BarWidth',1);
hold on
bars(1).FaceColor=[1 1 0];
bars(2).FaceColor=[0 .75 0];
bars(3).FaceColor=[0 .75 .75];

ngroups = size(R2_avgs, 1);
nbars = size(R2_avgs, 2);
% Calculating the width for each bar group
groupwidth = min(0.8, nbars/(nbars + 1.5));

for i = 1:nbars
    x = (1:ngroups) - groupwidth/2 + (2*i-1) * groupwidth / (2*nbars);
    errorbar(x, R2_avgs(:,i), R2_errhigh(:,i), 'k','LineStyle','none');
end

xlabel('Joints')
ylabel('Absolute Value of Angle')
title('R2 Average Angles Per Joint')
name={'AB','BC','CD','DE','EF','FG','GH'};
set(gca,'xticklabel',name)
legend('xy','xz','yz')
hold off
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plot R3 Joints
R3_avgs=[avg_R3_AB_xy,avg_R3_AB_xz, avg_R3_AB_yz; avg_R3_BC_xy,avg_R3_BC_xz, avg_R3_BC_yz;
    avg_R3_CD_xy,avg_R3_CD_xz, avg_R3_CD_yz; avg_R3_DE_xy,avg_R3_DE_xz, avg_R3_DE_yz;
    avg_R3_EF_xy,avg_R3_EF_xz, avg_R3_EF_yz; avg_R3_FG_xy,avg_R3_FG_xz,avg_R3_FG_yz;
    avg_R3_GH_xy, avg_R3_GH_xz, avg_R3_GH_yz];
R3_std=[stdev_R3_AB_xy,stdev_R3_AB_xz, stdev_R3_AB_yz; stdev_R3_BC_xy,stdev_R3_BC_xz, stdev_R3_BC_yz;
    stdev_R3_CD_xy,stdev_R3_CD_xz, stdev_R3_CD_yz; stdev_R3_DE_xy,stdev_R3_DE_xz, stdev_R3_DE_yz;
    stdev_R3_EF_xy,stdev_R3_EF_xz, stdev_R3_EF_yz; stdev_R3_FG_xy,stdev_R3_FG_xz, stdev_R3_FG_yz;
    stdev_R3_GH_xy, stdev_R3_GH_xz, stdev_R3_GH_yz];
R3_errhigh=R3_std;
x=[1,1,1;2,2,2;3,3,3;4,4,4;5,5,5;6,6,6;7,7,7];
figure
bars=bar(x,R3_avgs,'grouped', 'BarWidth',1);
hold on
bars(1).FaceColor=[1 1 0];
bars(2).FaceColor=[0 .75 0];
bars(3).FaceColor=[0 .75 .75];

ngroups = size(R3_avgs, 1);
nbars = size(R3_avgs, 2);
% Calculating the width for each bar group
groupwidth = min(0.8, nbars/(nbars + 1.5));

for i = 1:nbars
    x = (1:ngroups) - groupwidth/2 + (2*i-1) * groupwidth / (2*nbars);
    errorbar(x, R3_avgs(:,i), R3_errhigh(:,i), 'k','LineStyle','none');
end

xlabel('Joints')
ylabel('Absolute Value of Angle')
title('R3 Average Angles Per Joint')
name={'AB','BC','CD','DE','EF','FG','GH'};
set(gca,'xticklabel',name)
legend('xy','xz','yz')
hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plot R4 joints
R4_avgs=[avg_R4_AB_xy,avg_R4_AB_xz, avg_R4_AB_yz; avg_R4_BC_xy,avg_R4_BC_xz, avg_R4_BC_yz;
    avg_R4_CD_xy,avg_R4_CD_xz, avg_R4_CD_yz; avg_R4_DE_xy,avg_R4_DE_xz, avg_R4_DE_yz;
    avg_R4_EF_xy,avg_R4_EF_xz, avg_R4_EF_yz; avg_R4_FG_xy,avg_R4_FG_xz,avg_R4_FG_yz;
    avg_R4_GH_xy, avg_R4_GH_xz, avg_R4_GH_yz];
R4_std=[stdev_R4_AB_xy,stdev_R4_AB_xz, stdev_R4_AB_yz; stdev_R4_BC_xy,stdev_R4_BC_xz, stdev_R4_BC_yz;
    stdev_R4_CD_xy,stdev_R4_CD_xz, stdev_R4_CD_yz; stdev_R4_DE_xy,stdev_R4_DE_xz, stdev_R4_DE_yz;
    stdev_R4_EF_xy,stdev_R4_EF_xz, stdev_R4_EF_yz; stdev_R4_FG_xy,stdev_R4_FG_xz, stdev_R4_FG_yz;
    stdev_R4_GH_xy, stdev_R4_GH_xz, stdev_R4_GH_yz];
R4_errhigh=R4_std;
x=[1,1,1;2,2,2;3,3,3;4,4,4;5,5,5;6,6,6;7,7,7];
figure
bars=bar(x,R4_avgs,'grouped', 'BarWidth',1);
hold on
bars(1).FaceColor=[1 1 0];
bars(2).FaceColor=[0 .75 0];
bars(3).FaceColor=[0 .75 .75];

ngroups = size(R4_avgs, 1);
nbars = size(R4_avgs, 2);
% Calculating the width for each bar group
groupwidth = min(0.8, nbars/(nbars + 1.5));

for i = 1:nbars
    x = (1:ngroups) - groupwidth/2 + (2*i-1) * groupwidth / (2*nbars);
    errorbar(x, R4_avgs(:,i), R4_errhigh(:,i), 'k','LineStyle','none');
end

xlabel('Joints')
ylabel('Absolute Value of Angle')
title('R4 Average Angles Per Joint')
name={'AB','BC','CD','DE','EF','FG','GH'};
set(gca,'xticklabel',name)
legend('xy','xz','yz')
hold off
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plot L1 joints
L1_avgs=[avg_L1_AB_xy,avg_L1_AB_xz, avg_L1_AB_yz; avg_L1_BC_xy,avg_L1_BC_xz, avg_L1_BC_yz;
    avg_L1_CD_xy,avg_L1_CD_xz, avg_L1_CD_yz; avg_L1_DE_xy,avg_L1_DE_xz, avg_L1_DE_yz;
    avg_L1_EF_xy,avg_L1_EF_xz, avg_L1_EF_yz; avg_L1_FG_xy,avg_L1_FG_xz,avg_L1_FG_yz;
    avg_L1_GH_xy, avg_L1_GH_xz, avg_L1_GH_yz];
L1_std=[stdev_L1_AB_xy,stdev_L1_AB_xz, stdev_L1_AB_yz; stdev_L1_BC_xy,stdev_L1_BC_xz, stdev_L1_BC_yz;
    stdev_L1_CD_xy,stdev_L1_CD_xz, stdev_L1_CD_yz; stdev_L1_DE_xy,stdev_L1_DE_xz, stdev_L1_DE_yz;
    stdev_L1_EF_xy,stdev_L1_EF_xz, stdev_L1_EF_yz; stdev_L1_FG_xy,stdev_L1_FG_xz, stdev_L1_FG_yz;
    stdev_L1_GH_xy, stdev_L1_GH_xz, stdev_L1_GH_yz];
L1_errhigh=L1_std;
x=[1,1,1;2,2,2;3,3,3;4,4,4;5,5,5;6,6,6;7,7,7];
figure
bars=bar(x,L1_avgs,'grouped', 'BarWidth',1);
hold on
bars(1).FaceColor=[1 1 0];
bars(2).FaceColor=[0 .75 0];
bars(3).FaceColor=[0 .75 .75];

ngroups = size(L1_avgs, 1);
nbars = size(L1_avgs, 2);
% Calculating the width for each bar group
groupwidth = min(0.8, nbars/(nbars + 1.5));

for i = 1:nbars
    x = (1:ngroups) - groupwidth/2 + (2*i-1) * groupwidth / (2*nbars);
    errorbar(x, L1_avgs(:,i), L1_errhigh(:,i), 'k','LineStyle','none');
end

xlabel('Joints')
ylabel('Absolute Value of Angle')
title('L1 Average Angles Per Joint')
name={'AB','BC','CD','DE','EF','FG','GH'};
set(gca,'xticklabel',name)
legend('xy','xz','yz')
hold off
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plot L2 joints
L2_avgs=[avg_L2_AB_xy,avg_L2_AB_xz, avg_L2_AB_yz; avg_L2_BC_xy,avg_L2_BC_xz, avg_L2_BC_yz;
    avg_L2_CD_xy,avg_L2_CD_xz, avg_L2_CD_yz; avg_L2_DE_xy,avg_L2_DE_xz, avg_L2_DE_yz;
    avg_L2_EF_xy,avg_L2_EF_xz, avg_L2_EF_yz; avg_L2_FG_xy,avg_L2_FG_xz,avg_L2_FG_yz;
    avg_L2_GH_xy, avg_L2_GH_xz, avg_L2_GH_yz];
L2_std=[stdev_L2_AB_xy,stdev_L2_AB_xz, stdev_L2_AB_yz; stdev_L2_BC_xy,stdev_L2_BC_xz, stdev_L2_BC_yz;
    stdev_L2_CD_xy,stdev_L2_CD_xz, stdev_L2_CD_yz; stdev_L2_DE_xy,stdev_L2_DE_xz, stdev_L2_DE_yz;
    stdev_L2_EF_xy,stdev_L2_EF_xz, stdev_L2_EF_yz; stdev_L2_FG_xy,stdev_L2_FG_xz, stdev_L2_FG_yz;
    stdev_L2_GH_xy, stdev_L2_GH_xz, stdev_L2_GH_yz];
L2_errhigh=L2_std;
x=[1,1,1;2,2,2;3,3,3;4,4,4;5,5,5;6,6,6;7,7,7];
figure
bars=bar(x,L2_avgs,'grouped', 'BarWidth',1);
hold on
bars(1).FaceColor=[1 1 0];
bars(2).FaceColor=[0 .75 0];
bars(3).FaceColor=[0 .75 .75];

ngroups = size(L2_avgs, 1);
nbars = size(L2_avgs, 2);
% Calculating the width for each bar group
groupwidth = min(0.8, nbars/(nbars + 1.5));

for i = 1:nbars
    x = (1:ngroups) - groupwidth/2 + (2*i-1) * groupwidth / (2*nbars);
    errorbar(x, L2_avgs(:,i), L2_errhigh(:,i), 'k','LineStyle','none');
end

xlabel('Joints')
ylabel('Absolute Value of Angle')
title('L2 Average Angles Per Joint')
name={'AB','BC','CD','DE','EF','FG','GH'};
set(gca,'xticklabel',name)
legend('xy','xz','yz')
hold off
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plot L3 Joints
L3_avgs=[avg_L3_AB_xy,avg_L3_AB_xz, avg_L3_AB_yz; avg_L3_BC_xy,avg_L3_BC_xz, avg_L3_BC_yz;
    avg_L3_CD_xy,avg_L3_CD_xz, avg_L3_CD_yz; avg_L3_DE_xy,avg_L3_DE_xz, avg_L3_DE_yz;
    avg_L3_EF_xy,avg_L3_EF_xz, avg_L3_EF_yz; avg_L3_FG_xy,avg_L3_FG_xz,avg_L3_FG_yz;
    avg_L3_GH_xy, avg_L3_GH_xz, avg_L3_GH_yz];
L3_std=[stdev_L3_AB_xy,stdev_L3_AB_xz, stdev_L3_AB_yz; stdev_L3_BC_xy,stdev_L3_BC_xz, stdev_L3_BC_yz;
    stdev_L3_CD_xy,stdev_L3_CD_xz, stdev_L3_CD_yz; stdev_L3_DE_xy,stdev_L3_DE_xz, stdev_L3_DE_yz;
    stdev_L3_EF_xy,stdev_L3_EF_xz, stdev_L3_EF_yz; stdev_L3_FG_xy,stdev_L3_FG_xz, stdev_L3_FG_yz;
    stdev_L3_GH_xy, stdev_L3_GH_xz, stdev_L3_GH_yz];
L3_errhigh=L3_std;
x=[1,1,1;2,2,2;3,3,3;4,4,4;5,5,5;6,6,6;7,7,7];
figure
bars=bar(x,L3_avgs,'grouped', 'BarWidth',1);
hold on
bars(1).FaceColor=[1 1 0];
bars(2).FaceColor=[0 .75 0];
bars(3).FaceColor=[0 .75 .75];

ngroups = size(L3_avgs, 1);
nbars = size(L3_avgs, 2);
% Calculating the width for each bar group
groupwidth = min(0.8, nbars/(nbars + 1.5));

for i = 1:nbars
    x = (1:ngroups) - groupwidth/2 + (2*i-1) * groupwidth / (2*nbars);
    errorbar(x, L3_avgs(:,i), L3_errhigh(:,i), 'k','LineStyle','none');
end

xlabel('Joints')
ylabel('Absolute Value of Angle')
title('L3 Average Angles Per Joint')
name={'AB','BC','CD','DE','EF','FG','GH'};
set(gca,'xticklabel',name)
legend('xy','xz','yz')
hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plot L4 joints
L4_avgs=[avg_L4_AB_xy,avg_L4_AB_xz, avg_L4_AB_yz; avg_L4_BC_xy,avg_L4_BC_xz, avg_L4_BC_yz;
    avg_L4_CD_xy,avg_L4_CD_xz, avg_L4_CD_yz; avg_L4_DE_xy,avg_L4_DE_xz, avg_L4_DE_yz;
    avg_L4_EF_xy,avg_L4_EF_xz, avg_L4_EF_yz; avg_L4_FG_xy,avg_L4_FG_xz,avg_L4_FG_yz;
    avg_L4_GH_xy, avg_L4_GH_xz, avg_L4_GH_yz];
L4_std=[stdev_L4_AB_xy,stdev_L4_AB_xz, stdev_L4_AB_yz; stdev_L4_BC_xy,stdev_L4_BC_xz, stdev_L4_BC_yz;
    stdev_L4_CD_xy,stdev_L4_CD_xz, stdev_L4_CD_yz; stdev_L4_DE_xy,stdev_L4_DE_xz, stdev_L4_DE_yz;
    stdev_L4_EF_xy,stdev_L4_EF_xz, stdev_L4_EF_yz; stdev_L4_FG_xy,stdev_L4_FG_xz, stdev_L4_FG_yz;
    stdev_L4_GH_xy, stdev_L4_GH_xz, stdev_L4_GH_yz];
L4_errhigh=L4_std;
x=[1,1,1;2,2,2;3,3,3;4,4,4;5,5,5;6,6,6;7,7,7];
figure
bars=bar(x,L4_avgs,'grouped', 'BarWidth',1);
hold on
bars(1).FaceColor=[1 1 0];
bars(2).FaceColor=[0 .75 0];
bars(3).FaceColor=[0 .75 .75];

ngroups = size(L4_avgs, 1);
nbars = size(L4_avgs, 2);
% Calculating the width for each bar group
groupwidth = min(0.8, nbars/(nbars + 1.5));

for i = 1:nbars
    x = (1:ngroups) - groupwidth/2 + (2*i-1) * groupwidth / (2*nbars);
    errorbar(x, L4_avgs(:,i), L4_errhigh(:,i), 'k','LineStyle','none');
end

xlabel('Joints')
ylabel('Absolute Value of Angle')
title('L4 Average Angles Per Joint')
name={'AB','BC','CD','DE','EF','FG','GH'};
set(gca,'xticklabel',name)
legend('xy','xz','yz')
hold off
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Graph of leg height during movement, Femur-Patella Joint
z_E_heights=zeros(8,frames);
for n=1:1:frames
    for z=5:8:64
        if z==5
            count=1;
        else
        end
        z_E_heights(count,n)=zvector(z,n);
        count=count+1;
    end
end

figure 
x=1:1:frames;
plot(x,z_E_heights(1,:), 'y')
hold on
plot(x,z_E_heights(2,:), 'g')
plot(x,z_E_heights(3,:), 'c')
plot(x,z_E_heights(4,:), 'b')

xlabel('Frames')
ylabel('Height in cm')
title('Height of Femur-Patella Joint Throughout Trial (Right Side)')
legend('R1','R2','R3','R4')
hold off
patella_matrix=[max(z_E_heights(1,:)), max(z_E_heights(2,:)),max(z_E_heights(3,:)),max(z_E_heights(4,:)),max(z_E_heights(5,:)),max(z_E_heights(6,:)),max(z_E_heights(7,:)),max(z_E_heights(8,:))];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure 
x=1:1:frames;
plot(x,z_E_heights(5,:), 'y')
hold on
plot(x,z_E_heights(6,:), 'g')
plot(x,z_E_heights(7,:), 'c')
plot(x,z_E_heights(8,:), 'b')

xlabel('Frames')
ylabel('Height in cm')
title('Height of Femur-Patella Joint Throughout Trial (Left Side)')
legend('L1','L2','L3','L4')
hold off
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Repeat for Tarsus
z_A_heights=zeros(8,frames);
for n=1:1:frames
    for z=1:8:64
        if z==1
            count=1;
        else
        end
        z_A_heights(count,n)=zvector(z,n);
        count=count+1;
    end
end
figure 
x=1:1:frames;
plot(x,z_A_heights(1,:), 'y')
hold on
plot(x,z_A_heights(2,:), 'g')
plot(x,z_A_heights(3,:), 'c')
plot(x,z_A_heights(4,:), 'b')

xlabel('Frames')
ylabel('Height in cm')
title('Height of Tarsus Throughout Trial (Right Side)')
legend('R1','R2','R3','R4')
hold off
tarsus_matrix=[max(z_A_heights(1,:)), max(z_A_heights(2,:)),max(z_A_heights(3,:)),max(z_A_heights(4,:)),max(z_A_heights(5,:)),max(z_A_heights(6,:)),max(z_A_heights(7,:)),max(z_A_heights(8,:))];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure 
x=1:1:frames;
plot(x,z_A_heights(5,:), 'y')
hold on
plot(x,z_A_heights(6,:), 'g')
plot(x,z_A_heights(7,:), 'c')
plot(x,z_A_heights(8,:), 'b')

xlabel('Frames')
ylabel('Height in cm')
title('Height of Tarsus Throughout Trial (Left Side)')
legend('L1','L2','L3','L4')
hold off
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
plot(x,R4_EF_data(1,:),'g')
hold on
plot(x,R4_EF_data(2,:),'c')
plot(x,R4_EF_data(3,:),'b')
xlabel('Frames')
ylabel('Angle')
title('Angle of Femur-Patellar Joint Throughout Trial in XY')
legend('XY','XZ','YZ')
hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
angles_matrix=[avg_R1_AB_xy, avg_R1_BC_xy, avg_R1_CD_xy, avg_R1_DE_xy, avg_R1_EF_xy, avg_R1_FG_xy, avg_R1_GH_xy,0, avg_R2_AB_xy, avg_R2_BC_xy, avg_R2_CD_xy, avg_R2_DE_xy, avg_R2_EF_xy, avg_R2_FG_xy, avg_R2_GH_xy,0,avg_R3_AB_xy, avg_R3_BC_xy, avg_R3_CD_xy, avg_R3_DE_xy, avg_R3_EF_xy, avg_R3_FG_xy, avg_R3_GH_xy,0, avg_R4_AB_xy, avg_R4_BC_xy, avg_R4_CD_xy, avg_R4_DE_xy, avg_R4_EF_xy, avg_R4_FG_xy, avg_R4_GH_xy,0, avg_L1_AB_xy, avg_L1_BC_xy, avg_L1_CD_xy, avg_L1_DE_xy, avg_L1_EF_xy, avg_L1_FG_xy, avg_L1_GH_xy,0, avg_L2_AB_xy, avg_L2_BC_xy, avg_L2_CD_xy, avg_L2_DE_xy, avg_L2_EF_xy, avg_L2_FG_xy, avg_L2_GH_xy,0,avg_L3_AB_xy, avg_L3_BC_xy, avg_L3_CD_xy, avg_L3_DE_xy, avg_L3_EF_xy, avg_L3_FG_xy, avg_L3_GH_xy,0,avg_L4_AB_xy, avg_L4_BC_xy, avg_L4_CD_xy, avg_L4_DE_xy, avg_L4_EF_xy, avg_L4_FG_xy, avg_L4_GH_xy;
    avg_R1_AB_xz, avg_R1_BC_xz, avg_R1_CD_xz, avg_R1_DE_xz, avg_R1_EF_xz, avg_R1_FG_xz, avg_R1_GH_xz, 0,avg_R2_AB_xz, avg_R2_BC_xz, avg_R2_CD_xz, avg_R2_DE_xz, avg_R2_EF_xz, avg_R2_FG_xz, avg_R2_GH_xz,0, avg_R3_AB_xz, avg_R3_BC_xz, avg_R3_CD_xz, avg_R3_DE_xz, avg_R3_EF_xz, avg_R3_FG_xz, avg_R3_GH_xz,0, avg_R4_AB_xz, avg_R4_BC_xz, avg_R4_CD_xz, avg_R4_DE_xz, avg_R4_EF_xz, avg_R4_FG_xz, avg_R4_GH_xz,0, avg_L1_AB_xz, avg_L1_BC_xz, avg_L1_CD_xz, avg_L1_DE_xz, avg_L1_EF_xz, avg_L1_FG_xz, avg_L1_GH_xz,0, avg_L2_AB_xz, avg_L2_BC_xz, avg_L2_CD_xz, avg_L2_DE_xz, avg_L2_EF_xz, avg_L2_FG_xz, avg_L2_GH_xz,0, avg_L3_AB_xz, avg_L3_BC_xz, avg_L3_CD_xz, avg_L3_DE_xz, avg_L3_EF_xz, avg_L3_FG_xz, avg_L3_GH_xz,0,avg_L4_AB_xz, avg_L4_BC_xz, avg_L4_CD_xz, avg_L4_DE_xz, avg_L4_EF_xz, avg_L4_FG_xz, avg_L4_GH_xz;
    avg_R1_AB_yz, avg_R1_BC_yz, avg_R1_CD_yz, avg_R1_DE_yz, avg_R1_EF_yz, avg_R1_FG_yz, avg_R1_GH_yz,0, avg_R2_AB_yz, avg_R2_BC_yz, avg_R2_CD_yz, avg_R2_DE_yz, avg_R2_EF_yz, avg_R2_FG_yz, avg_R2_GH_yz,0, avg_R3_AB_yz, avg_R3_BC_yz, avg_R3_CD_yz, avg_R3_DE_yz, avg_R3_EF_yz, avg_R3_FG_yz, avg_R3_GH_yz,0,avg_R4_AB_yz, avg_R4_BC_yz, avg_R4_CD_yz, avg_R4_DE_yz, avg_R4_EF_yz, avg_R4_FG_yz, avg_R4_GH_yz,0, avg_L1_AB_yz, avg_L1_BC_yz, avg_L1_CD_yz, avg_L1_DE_yz, avg_L1_EF_yz, avg_L1_FG_yz, avg_L1_GH_yz,0, avg_L2_AB_yz, avg_L2_BC_yz, avg_L2_CD_yz, avg_L2_DE_yz, avg_L2_EF_yz, avg_L2_FG_yz, avg_L2_GH_yz,0, avg_L3_AB_yz, avg_L3_BC_yz, avg_L3_CD_yz, avg_L3_DE_yz, avg_L3_EF_yz, avg_L3_FG_yz, avg_L3_GH_yz,0,avg_L4_AB_yz, avg_L4_BC_yz, avg_L4_CD_yz, avg_L4_DE_yz, avg_L4_EF_yz, avg_L4_FG_yz, avg_L4_GH_yz];
min_matrix=[min_R1_AB_xy, min_R1_BC_xy, min_R1_CD_xy, min_R1_DE_xy, min_R1_EF_xy, min_R1_FG_xy, min_R1_GH_xy,0, min_R2_AB_xy, min_R2_BC_xy, min_R2_CD_xy, min_R2_DE_xy, min_R2_EF_xy, min_R2_FG_xy, min_R2_GH_xy,0,min_R3_AB_xy, min_R3_BC_xy, min_R3_CD_xy, min_R3_DE_xy, min_R3_EF_xy, min_R3_FG_xy, min_R3_GH_xy,0, min_R4_AB_xy, min_R4_BC_xy, min_R4_CD_xy, min_R4_DE_xy, min_R4_EF_xy, min_R4_FG_xy, min_R4_GH_xy,0, min_L1_AB_xy, min_L1_BC_xy, min_L1_CD_xy, min_L1_DE_xy, min_L1_EF_xy, min_L1_FG_xy, min_L1_GH_xy,0, min_L2_AB_xy, min_L2_BC_xy, min_L2_CD_xy, min_L2_DE_xy, min_L2_EF_xy, min_L2_FG_xy, min_L2_GH_xy,0,min_L3_AB_xy, min_L3_BC_xy, min_L3_CD_xy, min_L3_DE_xy, min_L3_EF_xy, min_L3_FG_xy, min_L3_GH_xy,0,min_L4_AB_xy, min_L4_BC_xy, min_L4_CD_xy, min_L4_DE_xy, min_L4_EF_xy, min_L4_FG_xy, min_L4_GH_xy;
    min_R1_AB_xz, min_R1_BC_xz, min_R1_CD_xz, min_R1_DE_xz, min_R1_EF_xz, min_R1_FG_xz, min_R1_GH_xz, 0,min_R2_AB_xz, min_R2_BC_xz, min_R2_CD_xz, min_R2_DE_xz, min_R2_EF_xz, min_R2_FG_xz, min_R2_GH_xz,0, min_R3_AB_xz, min_R3_BC_xz, min_R3_CD_xz, min_R3_DE_xz, min_R3_EF_xz, min_R3_FG_xz, min_R3_GH_xz,0, min_R4_AB_xz, min_R4_BC_xz, min_R4_CD_xz, min_R4_DE_xz, min_R4_EF_xz, min_R4_FG_xz, min_R4_GH_xz,0, min_L1_AB_xz, min_L1_BC_xz, min_L1_CD_xz, min_L1_DE_xz, min_L1_EF_xz, min_L1_FG_xz, min_L1_GH_xz,0, min_L2_AB_xz, min_L2_BC_xz, min_L2_CD_xz, min_L2_DE_xz, min_L2_EF_xz, min_L2_FG_xz, min_L2_GH_xz,0, min_L3_AB_xz, min_L3_BC_xz, min_L3_CD_xz, min_L3_DE_xz, min_L3_EF_xz, min_L3_FG_xz, min_L3_GH_xz,0,min_L4_AB_xz, min_L4_BC_xz, min_L4_CD_xz, min_L4_DE_xz, min_L4_EF_xz, min_L4_FG_xz, min_L4_GH_xz;
    min_R1_AB_yz, min_R1_BC_yz, min_R1_CD_yz, min_R1_DE_yz, min_R1_EF_yz, min_R1_FG_yz, min_R1_GH_yz, 0,min_R2_AB_yz, min_R2_BC_yz, min_R2_CD_yz, min_R2_DE_yz, min_R2_EF_yz, min_R2_FG_yz, min_R2_GH_yz,0, min_R3_AB_yz, min_R3_BC_yz, min_R3_CD_yz, min_R3_DE_yz, min_R3_EF_yz, min_R3_FG_yz, min_R3_GH_yz,0, min_R4_AB_yz, min_R4_BC_yz, min_R4_CD_yz, min_R4_DE_yz, min_R4_EF_yz, min_R4_FG_yz, min_R4_GH_yz,0, min_L1_AB_yz, min_L1_BC_yz, min_L1_CD_yz, min_L1_DE_yz, min_L1_EF_yz, min_L1_FG_yz, min_L1_GH_yz,0, min_L2_AB_yz, min_L2_BC_yz, min_L2_CD_yz, min_L2_DE_yz, min_L2_EF_yz, min_L2_FG_yz, min_L2_GH_yz,0, min_L3_AB_yz, min_L3_BC_yz, min_L3_CD_yz, min_L3_DE_yz, min_L3_EF_yz, min_L3_FG_yz, min_L3_GH_yz,0,min_L4_AB_yz, min_L4_BC_yz, min_L4_CD_yz, min_L4_DE_yz, min_L4_EF_yz, min_L4_FG_yz, min_L4_GH_yz];
max_matrix=[max_R1_AB_xy, max_R1_BC_xy, max_R1_CD_xy, max_R1_DE_xy, max_R1_EF_xy, max_R1_FG_xy, max_R1_GH_xy,0, max_R2_AB_xy, max_R2_BC_xy, max_R2_CD_xy, max_R2_DE_xy, max_R2_EF_xy, max_R2_FG_xy, max_R2_GH_xy,0,max_R3_AB_xy, max_R3_BC_xy, max_R3_CD_xy, max_R3_DE_xy, max_R3_EF_xy, max_R3_FG_xy, max_R3_GH_xy,0, max_R4_AB_xy, max_R4_BC_xy, max_R4_CD_xy, max_R4_DE_xy, max_R4_EF_xy, max_R4_FG_xy, max_R4_GH_xy,0, max_L1_AB_xy, max_L1_BC_xy, max_L1_CD_xy, max_L1_DE_xy, max_L1_EF_xy, max_L1_FG_xy, max_L1_GH_xy,0, max_L2_AB_xy, max_L2_BC_xy, max_L2_CD_xy, max_L2_DE_xy, max_L2_EF_xy, max_L2_FG_xy, max_L2_GH_xy,0,max_L3_AB_xy, max_L3_BC_xy, max_L3_CD_xy, max_L3_DE_xy, max_L3_EF_xy, max_L3_FG_xy, max_L3_GH_xy,0,max_L4_AB_xy, max_L4_BC_xy, max_L4_CD_xy, max_L4_DE_xy, max_L4_EF_xy, max_L4_FG_xy, max_L4_GH_xy;
    max_R1_AB_xz, max_R1_BC_xz, max_R1_CD_xz, max_R1_DE_xz, max_R1_EF_xz, max_R1_FG_xz, max_R1_GH_xz, 0,max_R2_AB_xz, max_R2_BC_xz, max_R2_CD_xz, max_R2_DE_xz, max_R2_EF_xz, max_R2_FG_xz, max_R2_GH_xz,0, max_R3_AB_xz, max_R3_BC_xz, max_R3_CD_xz, max_R3_DE_xz, max_R3_EF_xz, max_R3_FG_xz, max_R3_GH_xz,0, max_R4_AB_xz, max_R4_BC_xz, max_R4_CD_xz, max_R4_DE_xz, max_R4_EF_xz, max_R4_FG_xz, max_R4_GH_xz,0, max_L1_AB_xz, max_L1_BC_xz, max_L1_CD_xz, max_L1_DE_xz, max_L1_EF_xz, max_L1_FG_xz, max_L1_GH_xz,0, max_L2_AB_xz, max_L2_BC_xz, max_L2_CD_xz, max_L2_DE_xz, max_L2_EF_xz, max_L2_FG_xz, max_L2_GH_xz,0, max_L3_AB_xz, max_L3_BC_xz, max_L3_CD_xz, max_L3_DE_xz, max_L3_EF_xz, max_L3_FG_xz, max_L3_GH_xz,0,max_L4_AB_xz, max_L4_BC_xz, max_L4_CD_xz, max_L4_DE_xz, max_L4_EF_xz, max_L4_FG_xz, max_L4_GH_xz;
    max_R1_AB_yz, max_R1_BC_yz, max_R1_CD_yz, max_R1_DE_yz, max_R1_EF_yz, max_R1_FG_yz, max_R1_GH_yz,0, max_R2_AB_yz, max_R2_BC_yz, max_R2_CD_yz, max_R2_DE_yz, max_R2_EF_yz, max_R2_FG_yz, max_R2_GH_yz,0, max_R3_AB_yz, max_R3_BC_yz, max_R3_CD_yz, max_R3_DE_yz, max_R3_EF_yz, max_R3_FG_yz, max_R3_GH_yz,0, max_R4_AB_yz, max_R4_BC_yz, max_R4_CD_yz, max_R4_DE_yz, max_R4_EF_yz, max_R4_FG_yz, max_R4_GH_yz,0, max_L1_AB_yz, max_L1_BC_yz, max_L1_CD_yz, max_L1_DE_yz, max_L1_EF_yz, max_L1_FG_yz, max_L1_GH_yz,0, max_L2_AB_yz, max_L2_BC_yz, max_L2_CD_yz, max_L2_DE_yz, max_L2_EF_yz, max_L2_FG_yz, max_L2_GH_yz,0, max_L3_AB_yz, max_L3_BC_yz, max_L3_CD_yz, max_L3_DE_yz, max_L3_EF_yz, max_L3_FG_yz, max_L3_GH_yz,0,max_L4_AB_yz, max_L4_BC_yz, max_L4_CD_yz, max_L4_DE_yz, max_L4_EF_yz, max_L4_FG_yz, max_L4_GH_yz];
