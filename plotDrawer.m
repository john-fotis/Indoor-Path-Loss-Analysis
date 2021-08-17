clc;
close all;

% ============== Standard parameters ==============
f = [800 1400 2000];
ff = 800:20:2000;
d = [5 10 15];
dd = [1:0.2:6 6.4:0.4:14 14.5:0.5:20];
numW1 = [0 4];
numW2 = [0 4];
numFl = [1 2];
lossBuilding1 = zeros(9, length(dd));
lossBuilding2 = zeros(9, length(dd2));

% =============== Custom parameters ===============
%f = input('Enter Signal Frequency [800-2000MHz]: ');
%numW1 = input('Enter number of thin walls: ');
%numW2 = input('Enter number of thick walls: ');
%numFl = input('Enter number of floors: ');

% Building with thin walls
for i = 1:length(dd)
    
    lossBuilding1(1,i)= mwm(f(1), dd(i), numW1(1), numW2(1), numFl(1));
    lossBuilding1(2,i)= mwm(f(1), dd(i), numW1(2), numW2(1), numFl(1));
    lossBuilding1(3,i)= mwm(f(1), dd(i), numW1(1), numW2(1), numFl(2));
    
    lossBuilding1(4,i)= mwm(f(2), dd(i), numW1(1), numW2(1), numFl(1));
    lossBuilding1(5,i)= mwm(f(2), dd(i), numW1(2), numW2(1), numFl(1));
    lossBuilding1(6,i)= mwm(f(2), dd(i), numW1(1), numW2(1), numFl(2));
    
    lossBuilding1(7,i)= mwm(f(3), dd(i), numW1(1), numW2(1), numFl(1));
    lossBuilding1(8,i)= mwm(f(3), dd(i), numW1(2), numW2(1), numFl(1));
    lossBuilding1(9,i)= mwm(f(3), dd(i), numW1(1), numW2(1), numFl(2));

end

figure;
plot(dd2,lossBuilding1(1,:),'-go',dd2,lossBuilding1(2,:),'-gd',dd2,lossBuilding1(3,:),'-gs',dd2,lossBuilding1(4,:),'-ro',dd2,lossBuilding1(5,:),'-rd',dd2,lossBuilding1(6,:),'-rs',dd2,lossBuilding1(7,:),'-ko',dd2,lossBuilding1(8,:),'-kd',dd2,lossBuilding1(9,:),'-ks');
title('Path Loss vs Distance, Building with wooden walls');
legend('f=800MHz, Best case', 'f=800MHz, Multiple Walls', 'f=800MHz, Multiple floors', 'f=1400MHz, Best Case', 'f=1400MHz, Multiple Walls', 'f=1400MHz, Multiple Floors','f=2000MHz, Best Case', 'f=2000MHz, Multiple Walls', 'f=2000MHz, Multiple Floors', 'Location', 'southeast');
ylabel('Path Loss (dB)');
xlabel('Distance (m)');
grid on;

% Building with thick walls
for i = 1:length(dd)
    
    lossBuilding2(1,i)= mwm(f(1), dd(i), numW1(1), numW2(1), numFl(1));
    lossBuilding2(2,i)= mwm(f(1), dd(i), numW1(1), numW2(2), numFl(1));
    lossBuilding2(3,i)= mwm(f(1), dd(i), numW1(1), numW2(1), numFl(2));
    
    lossBuilding2(4,i)= mwm(f(2), dd(i), numW1(1), numW2(1), numFl(1));
    lossBuilding2(5,i)= mwm(f(2), dd(i), numW1(1), numW2(2), numFl(1));
    lossBuilding2(6,i)= mwm(f(2), dd(i), numW1(1), numW2(1), numFl(2));
    
    lossBuilding2(7,i)= mwm(f(3), dd(i), numW1(1), numW2(1), numFl(1));
    lossBuilding2(8,i)= mwm(f(3), dd(i), numW1(1), numW2(2), numFl(1));
    lossBuilding2(9,i)= mwm(f(3), dd(i), numW1(1), numW2(1), numFl(2));

end

figure;
plot(dd,lossBuilding2(1,:),'-go',dd,lossBuilding2(2,:),'-gd',dd,lossBuilding2(3,:),'-gs',dd,lossBuilding2(4,:),'-ro',dd,lossBuilding2(5,:),'-rd',dd,lossBuilding2(6,:),'-rs',dd,lossBuilding2(7,:),'-ko',dd,lossBuilding2(8,:),'-kd',dd,lossBuilding2(9,:),'-ks');
title('Path Loss vs Distance, Building with concrete walls');
legend('f=800MHz, Best case', 'f=800MHz, Multiple Walls', 'f=800MHz, Multiple floors', 'f=1400MHz, Best Case', 'f=1400MHz, Multiple Walls', 'f=1400MHz, Multiple Floors','f=2000MHz, Best Case', 'f=2000MHz, Multiple Walls', 'f=2000MHz, Multiple Floors', 'Location', 'southeast');
ylabel('Path Loss (dB)');
xlabel('Distance (m)');
grid on;

% Building with thin walls
for i = 1:length(ff)
    
    lossBuilding2(1,i)= mwm(ff(i), d(1), numW1(1), numW2(1), numFl(1));
    lossBuilding2(2,i)= mwm(ff(i), d(1), numW1(2), numW2(1), numFl(1));
    lossBuilding2(3,i)= mwm(ff(i), d(1), numW1(1), numW2(1), numFl(2));
    
    lossBuilding2(4,i)= mwm(ff(i), d(2), numW1(1), numW2(1), numFl(1));
    lossBuilding2(5,i)= mwm(ff(i), d(2), numW1(2), numW2(1), numFl(1));
    lossBuilding2(6,i)= mwm(ff(i), d(2), numW1(1), numW2(1), numFl(2));
    
    lossBuilding2(7,i)= mwm(ff(i), d(3), numW1(1), numW2(1), numFl(1));
    lossBuilding2(8,i)= mwm(ff(i), d(3), numW1(2), numW2(1), numFl(1));
    lossBuilding2(9,i)= mwm(ff(i), d(3), numW1(1), numW2(1), numFl(2));

end

figure;
plot(ff,lossBuilding2(1,:),'-go',ff,lossBuilding2(2,:),'-gd',ff,lossBuilding2(3,:),'-gs',ff,lossBuilding2(4,:),'-ro',ff,lossBuilding2(5,:),'-rd',ff,lossBuilding2(6,:),'-rs',ff,lossBuilding2(7,:),'-ko',ff,lossBuilding2(8,:),'-kd',ff,lossBuilding2(9,:),'-ks');
title('Path Loss vs Frequency, Building with wooden walls');
legend('d=5m, Best case', 'd=5m, Multiple Walls', 'd=5m, Multiple floors', 'd=10m, Best Case', 'd=10m, Multiple Walls', 'd=10m, Multiple Floors','d=15m, Best Case', 'd=15m, Multiple Walls', 'd=15m, Multiple Floors', 'Location', 'southeast');
ylabel('Path Loss (dB)');
xlabel('Frequency (MHz)');
grid on;

% Building with thick walls
for i = 1:length(ff)
    
    lossBuilding2(1,i)= mwm(ff(i), d(1), numW1(1), numW2(1), numFl(1));
    lossBuilding2(2,i)= mwm(ff(i), d(1), numW1(1), numW2(2), numFl(1));
    lossBuilding2(3,i)= mwm(ff(i), d(1), numW1(1), numW2(1), numFl(2));
    
    lossBuilding2(4,i)= mwm(ff(i), d(2), numW1(1), numW2(1), numFl(1));
    lossBuilding2(5,i)= mwm(ff(i), d(2), numW1(1), numW2(2), numFl(1));
    lossBuilding2(6,i)= mwm(ff(i), d(2), numW1(1), numW2(1), numFl(2));
    
    lossBuilding2(7,i)= mwm(ff(i), d(3), numW1(1), numW2(1), numFl(1));
    lossBuilding2(8,i)= mwm(ff(i), d(3), numW1(1), numW2(2), numFl(1));
    lossBuilding2(9,i)= mwm(ff(i), d(3), numW1(1), numW2(1), numFl(2));

end

figure;
plot(ff,lossBuilding2(1,:),'-go',ff,lossBuilding2(2,:),'-gd',ff,lossBuilding2(3,:),'-gs',ff,lossBuilding2(4,:),'-ro',ff,lossBuilding2(5,:),'-rd',ff,lossBuilding2(6,:),'-rs',ff,lossBuilding2(7,:),'-ko',ff,lossBuilding2(8,:),'-kd',ff,lossBuilding2(9,:),'-ks');
title('Path Loss vs Frequency, Building with concrete walls');
legend('d=5m, Best case', 'd=5m, Multiple Walls', 'd=5m, Multiple floors', 'd=10m, Best Case', 'd=10m, Multiple Walls', 'd=10m, Multiple Floors','d=15m, Best Case', 'd=15m, Multiple Walls', 'd=15m, Multiple Floors', 'Location', 'southeast');
ylabel('Path Loss (dB)');
xlabel('Frequency (MHz)');
grid on;