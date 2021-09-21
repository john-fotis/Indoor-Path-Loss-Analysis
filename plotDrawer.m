% Authors: Fotis Ioannis, Giannopoulou Aikaterini

clc;
close all;

% ============== Standard parameters ==============
f = [800 1400 2000];
d = [3 6 9];
numW1 = [0 4];
numW2 = [0 2];
numFl = [0 2];

% Vectors
ff = 800:50:2000;
dd = [1:0.4:5 5.5:0.5:14 14.6:0.6:20];
thinWalls = 1:20;
thickWalls = 1:5;
floors = 1:20;

% Results
fLoss = zeros(3, length(ff));
dLoss = zeros(3, length(dd));
wallLoss1 = zeros(3, length(thinWalls));
wallLoss2 = zeros(3, length(thickWalls));
floorLoss = zeros(3, length(floors));
totalFLoss = zeros(9, length(ff));
totalDLoss = zeros(9, length(dd));

% =============== Custom parameters ===============
%f = input('Enter Signal Frequency [800-2000MHz]: ');
%numW1 = input('Enter number of thin walls: ');
%numW2 = input('Enter number of thick walls: ');
%numFl = input('Enter number of floors: ');

% Path Loss vs Frequency
for i = 1:length(ff)
    
    fLoss(1,i)= mwm(ff(i), d(1), 0, 0, 0);
    fLoss(2,i)= mwm(ff(i), d(2), 0, 0, 0);
    fLoss(3,i)= mwm(ff(i), d(3), 0, 0, 0);

end

figure;
plot(ff,fLoss(1,:),'-g',ff,fLoss(2,:),'-m',ff,fLoss(3,:),'-r', 'LineWidth', 3);
title('Path Loss vs Frequency');
legend('d=3m', 'd=6m', 'd=9m', 'Location', 'southeast');
ylabel('Path Loss (dB)');
xlabel('Frequency (MHz)');
grid on;

% Path Loss vs Distance
for i = 1:length(dd)
    
    dLoss(1,i)= mwm(f(1), dd(i), 0, 0, 0);
    dLoss(2,i)= mwm(f(2), dd(i), 0, 0, 0);
    dLoss(3,i)= mwm(f(3), dd(i), 0, 0, 0);

end

figure;
plot(dd,dLoss(1,:),'-g',dd,dLoss(2,:),'-m',dd,dLoss(3,:),'-r', 'LineWidth', 3);
title('Path Loss vs Distance');
legend('f=800MHz', 'f=1400MHz', 'f=2000MHz', 'Location', 'southeast');
ylabel('Path Loss (dB)');
xlabel('Distance (m)');
grid on;

% Path loss vs Number of Wooden Walls
for i = 1:length(thinWalls)
    
    wallLoss1(1,i)= mwm(f(1), dd(2), thinWalls(i), 0, 0);
    wallLoss1(2,i)= mwm(f(2), dd(2), thinWalls(i), 0, 0);
    wallLoss1(3,i)= mwm(f(3), dd(2), thinWalls(i), 0, 0);

end

figure;
plot(thinWalls,wallLoss1(1,:),'-g',thinWalls,wallLoss1(2,:),'-m',thinWalls,wallLoss1(3,:),'-r', 'LineWidth', 3);
title('Path Loss vs Number of wooden walls');
legend('f=800MHz,   d=6m', 'f=1400MHz, d=6m', 'f=2000MHz, d=6m', 'Location', 'southeast');
ylabel('Path Loss (dB)');
xlabel('Number of walls');
grid on;

% Path loss vs Number of Concrete Walls
for i = 1:length(thickWalls)
    
    wallLoss2(1,i)= mwm(f(1), dd(2), 0, thickWalls(i), 0);
    wallLoss2(2,i)= mwm(f(2), dd(2), 0, thickWalls(i), 0);
    wallLoss2(3,i)= mwm(f(3), dd(2), 0, thickWalls(i), 0);

end

figure;
plot(thickWalls,wallLoss2(1,:),'-g',thickWalls,wallLoss2(2,:),'-m',thickWalls,wallLoss2(3,:),'-r', 'LineWidth', 3);
title('Path Loss vs Number of concrete walls');
legend('f=800MHz,   d=6m', 'f=1400MHz, d=6m', 'f=2000MHz, d=6m', 'Location', 'southeast');
ylabel('Path Loss (dB)');
xlabel('Number of walls');
grid on;

% Path Loss vs Number of Floors
for i = 1:length(floors)
    
    floorLoss(1,i)= mwm(f(1), dd(2), 0, 0, floors(i));
    floorLoss(2,i)= mwm(f(2), dd(2), 0, 0, floors(i));
    floorLoss(3,i)= mwm(f(3), dd(2), 0, 0, floors(i));

end

figure;
plot(floors,floorLoss(1,:),'-g',floors,floorLoss(2,:),'-m',floors,floorLoss(3,:),'-r', 'LineWidth', 3);
title('Path Loss vs Number of floors');
legend('f=800MHz,   d=6m', 'f=1400MHz, d=6m', 'f=2000MHz, d=6m', 'Location', 'southeast');
ylabel('Path Loss (dB)');
xlabel('Number of floors');
grid on;

% Frequency tests @Building with thin walls
for i = 1:length(dd)
    
    % Base frequency
    totalDLoss(1,i)= mwm(f(1), dd(i), numW1(1), numW2(1), numFl(1));
    totalDLoss(2,i)= mwm(f(1), dd(i), numW1(2), numW2(1), numFl(1));
    totalDLoss(3,i)= mwm(f(1), dd(i), numW1(1), numW2(1), numFl(2));
    
    % Increase frequency by 75%
    totalDLoss(4,i)= mwm(f(2), dd(i), numW1(1), numW2(1), numFl(1));
    totalDLoss(5,i)= mwm(f(2), dd(i), numW1(2), numW2(1), numFl(1));
    totalDLoss(6,i)= mwm(f(2), dd(i), numW1(1), numW2(1), numFl(2));
    
    % Increase frecuency by 150%
    totalDLoss(7,i)= mwm(f(3), dd(i), numW1(1), numW2(1), numFl(1));
    totalDLoss(8,i)= mwm(f(3), dd(i), numW1(2), numW2(1), numFl(1));
    totalDLoss(9,i)= mwm(f(3), dd(i), numW1(1), numW2(1), numFl(2));

end

figure;
plot(dd,totalDLoss(1,:),'-go',dd,totalDLoss(2,:),'-g*',dd,totalDLoss(3,:),'-gd',dd,totalDLoss(4,:),'-mo',dd,totalDLoss(5,:),'-m*',dd,totalDLoss(6,:),'-md',dd,totalDLoss(7,:),'-ro',dd,totalDLoss(8,:),'-r*',dd,totalDLoss(9,:),'-rd', 'LineWidth', 1.5);
title('Path Loss vs Distance, Building with wooden walls');
legend('f=800MHz, Line of Sight', 'f=800MHz, Multiple Walls', 'f=800MHz, Multiple floors', 'f=1400MHz, Line of Sight', 'f=1400MHz, Multiple Walls', 'f=1400MHz, Multiple Floors','f=2000MHz, Line of Sight', 'f=2000MHz, Multiple Walls', 'f=2000MHz, Multiple Floors', 'Location', 'southeastoutside');
ylabel('Path Loss (dB)');
xlabel('Distance (m)');
grid on;

% Frequency tests @Building with thick walls
for i = 1:length(dd)
    
    % Base frequency
    totalDLoss(1,i)= mwm(f(1), dd(i), numW1(1), numW2(1), numFl(1));
    totalDLoss(2,i)= mwm(f(1), dd(i), numW1(1), numW2(2), numFl(1));
    totalDLoss(3,i)= mwm(f(1), dd(i), numW1(1), numW2(1), numFl(2));
    
    % Increase frequency by 75%
    totalDLoss(4,i)= mwm(f(2), dd(i), numW1(1), numW2(1), numFl(1));
    totalDLoss(5,i)= mwm(f(2), dd(i), numW1(1), numW2(2), numFl(1));
    totalDLoss(6,i)= mwm(f(2), dd(i), numW1(1), numW2(1), numFl(2));
    
    % Increase frequency by 150%
    totalDLoss(7,i)= mwm(f(3), dd(i), numW1(1), numW2(1), numFl(1));
    totalDLoss(8,i)= mwm(f(3), dd(i), numW1(1), numW2(2), numFl(1));
    totalDLoss(9,i)= mwm(f(3), dd(i), numW1(1), numW2(1), numFl(2));

end

figure;
plot(dd,totalDLoss(1,:),'-go',dd,totalDLoss(2,:),'-g*',dd,totalDLoss(3,:),'-gd',dd,totalDLoss(4,:),'-mo',dd,totalDLoss(5,:),'-m*',dd,totalDLoss(6,:),'-md',dd,totalDLoss(7,:),'-ro',dd,totalDLoss(8,:),'-r*',dd,totalDLoss(9,:),'-rd', 'LineWidth', 1.5);
title('Path Loss vs Distance, Building with concrete walls');
legend('f=800MHz, Line of Sight', 'f=800MHz, Multiple Walls', 'f=800MHz, Multiple Floors', 'f=1400MHz, Line of Sight', 'f=1400MHz, Multiple Walls', 'f=1400MHz, Multiple Floors','f=2000MHz, Line of Sight', 'f=2000MHz, Multiple Walls', 'f=2000MHz, Multiple Floors', 'Location', 'southeastoutside');
ylabel('Path Loss (dB)');
xlabel('Distance (m)');
grid on;

% Distance tests @Building with thin walls
for i = 1:length(ff)
    
    % Base distance between transmitter-receiver
    totalFLoss(1,i)= mwm(ff(i), d(1), numW1(1), numW2(1), numFl(1));
    totalFLoss(2,i)= mwm(ff(i), d(1), numW1(2), numW2(1), numFl(1));
    totalFLoss(3,i)= mwm(ff(i), d(1), numW1(1), numW2(1), numFl(2));
    
    % Increase distance by 100%
    totalFLoss(4,i)= mwm(ff(i), d(2), numW1(1), numW2(1), numFl(1));
    totalFLoss(5,i)= mwm(ff(i), d(2), numW1(2), numW2(1), numFl(1));
    totalFLoss(6,i)= mwm(ff(i), d(2), numW1(1), numW2(1), numFl(2));
    
    % Increase distance by 200%
    totalFLoss(7,i)= mwm(ff(i), d(3), numW1(1), numW2(1), numFl(1));
    totalFLoss(8,i)= mwm(ff(i), d(3), numW1(2), numW2(1), numFl(1));
    totalFLoss(9,i)= mwm(ff(i), d(3), numW1(1), numW2(1), numFl(2));

end

figure;
plot(ff,totalFLoss(1,:),'-go',ff,totalFLoss(2,:),'-g*',ff,totalFLoss(3,:),'-gd',ff,totalFLoss(4,:),'-mo',ff,totalFLoss(5,:),'-m*',ff,totalFLoss(6,:),'-md',ff,totalFLoss(7,:),'-ro',ff,totalFLoss(8,:),'-r*',ff,totalFLoss(9,:),'-rd', 'LineWidth', 1.5);
title('Path Loss vs Frequency, Building with wooden walls');
legend('d=3m, Line of Sight', 'd=3m, Multiple Walls', 'd=3m, Multiple Floors', 'd=6m, Line of Sight', 'd=6m, Multiple Walls', 'd=6m, Multiple Floors','d=9m, Line of Sight', 'd=9m, Multiple Walls', 'd=9m, Multiple Floors', 'Location', 'southeastoutside');
ylabel('Path Loss (dB)');
xlabel('Frequency (MHz)');
grid on;

% Distance tests @Building with thick walls
for i = 1:length(ff)
    
    % Base distance between transmitter-receiver
    totalFLoss(1,i)= mwm(ff(i), d(1), numW1(1), numW2(1), numFl(1));
    totalFLoss(2,i)= mwm(ff(i), d(1), numW1(1), numW2(2), numFl(1));
    totalFLoss(3,i)= mwm(ff(i), d(1), numW1(1), numW2(1), numFl(2));
    
    % Increase distance by 100%
    totalFLoss(4,i)= mwm(ff(i), d(2), numW1(1), numW2(1), numFl(1));
    totalFLoss(5,i)= mwm(ff(i), d(2), numW1(1), numW2(2), numFl(1));
    totalFLoss(6,i)= mwm(ff(i), d(2), numW1(1), numW2(1), numFl(2));
    
    % Increase distance by 200%
    totalFLoss(7,i)= mwm(ff(i), d(3), numW1(1), numW2(1), numFl(1));
    totalFLoss(8,i)= mwm(ff(i), d(3), numW1(1), numW2(2), numFl(1));
    totalFLoss(9,i)= mwm(ff(i), d(3), numW1(1), numW2(1), numFl(2));

end

figure;
plot(ff,totalFLoss(1,:),'-go',ff,totalFLoss(2,:),'-g*',ff,totalFLoss(3,:),'-gd',ff,totalFLoss(4,:),'-mo',ff,totalFLoss(5,:),'-m*',ff,totalFLoss(6,:),'-md',ff,totalFLoss(7,:),'-ro',ff,totalFLoss(8,:),'-r*',ff,totalFLoss(9,:),'-rd', 'LineWidth', 1.5);
title('Path Loss vs Frequency, Building with concrete walls');
legend('d=3m, Line of Sight', 'd=3m, Multiple Walls', 'd=3m, Multiple Floors', 'd=6m, Line of Sight', 'd=6m, Multiple Walls', 'd=6m, Multiple Floors','d=9m, Line of Sight', 'd=9m, Multiple Walls', 'd=9m, Multiple Floors', 'Location', 'southeastoutside');
ylabel('Path Loss (dB)');
xlabel('Frequency (MHz)');
grid on;