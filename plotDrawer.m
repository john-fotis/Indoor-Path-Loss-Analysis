clc;
close all;

% ============== Standard parameters ==============
f = [800 1400 2000];
ff = 800:20:2000;
d = [3 6 9];
dd = [1:0.2:6 6.4:0.4:14 14.5:0.5:20];
numW1 = [0 4];
numW2 = [0 4];
numFl = [1 2];
loss = zeros(9, length(dd));

% =============== Custom parameters ===============
%f = input('Enter Signal Frequency [800-2000MHz]: ');
%numW1 = input('Enter number of thin walls: ');
%numW2 = input('Enter number of thick walls: ');
%numFl = input('Enter number of floors: ');

% Building with thin walls
for i = 1:length(dd)
    
    % Base frequency
    loss(1,i)= mwm(f(1), dd(i), numW1(1), numW2(1), numFl(1));
    loss(2,i)= mwm(f(1), dd(i), numW1(2), numW2(1), numFl(1));
    loss(3,i)= mwm(f(1), dd(i), numW1(1), numW2(1), numFl(2));
    
    % Increase frequency by 75%
    loss(4,i)= mwm(f(2), dd(i), numW1(1), numW2(1), numFl(1));
    loss(5,i)= mwm(f(2), dd(i), numW1(2), numW2(1), numFl(1));
    loss(6,i)= mwm(f(2), dd(i), numW1(1), numW2(1), numFl(2));
    
    % Increase frecuency by 150%
    loss(7,i)= mwm(f(3), dd(i), numW1(1), numW2(1), numFl(1));
    loss(8,i)= mwm(f(3), dd(i), numW1(2), numW2(1), numFl(1));
    loss(9,i)= mwm(f(3), dd(i), numW1(1), numW2(1), numFl(2));

end

figure;
plot(dd,loss(1,:),'-go',dd,loss(2,:),'-gd',dd,loss(3,:),'-gs',dd,loss(4,:),'-ro',dd,loss(5,:),'-rd',dd,loss(6,:),'-rs',dd,loss(7,:),'-ko',dd,loss(8,:),'-kd',dd,loss(9,:),'-ks');
title('Path Loss vs Distance, Building with wooden walls');
legend('f=800MHz, Best case', 'f=800MHz, Multiple Walls', 'f=800MHz, Multiple floors', 'f=1400MHz, Best Case', 'f=1400MHz, Multiple Walls', 'f=1400MHz, Multiple Floors','f=2000MHz, Best Case', 'f=2000MHz, Multiple Walls', 'f=2000MHz, Multiple Floors', 'Location', 'southeast');
ylabel('Path Loss (dB)');
xlabel('Distance (m)');
grid on;

% Building with thick walls
for i = 1:length(dd)
    
    % Base frequency
    loss(1,i)= mwm(f(1), dd(i), numW1(1), numW2(1), numFl(1));
    loss(2,i)= mwm(f(1), dd(i), numW1(1), numW2(2), numFl(1));
    loss(3,i)= mwm(f(1), dd(i), numW1(1), numW2(1), numFl(2));
    
    % Increase frequency by 75%
    loss(4,i)= mwm(f(2), dd(i), numW1(1), numW2(1), numFl(1));
    loss(5,i)= mwm(f(2), dd(i), numW1(1), numW2(2), numFl(1));
    loss(6,i)= mwm(f(2), dd(i), numW1(1), numW2(1), numFl(2));
    
    % Increase frequency by 150%
    loss(7,i)= mwm(f(3), dd(i), numW1(1), numW2(1), numFl(1));
    loss(8,i)= mwm(f(3), dd(i), numW1(1), numW2(2), numFl(1));
    loss(9,i)= mwm(f(3), dd(i), numW1(1), numW2(1), numFl(2));

end

figure;
plot(dd,loss(1,:),'-go',dd,loss(2,:),'-gd',dd,loss(3,:),'-gs',dd,loss(4,:),'-ro',dd,loss(5,:),'-rd',dd,loss(6,:),'-rs',dd,loss(7,:),'-ko',dd,loss(8,:),'-kd',dd,loss(9,:),'-ks');
title('Path Loss vs Distance, Building with concrete walls');
legend('f=800MHz, Best case', 'f=800MHz, Multiple Walls', 'f=800MHz, Multiple floors', 'f=1400MHz, Best Case', 'f=1400MHz, Multiple Walls', 'f=1400MHz, Multiple Floors','f=2000MHz, Best Case', 'f=2000MHz, Multiple Walls', 'f=2000MHz, Multiple Floors', 'Location', 'southeast');
ylabel('Path Loss (dB)');
xlabel('Distance (m)');
grid on;

% Building with thin walls
for i = 1:length(ff)
    
    % Base distance between transmitter-receiver
    loss(1,i)= mwm(ff(i), d(1), numW1(1), numW2(1), numFl(1));
    loss(2,i)= mwm(ff(i), d(1), numW1(2), numW2(1), numFl(1));
    loss(3,i)= mwm(ff(i), d(1), numW1(1), numW2(1), numFl(2));
    
    % Increase distance by 100%
    loss(4,i)= mwm(ff(i), d(2), numW1(1), numW2(1), numFl(1));
    loss(5,i)= mwm(ff(i), d(2), numW1(2), numW2(1), numFl(1));
    loss(6,i)= mwm(ff(i), d(2), numW1(1), numW2(1), numFl(2));
    
    % Increase distance by 200%
    loss(7,i)= mwm(ff(i), d(3), numW1(1), numW2(1), numFl(1));
    loss(8,i)= mwm(ff(i), d(3), numW1(2), numW2(1), numFl(1));
    loss(9,i)= mwm(ff(i), d(3), numW1(1), numW2(1), numFl(2));

end

figure;
plot(ff,loss(1,:),'-go',ff,loss(2,:),'-gd',ff,loss(3,:),'-gs',ff,loss(4,:),'-ro',ff,loss(5,:),'-rd',ff,loss(6,:),'-rs',ff,loss(7,:),'-ko',ff,loss(8,:),'-kd',ff,loss(9,:),'-ks');
title('Path Loss vs Frequency, Building with wooden walls');
legend('d=3m, Best case', 'd=3m, Multiple Walls', 'd=3m, Multiple floors', 'd=6m, Best Case', 'd=6m, Multiple Walls', 'd=6m, Multiple Floors','d=9m, Best Case', 'd=9m, Multiple Walls', 'd=9m, Multiple Floors', 'Location', 'southeast');
ylabel('Path Loss (dB)');
xlabel('Frequency (MHz)');
grid on;

% Building with thick walls
for i = 1:length(ff)
    
    % Base distance between transmitter-receiver
    loss(1,i)= mwm(ff(i), d(1), numW1(1), numW2(1), numFl(1));
    loss(2,i)= mwm(ff(i), d(1), numW1(1), numW2(2), numFl(1));
    loss(3,i)= mwm(ff(i), d(1), numW1(1), numW2(1), numFl(2));
    
    % Increase distance by 100%
    loss(4,i)= mwm(ff(i), d(2), numW1(1), numW2(1), numFl(1));
    loss(5,i)= mwm(ff(i), d(2), numW1(1), numW2(2), numFl(1));
    loss(6,i)= mwm(ff(i), d(2), numW1(1), numW2(1), numFl(2));
    
    % Increase distance by 200%
    loss(7,i)= mwm(ff(i), d(3), numW1(1), numW2(1), numFl(1));
    loss(8,i)= mwm(ff(i), d(3), numW1(1), numW2(2), numFl(1));
    loss(9,i)= mwm(ff(i), d(3), numW1(1), numW2(1), numFl(2));

end

figure;
plot(ff,loss(1,:),'-go',ff,loss(2,:),'-gd',ff,loss(3,:),'-gs',ff,loss(4,:),'-ro',ff,loss(5,:),'-rd',ff,loss(6,:),'-rs',ff,loss(7,:),'-ko',ff,loss(8,:),'-kd',ff,loss(9,:),'-ks');
title('Path Loss vs Frequency, Building with concrete walls');
legend('d=3m, Best case', 'd=3m, Multiple Walls', 'd=3m, Multiple floors', 'd=6m, Best Case', 'd=6m, Multiple Walls', 'd=6m, Multiple Floors','d=9m, Best Case', 'd=9m, Multiple Walls', 'd=9m, Multiple Floors', 'Location', 'southeast');
ylabel('Path Loss (dB)');
xlabel('Frequency (MHz)');
grid on;