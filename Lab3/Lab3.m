% Lab 3 Main File
clear
clc

addpath('C:\GitHub\Robo2Lab\UsefulFNs')


t = rotxDeg(0); % defines arbitrary t value
load('path.mat') % Loads the preselected points into the matlab workspace
load('check.mat') % loads the prelected movement type into the matlabworkspace

m = length(path); % number or row, equivalent to the number of points
joints = zeros(m,4); % initializes an empty matrix where the joint variables will be stored
    
% Calls the scara inverse kinematic function, passing the ith point to it,
% and stores the joint variables in the tempVal vector variable. Then is
% stores each all values in the correct collumn of the ith row.

t0 = rotzDeg(0);
t180 = rotzDeg(180);
for i = 1:m
    if check(i) == 3
        tempVal = scaraIK(path(i,:),t180).';
    else
        tempVal = scaraIK(path(i,:),t0).';
    end
    joints(i,1) = tempVal(1);
    joints(i,2) = tempVal(2);
    joints(i,3) = tempVal(3);
    joints(i,4) = tempVal(4);
end

f = fopen('Lab3Iordanov.pac','w'); % opens a .pac file for writing
fprintf(f,'''!TITLE "<My Program>"\n'); % prints the header info
fprintf(f,'PROGRAM Lab2Iordanov\n');% prints the required header info
fprintf(f,'DEFINIT ITT\n');
fprintf(f,'TAKEARM\n'); % prints the command to take control of the arm

% for loop with if else statements that check the ith value of the
% checkT.mat file. This allows the code to then write the coordinate as the
% correctt type of movement (approach, depart, or move). Then is prints the
% proper command line.
fprintf(f,'FOR ITT 0 to
fprintf(f,'MOVE L, @E (%f,%f,%f,%f), S = 50\n',joints(j,1),joints(j,2),joints(j,3),joints(j,4));
fprintf(f,'BUZZER 1000\n'); % Buzzer before Data collection
fprintf(f,'SET IO[64]\n'); % prints the command to release control of the arm
fprintf(f,'DELAY 200\n'); % prints the command to release control of the arm
fprintf(f,'RESET IO[64]\n'); % prints the command to release control of the arm
fprintf(f,'BUZZER 100\n'); % prints the command to release control of the arm


fprintf(f,'GIVEARM\n'); % prints the command to release control of the arm
fprintf(f,'END'); % prints the command that ends the PAC program
fclose(f); % closes the .PAC file