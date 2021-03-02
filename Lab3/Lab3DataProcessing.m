clear
clc

data = load('AI.dat');

length = length(data);
height = height(data);

pointMat = zeros(3,length*32);
[bbre1,bTe] = scaraFK()

for i = 1:(length*32)
    for iter = 1:2:32
        if (iter == 1) || (iter == 3)|| (iter == 17)|| (iter == 19)
            height = 0;
        elseif (iter == 5) || (iter == 7)|| (iter == 21)|| (iter == 23)
            height = 20;
        elseif (iter == 9) || (iter == 11)|| (iter == 25)|| (iter == 27)
            height = 40;
        elseif (iter == 13) || (iter == 15)|| (iter == 29)|| (iter == 32)
            height = 60;
        end    
        for ii = 1:length
            pointMat(:,i) = [data(iter,ii)*cosd(data(iter+1,ii)), data(iter,ii)*sind(data(iter+1,ii)), height].';
        end
    end
    
end

% for i =1:2:32
%     i
% end
%     for iter = 1:2:32
%         
%     for ii = 1:2:32
%             if (ii == 1) || (ii == 3)
%                 height = 0
%             elseif (ii == 5) || (ii == 7)
%                 height = 2
%             elseif (ii == 9) || (ii == 11)
%                 height = 4
%             end        
%     end

