%%Edit Chase's data
%Mar14
b=100;
n=200;
data=[table2array(Mar231070Unformatted(1:b,2:25)); table2array(Mar231070UnformattedS1(1:b,2:25)); table2array(Mar231070UnformattedS2(1:b,2:25));table2array(Mar231070UnformattedS3(1:b,2:25));table2array(Mar231070UnformattedS4(1:2:n,2:25));table2array(Mar231070UnformattedS5(1:2:n,2:25));table2array(Mar231070UnformattedS6(1:2:n,2:25)); table2array(Mar231070UnformattedS7(1:2:n,2:25))];
[r,c] = size(data); % calc row / column size 
frame_count = r/8;  % # of frames 
col_len_new = frame_count * 3;  % calculate # of new rows
row_len_new = 64; % calculate # of new columns 
new_data = zeros(row_len_new, col_len_new); % create new matrix
n = 0;  % used to iterate through the A-H different blocks for a "frame_count" rows of data 
new_col = 1; % used to keep the same row 
while n < 8 
    for new_row = 8*n+1:8*n+8
        for frames = (n*frame_count + 1):((n+1)*frame_count)
            new_row_mod = mod(new_row, 8); 
            if new_row_mod == 0
                new_row_mod = 8;
            end

            new_data(new_row, 3 * new_col - 2) = data(frames, 3 * new_row_mod - 2);
            new_data(new_row, 3 * new_col - 1) = data(frames, 3 * new_row_mod - 1);
            new_data(new_row, 3 * new_col) = data(frames, 3 * new_row_mod);
            new_col=new_col + 1;  
        end
        new_col = 1; 
    end
    n =  n + 1; 
end

% new_data=new_data*10;
 