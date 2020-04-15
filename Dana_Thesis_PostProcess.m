
data = readtable('SS1_22g.txt');
data = table2array(data);
data = string(data); 
 
index = 1;                            %index for going through the raw data 

new_Str = rmmissing(data);                                  %removes blanks

n = 1; 
timestamp = ""; 
len_newStr = length(new_Str); 
len_test = round(len_newStr/8); 
parsedData_str = string(zeros(len_test, 9));  
Fs = 1000;                            %Data sampling rate, change as needed

for index1=1:len_newStr-9                %stores packets with all 8 sensors
    if new_Str(index1) == "SS" || new_Str(index1) =="SSS" 
       if new_Str(index1 + 9) == "TT" || new_Str(index1 + 9) == "TTT" 
            for index = 1:8
                parsedData_str(n, index) = new_Str(index1+index);
            end   
            n=n+1; 
       end
    end 
end 
parsedData_int = zeros(len_test,9);


for n = 1:len_test                                   %calculates time stamp
    timestamp = double(char(parsedData_str(n,1)));
    if length(timestamp) == 2
    timestamp1 = (timestamp(1) - 65) * 26; 
    timestamp2 = (timestamp(2) - 65); 
    timestamp = timestamp1 + timestamp2; 
    parsedData_int(n,1) = timestamp; 
    end 
    for index1 = 1:8                                     %string to integer
        parsedData_int(n,index1) = hex2dec(parsedData_str(n,index1)); 
    end 
end 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Plot the individual sensors- (NOT CALIBRATED)
figure(1)
plot(1:length(parsedData_int), parsedData_int(:,1));
figure(2)
plot(1:length(parsedData_int), parsedData_int(:,2));
figure(3)
plot(1:length(parsedData_int), parsedData_int(:,3));
figure(4)
plot(1:length(parsedData_int), parsedData_int(:,4));
figure(5)
plot(1:length(parsedData_int), parsedData_int(:,5));
figure(6)
plot(1:length(parsedData_int), parsedData_int(:,6));
figure(7)
plot(1:length(parsedData_int), parsedData_int(:,7));
figure(8)
plot(1:length(parsedData_int), parsedData_int(:,8));
legend('Sensor1','Sensor2','Sensor3','Sensor4','Sensor5','Sensor6','Sensor7','Sensor8')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Average force during step, calculated manually
 %avg=mean(parsedData_int(8.379e*10^4:8.57e*10^4,4);

