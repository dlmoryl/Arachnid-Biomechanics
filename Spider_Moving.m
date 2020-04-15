%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Dana Moryl Thesis Code-Moving Gif
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Legs are labelled front to back, left side=L, right side = R
%Body- creates a prosoma/abdomen
[xb1,yb1,zb1] = ellipsoid(-3,0,0,2,1,1,20);
[xb2,yb2,zb2] = ellipsoid(-.1,0,0,1.2,1,1,20);
f=figure;                                                     %begin figure
filename='Spider_Moving.gif';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Leg Set Up
data=readtable('Mar5_15800.xlsx');                       %input Excel data
frames=(size(data,2)-1)/3;
New_data=table2array(data(1:64,2:frames*3));
                                   %separate data into frames/coord systems
xvector=zeros(64,frames);
yvector=zeros(64,frames);
zvector=zeros(64,frames);
count=1;
for n=1:3:(frames*3-3)
    xvector(1:64,count)=New_data(1:64,n);
    yvector(1:64,count)=New_data(1:64,n+1);
    zvector(1:64,count)=New_data(1:64,n+2);
    count=count+1;
end
for n=1:1:(frames)
                                %adjust the legs to (0,0,0) then reposition
    R1x_adj=xvector(1:8,n)-xvector(1,n)+.6;
    R1y_adj=yvector(1:8,n)-yvector(1,n)-.8;
    R1z_adj=zvector(1:8,n)-zvector(1,n)-.16;

    R2x_adj=xvector(9:16,n)-xvector(9,n)-.1;
    R2y_adj=yvector(9:16,n)-yvector(9,n)-1;
    R2z_adj=zvector(9:16,n)-zvector(9,n)-.16;

    R3x_adj=xvector(17:24,n)-xvector(17,n)-.5;
    R3y_adj=yvector(17:24,n)-yvector(17,n)-1;
    R3z_adj=zvector(17:24,n)-zvector(17,n)-.16;

    R4x_adj=xvector(25:32,n)-xvector(25,n)-.8;
    R4y_adj=yvector(25:32,n)-yvector(25,n)-.8;
    R4z_adj=zvector(25:32,n)-zvector(25,n)-.16;

    L1x_adj=xvector(33:40,n)-xvector(33,n)+.6;
    L1y_adj=yvector(33:40,n)-yvector(33,n)+.8;
    L1z_adj=zvector(33:40,n)-zvector(33,n)-.16;

    L2x_adj=xvector(41:48,n)-xvector(41,n)-.1;
    L2y_adj=yvector(41:48,n)-yvector(41,n)+1;
    L2z_adj=zvector(41:48,n)-zvector(41,n)-.16;

    L3x_adj=xvector(49:56,n)-xvector(49,n)-.5;
    L3y_adj=yvector(49:56,n)-yvector(49,n)+1;
    L3z_adj=zvector(49:56,n)-zvector(49,n)-.16;

    L4x_adj=xvector(57:64,n)-xvector(57,n)-.8;
    L4y_adj=yvector(57:64,n)-yvector(57,n)+.8;
    L4z_adj=zvector(57:64,n)-zvector(57,n)-.16;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    scatter3(R1x_adj,R1y_adj,R1z_adj, 'filled', 'r')       %plot the joints
    grid on
    axis equal                    %axes set equal/tight for gif development
    hold on
    scatter3(R2x_adj,R2y_adj,R2z_adj, 'filled', 'y')
    scatter3(R3x_adj,R3y_adj,R3z_adj, 'filled', 'g')
    scatter3(R4x_adj,R4y_adj,R4z_adj, 'filled', 'b')

    scatter3(L1x_adj,L1y_adj,L1z_adj, 'filled', 'r')
    scatter3(L2x_adj,L2y_adj,L2z_adj, 'filled', 'y')
    scatter3(L3x_adj,L3y_adj,L3z_adj, 'filled', 'g')
    scatter3(L4x_adj,L4y_adj,L4z_adj, 'filled', 'b')

    line(R1x_adj,R1y_adj,R1z_adj, 'linewidth',3)             %plot the legs
    line(R2x_adj,R2y_adj,R2z_adj, 'linewidth',3)
    line(R3x_adj,R3y_adj,R3z_adj, 'linewidth',3)
    line(R4x_adj,R4y_adj,R4z_adj, 'linewidth',3)

    line(L1x_adj,L1y_adj,L1z_adj, 'linewidth',3)
    line(L2x_adj,L2y_adj,L2z_adj, 'linewidth',3)
    line(L3x_adj,L3y_adj,L3z_adj, 'linewidth',3)
    line(L4x_adj,L4y_adj,L4z_adj, 'linewidth',3)
   
    surf(xb1,yb1,zb1)                                            %plot body
    surf(xb2,yb2,zb2)    
    hold off                     
    drawnow 
     
    frame = getframe(f);                                %turn plot to image
    im = frame2im(frame); 
    [imind,cm] = rgb2ind(im,256); 
   
    if n == 1                                                 %write as gif
        imwrite(imind,cm,filename,'gif', 'Loopcount',inf); 
    else 
        imwrite(imind,cm,filename,'gif','DelayTime',1,'WriteMode','append'); 
    end 
end
