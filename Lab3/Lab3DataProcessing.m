clear
clc

data = load('AI.dat'); % Loads in the data from the LiDAR

length = length(data); % Determines column number of the data
height = height(data); % Determines row number of the data

pointMat = zeros(3,length*16); % Initializes an empty matrix to later be filled with the processed data
[bbre1,bTe1] = scaraFK([-154.471221,38.942441,180.000000,115.528779]); % Determines BBrE and BTE from X,Y position 1
[bbre2,bTe2] = scaraFK([-123.639568,120.409239,200.000000,183.230329]); % Determines BBrE and BTE from X,Y position 2

i = 1; % Interation count used in later for assigning the correct column
    for iter = 1:2:32
        % IF statement that checks what row is currently being worked on
        % and assigns the height to the correct value
        if (iter == 1) || (iter == 3)|| (iter == 17)|| (iter == 19)
            height = 0;
        elseif (iter == 5) || (iter == 7)|| (iter == 21)|| (iter == 23)
            height = 20;
        elseif (iter == 9) || (iter == 11)|| (iter == 25)|| (iter == 27)
            height = 40;
        elseif (iter == 13) || (iter == 15)|| (iter == 29)|| (iter == 31)
            height = 60;
        end    
        % FOR Loop processes the data, bringing it from the LiDAR Frame to
        % the SCARA Base Frame
        for ii = 1:length
            temp = [data(iter,ii)*cosd(data(iter+1,ii)), data(iter,ii)*sind(data(iter+1,ii)), height].';
            if (iter <= 16)
                pointMat(:,i) = bTe1*(rotzDeg(45)*temp+[0;0;-50]) + bbre1.';
            else
                pointMat(:,i) = bTe2*(rotzDeg(45)*temp+[0;0;-50]) + bbre2.';
            end
            i = i+1;
        end

    end
% Plots the data in 3D
plot3(pointMat(1,:),pointMat(2,:),pointMat(3,:),'.')