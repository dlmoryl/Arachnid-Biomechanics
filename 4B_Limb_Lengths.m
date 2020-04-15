%calculate out the limb lengths
data=readtable('Mar14_15300.xlsx'); %input Excel data
frames=(size(data,2)-1)/3;
data=table2array(data(1:64,2:frames*3+1));
                         %separate data into frames, and coordinate systems
xvector=zeros(65,frames);
yvector=zeros(65,frames);
zvector=zeros(65,frames);
count=1;
for n=1:3:frames*3-2                %Separate data into x, y, and z vectors
    xvector(1:64,count)=data(1:64,n);
    yvector(1:64,count)=data(1:64,n+1);
    zvector(1:64,count)=data(1:64,n+2);   
    
    count=count+1;
end
distance=zeros(64,frames);
for n=1:1:frames
    for q=1:1:63
        distance(q,n)=sqrt((xvector(q,n)-xvector(q+1,n))^2+(yvector(q,n)-yvector(q+1,n))^2+(zvector(q,n)-zvector(q+1,n))^2);
    end
end
averages=zeros(64,1);
stdevs=zeros(64,1);
for n=1:1:64
    averages(n)=mean(distance(n,1:frames));
    stdevs(n)=std(distance(n,1:frames));
end
